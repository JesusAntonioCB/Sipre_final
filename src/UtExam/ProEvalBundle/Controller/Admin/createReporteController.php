<?php

namespace UtExam\ProEvalBundle\Controller\Admin;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\ORM\Tools\Pagination\Paginator;

class createReporteController extends Controller
{
  /**
     * Returns a JSON string with the neighborhoods of the City with the providen id.
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function listAction(){
      $em = $this->getDoctrine()->getManager();
      $user = $this->getUser();
      if ($user->hasRole("ROLE_SUPER_ADMIN")) {
        $queryExams = $em->createQuery('
          SELECT e
          FROM UtExam\ProEvalBundle\Entity\Examen e');
        $ExamsRes=$queryExams->getArrayResult();
        $queryExamsAuto = $em->createQuery('
          SELECT eA
          FROM UtExam\ProEvalBundle\Entity\ExamenAuto eA');
        $ExamsAutoRes=$queryExamsAuto->getArrayResult();
      }else {
        $queryExams = $em->createQuery('
          SELECT e
          FROM UtExam\ProEvalBundle\Entity\Examen e
          LEFT JOIN e.user u
          WHERE u.username = :userName');
        $queryExams->setParameter('userName', $user->getUserName());
        $ExamsRes=$queryExams->getArrayResult();
        $queryExamsAuto = $em->createQuery('
          SELECT eA
          FROM UtExam\ProEvalBundle\Entity\ExamenAuto eA
          LEFT JOIN eA.user u
          WHERE u.username = :userName');
        $queryExamsAuto->setParameter('userName', $user->getUserName());
        $ExamsAutoRes=$queryExamsAuto->getArrayResult();
      }
      $ExamsAutoRes=$queryExamsAuto->getArrayResult();
      $queryGen = $em->createQuery('
        SELECT DISTINCT substring(a.fecha, 1,4)
        FROM UtExam\ProEvalBundle\Entity\Alumnos a');
      $generationRes=$queryGen->getArrayResult();
      $queryGrup = $em->createQuery('
        SELECT DISTINCT a.grupo
        FROM UtExam\ProEvalBundle\Entity\Alumnos a');
      $grupRes=$queryGrup->getArrayResult();
      return $this->render('UtExamProEvalBundle::Admin/generateReport.html.twig', array(
        'exams' => $ExamsRes,
        'examsAuto' => $ExamsAutoRes,
        'generations' => $generationRes,
        'grupos' => $grupRes
      ));
    }
    public function getListExamAction(Request $request){
      $em = $this->getDoctrine()->getManager();
      $user=$request->query->get("user");
      $tipoExam=$request->query->get("tipoExam");

      if ($tipoExam == 1) {
        $query = $em->createQuery('
          SELECT partial E.{id, titulo}
          FROM UtExam\ProEvalBundle\Entity\Examen E
          LEFT JOIN E.user u
          WHERE u.id = :idUser');
          $query->setParameter('idUser', $user);
        $examenRes=$query->getArrayResult();
        return new JsonResponse($examenRes);
      }elseif ($tipoExam == 2) {
        $query = $em->createQuery('
          SELECT partial Ea.{id, titulo}
          FROM UtExam\ProEvalBundle\Entity\ExamenAuto Ea
          LEFT JOIN Ea.user u
          WHERE u.id = :idUser');
        $query->setParameter('idUser', $user);
        $examenAutoRes=$query->getArrayResult();
        return new JsonResponse($examenAutoRes);
      }else {
        return new JsonResponse("Error");
      }


    }

    public function getReportAction(){
      $em = $this->getDoctrine()->getManager();
      $typeReporte = "";
      $grupo = "";
      $turno = "";
      $generacion= "";
      $typeExam= "";
      $exam= "";
      if(isset($_GET)){
        if(isset($_GET["typeReporte"])) $typeReporte = $_GET["typeReporte"];
        if(isset($_GET["grupo"])) $grupo = $_GET["grupo"];
        if(isset($_GET["turno"])) $turno = $_GET["turno"];
        if(isset($_GET["generacion"])) $generacion = $_GET["generacion"];
        if(isset($_GET["typeExam"])) $typeExam = $_GET["typeExam"];
        if(isset($_GET["exam"])) $exam = explode("-", $_GET["exam"]);
      }
      if ($typeReporte=="generacion") {
        if ($exam[0] == "auto") {
          $alumnosPerGrupV= $this->getAlumnosPerGrup($generacion,(int)$exam[1],1,1);
          $alumnosPerGrupN= $this->getAlumnosPerGrup($generacion,(int)$exam[1],2,1);
          //-------traerme el examen--------
          $queryMaterias = $em->createQuery('
            SELECT DISTINCT mat.nombre,mat.id
            FROM UtExam\ProEvalBundle\Entity\ExamenAuto eA
            LEFT JOIN eA.preguntasAuto pA
            LEFT JOIN pA.materias mat
            WHERE eA.id = :EID');
          $queryMaterias->setParameter('EID', (int)$exam[1]);
          $materiasRep=$queryMaterias->getArrayResult();
        }else{
          $alumnosPerGrupV= $this->getAlumnosPerGrup($generacion,(int)$exam[1],1,2);
          $alumnosPerGrupN= $this->getAlumnosPerGrup($generacion,(int)$exam[1],2,2);
          //-------traerme el examen--------
          $queryMaterias = $em->createQuery('
            SELECT DISTINCT mat.nombre, mat.id
            FROM UtExam\ProEvalBundle\Entity\Examen e
            LEFT JOIN e.pregunta p
            LEFT JOIN p.pregunta preg
            LEFT JOIN preg.materias mat
            WHERE e.id = :EID');
          $queryMaterias->setParameter('EID', (int)$exam[1]);
          $materiasRep=$queryMaterias->getArrayResult();
        }
        if (empty($alumnosPerGrupV) && empty($alumnosPerGrupN)) {
          return new Response("Esta Combinación no se encuentra en la Base de Datos, Por favor vuelve a intentarlo o contacta a el Administrador");
        }else {
          return $this->render('UtExamProEvalBundle::Admin/tableReport.html.twig', [
              'generacion' => true,
              'materias' => $materiasRep,
              'AGV' => $alumnosPerGrupV,
              'AGN' => $alumnosPerGrupN
          ]);
        }

      }else {
        if ($exam[0] == "auto") {
          $grupWithAlumnos= $this->getGrupWithAlumnos($generacion,$grupo,(int)$exam[1],$turno,1);
        }else {
          $grupWithAlumnos= $this->getGrupWithAlumnos($generacion,$grupo,(int)$exam[1],$turno,2);
        }
        if (empty($grupWithAlumnos) && empty($alumnosPerGrupN)) {
          return new Response("El grupo seleccionado no existe prueba cambinado el turno");
        }else {
          if ($typeExam == "true") {
            $typeExam= true;
          }else {
            $typeExam= false;
          }
        return $this->render('UtExamProEvalBundle::Admin/tableReport.html.twig', [
            'generacion' => false,
            'propedeutico' => $typeExam,
            'grupo' => true,
            'GWA' => $grupWithAlumnos,
        ]);
        }
      }

      return new Response("success");
    }

    public function getAlumnosPerGrup($generacion,$exam,$turno,$typeExam){
      $em = $this->getDoctrine()->getManager();
      $alumnosPerGrup = [];
      if ($turno == 1) {
        $turno = "Vespertino";
      }else {
        $turno = "Nocturno";
      }
      if ($typeExam == 1) {
        //-------obtener alumnos--------
        $queryRep = $em->createQuery('
          SELECT a,m,maters,cali,caliM,caliMater,examAuto
          FROM UtExam\ProEvalBundle\Entity\Alumnos a
          LEFT JOIN a.maestros m
          LEFT JOIN a.calificaciones cali
          LEFT JOIN cali.examenAuto examAuto
          LEFT JOIN cali.caliMateria caliM
          LEFT JOIN caliM.materias caliMater
          LEFT JOIN m.materias maters
          WHERE substring(a.fecha, 1,4) = :idGen AND a.turno = :turno AND examAuto.id = :EID AND cali.evaluacion = :eval1
          OR    substring(a.fecha, 1,4) = :idGen AND a.turno = :turno AND examAuto.id = :EID AND cali.evaluacion= :eval2');
        $queryRep->setParameter('eval1', "Entrada");
        $queryRep->setParameter('eval2', "Salida");
        $queryRep->setParameter('idGen', $generacion);
        $queryRep->setParameter('EID', $exam);
        $queryRep->setParameter('turno', $turno);
        $generationVRes=$queryRep->getArrayResult();
        //-------obtener los solo grupos de alumnos--------
        $queryGrup = $em->createQuery('
          SELECT DISTINCT a.grupo
          FROM UtExam\ProEvalBundle\Entity\Alumnos a
          LEFT JOIN a.calificaciones cali
          LEFT JOIN cali.examenAuto examAuto
          WHERE substring(a.fecha, 1,4) = :idGen AND a.turno = :turno AND examAuto.id = :EID AND cali.evaluacion = :eval1
          OR    substring(a.fecha, 1,4) = :idGen AND a.turno = :turno AND examAuto.id = :EID AND cali.evaluacion= :eval2');
        $queryGrup->setParameter('eval1', "Entrada");
        $queryGrup->setParameter('eval2', "Salida");
        $queryGrup->setParameter('idGen', $generacion);
        $queryGrup->setParameter('EID', $exam);
        $queryGrup->setParameter('turno', $turno);
        $GrupoVRep=$queryGrup->getArrayResult();
        //----unirlos------
        foreach ($GrupoVRep as $grupo) {
          $tempoArray = [
            "grupo" => $grupo["grupo"],
            "alumnos" => []
          ];
          foreach ($generationVRes as $alumno) {
            if ($grupo["grupo"] == $alumno["grupo"]) {
              array_push($tempoArray["alumnos"],$alumno);
            }
          }
          array_push($alumnosPerGrup,$tempoArray);
        }
      }else {
        //-------obtener alumnos--------
        $queryRep = $em->createQuery('
          SELECT a,m,maters,cali,caliM,caliMater,exam
          FROM UtExam\ProEvalBundle\Entity\Alumnos a
          LEFT JOIN a.maestros m
          LEFT JOIN a.calificaciones cali
          LEFT JOIN cali.examen exam
          LEFT JOIN cali.caliMateria caliM
          LEFT JOIN caliM.materias caliMater
          LEFT JOIN m.materias maters
          WHERE substring(a.fecha, 1,4) = :idGen AND a.turno = :turno AND exam.id = :EID AND cali.evaluacion = :eval1
          OR    substring(a.fecha, 1,4) = :idGen AND a.turno = :turno AND exam.id = :EID AND cali.evaluacion= :eval2');
        $queryRep->setParameter('eval1', "Entrada");
        $queryRep->setParameter('eval2', "Salida");
        $queryRep->setParameter('idGen', $generacion);
        $queryRep->setParameter('EID', $exam);
        $queryRep->setParameter('turno', $turno);
        $generationVRes=$queryRep->getArrayResult();
        //-------obtener los solo grupos de alumnos--------
        $queryGrup = $em->createQuery('
          SELECT DISTINCT a.grupo
          FROM UtExam\ProEvalBundle\Entity\Alumnos a
          LEFT JOIN a.calificaciones cali
          LEFT JOIN cali.examen exam
          WHERE substring(a.fecha, 1,4) = :idGen AND a.turno = :turno AND exam.id = :EID AND cali.evaluacion = :eval1
          OR    substring(a.fecha, 1,4) = :idGen AND a.turno = :turno AND exam.id = :EID AND cali.evaluacion= :eval2');
        $queryGrup->setParameter('eval1', "Entrada");
        $queryGrup->setParameter('eval2', "Salida");
        $queryGrup->setParameter('idGen', $generacion);
        $queryGrup->setParameter('EID', $exam);
        $queryGrup->setParameter('turno', $turno);
        $GrupoVRep=$queryGrup->getArrayResult();
        //----unirlos------
        foreach ($GrupoVRep as $grupo) {
          $tempoArray = [
            "grupo" => $grupo["grupo"],
            "alumnos" => []
          ];
          foreach ($generationVRes as $alumno) {
            if ($grupo["grupo"] == $alumno["grupo"]) {
              array_push($tempoArray["alumnos"],$alumno);
            }
          }
          array_push($alumnosPerGrup,$tempoArray);
        }
      }
      return $alumnosPerGrup;
    }

    public function getGrupWithAlumnos($generacion,$grupo,$exam,$turno,$typeExam){
      $em = $this->getDoctrine()->getManager();
      $TempoGrupWithAlumnos = [
        'grupo' => $grupo,
        'turno' => $turno,
        'examen' => [],
        'materias' => [],
        'alumnos' => [],
      ];
      if ($typeExam == 1) {
        $queryGrup = $em->createQuery('
          SELECT a,m,maters,cali,caliM,caliMater,examAuto
          FROM UtExam\ProEvalBundle\Entity\Alumnos a
          LEFT JOIN a.maestros m
          LEFT JOIN a.calificaciones cali
          LEFT JOIN cali.examenAuto examAuto
          LEFT JOIN cali.caliMateria caliM
          LEFT JOIN caliM.materias caliMater
          LEFT JOIN m.materias maters
          WHERE substring(a.fecha, 1,4) = :idGen AND a.grupo = :idGrup AND a.turno = :idTurno AND examAuto.id = :EID
          ORDER BY a.nombre ASC');
          $queryGrup->setParameter('idGen', $generacion);
          $queryGrup->setParameter('idGrup', $grupo);
          $queryGrup->setParameter('EID', $exam);
          $queryGrup->setParameter('idTurno', $turno);
          $generationRes=$queryGrup->getArrayResult();
          //-------traerme el materias--------
          $queryMaterias = $em->createQuery('
            SELECT DISTINCT mat.nombre,mat.id
            FROM UtExam\ProEvalBundle\Entity\ExamenAuto eA
            LEFT JOIN eA.preguntasAuto pA
            LEFT JOIN pA.materias mat
            WHERE eA.id = :EID');
          $queryMaterias->setParameter('EID', $exam);
          $materiasRep=$queryMaterias->getArrayResult();
          $TempoGrupWithAlumnos["materias"]=$materiasRep;
          //-------traerme el examen--------
          $queryExamen = $em->createQuery('
            SELECT eA
            FROM UtExam\ProEvalBundle\Entity\ExamenAuto eA
            WHERE eA.id = :EID');
          $queryExamen->setParameter('EID', $exam);
          $examenRep=$queryExamen->getArrayResult();
          foreach ($examenRep as $examen) {
            $TempoGrupWithAlumnos["examen"]=$examen;
          }
      }else {
        $queryGrup = $em->createQuery('
          SELECT a,m,maters,cali,caliM,caliMater,exam
          FROM UtExam\ProEvalBundle\Entity\Alumnos a
          LEFT JOIN a.maestros m
          LEFT JOIN a.calificaciones cali
          LEFT JOIN cali.examen exam
          LEFT JOIN cali.caliMateria caliM
          LEFT JOIN caliM.materias caliMater
          LEFT JOIN m.materias maters
          WHERE substring(a.fecha, 1,4) = :idGen AND a.grupo = :idGrup AND a.turno = :idTurno AND exam.id = :EID
          ORDER BY a.nombre ASC');
        $queryGrup->setParameter('idGen', $generacion);
        $queryGrup->setParameter('idGrup', $grupo);
        $queryGrup->setParameter('EID', $exam);
        $queryGrup->setParameter('idTurno', $turno);
        $generationRes=$queryGrup->getArrayResult();
        //-------traerme el examen--------
        $queryMaterias = $em->createQuery('
          SELECT DISTINCT mat.nombre, mat.id
          FROM UtExam\ProEvalBundle\Entity\Examen e
          LEFT JOIN e.pregunta p
          LEFT JOIN p.pregunta preg
          LEFT JOIN preg.materias mat
          WHERE e.id = :EID');
        $queryMaterias->setParameter('EID', $exam);
        $materiasRep=$queryMaterias->getArrayResult();
        $TempoGrupWithAlumnos["materias"]=$materiasRep;
        //-------traerme el examen--------
        $queryExamen = $em->createQuery('
          SELECT e
          FROM UtExam\ProEvalBundle\Entity\Examen e
          WHERE e.id = :EID');
        $queryExamen->setParameter('EID', $exam);
        $examenRep=$queryExamen->getArrayResult();
        foreach ($examenRep as $examen) {
          $TempoGrupWithAlumnos["examen"]=$examen;
        }
      }
      $TempoGrupWithAlumnos["alumnos"] = $generationRes;
      return $TempoGrupWithAlumnos;
    }

}
