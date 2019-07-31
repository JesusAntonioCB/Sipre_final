<?php

namespace UtExam\ProEvalBundle\Controller\Admin;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
//use Doctrine paginator
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
      // $query = $em->createQuery('
      //   SELECT partial Ea.{id, titulo}
      //   FROM UtExam\ProEvalBundle\Entity\ExamenAuto Ea');
      // $examenRes=$query->getArrayResult();
      // dump($examenRes);
      $queryGen = $em->createQuery('
        SELECT DISTINCT substring(a.fecha, 1,4)
        FROM UtExam\ProEvalBundle\Entity\Alumnos a');
      $generationRes=$queryGen->getArrayResult();
      $queryGrup = $em->createQuery('
        SELECT DISTINCT a.grupo
        FROM UtExam\ProEvalBundle\Entity\Alumnos a');
      $grupRes=$queryGrup->getArrayResult();
      // dump($generationRes);
      // dump($grupRes);
      // die;
      return $this->render('UtExamProEvalBundle::Admin/generateReport.html.twig', array(
        'generations' => $generationRes,
        'grupos' => $grupRes
      )
      );
    }
    public function getListExamAction(Request $request){
      $em = $this->getDoctrine()->getManager();
      $user=$request->query->get("user");
      $tipoExam=$request->query->get("tipoExam");
      // $responseArray = array(
      //   'user' =>$user ,
      // 'sdfsdf'=>$TypoExam );

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
      if(isset($_GET)){
        if(isset($_GET["typeReporte"])) $typeReporte = $_GET["typeReporte"];
        if(isset($_GET["grupo"])) $grupo = $_GET["grupo"];
        if(isset($_GET["turno"])) $turno = $_GET["turno"];
        if(isset($_GET["generacion"])) $generacion = $_GET["generacion"];
        //if(isset($_POST["subscriptions"])) $subscriptions = $_POST["subscriptions"];
      }
      if ($typeReporte=="generacion") {
        $queryRep = $em->createQuery('
          SELECT a,m
          FROM UtExam\ProEvalBundle\Entity\Alumnos a
          LEFT JOIN a.maestros m
          WHERE substring(a.fecha, 1,4) = :idGen AND a.turno = :turno');
        $queryRep->setParameter('idGen', $generacion);
        $queryRep->setParameter('turno', "Vespertino");
        $generationVRes=$queryRep->getArrayResult();
        $query2Rep = $em->createQuery('
          SELECT a,m
          FROM UtExam\ProEvalBundle\Entity\Alumnos a
          LEFT JOIN a.maestros m
          WHERE substring(a.fecha, 1,4) = :idGen AND a.turno = :turno');
        $query2Rep->setParameter('idGen', $generacion);
        $query2Rep->setParameter('turno', "Nocturno");
        $generationNRes=$query2Rep->getArrayResult();
        if (empty($generationVRes)) {
          return new Response("Esta generación no se encuentra en la Base de Datos, Por favor vuelve a intentarlo o contacta a el Administrador");
        }else {
          $queryGrup = $em->createQuery('
            SELECT DISTINCT a.grupo
            FROM UtExam\ProEvalBundle\Entity\Alumnos a
            WHERE a.turno = :turno');
          $queryGrup->setParameter('turno', "Vespertino");
          $GrupoVRep=$queryGrup->getArrayResult();
          $query2Grup = $em->createQuery('
            SELECT DISTINCT a.grupo
            FROM UtExam\ProEvalBundle\Entity\Alumnos a
            WHERE a.turno = :turno');
          $query2Grup->setParameter('turno', "Nocturno");
          $GrupoNRep=$query2Grup->getArrayResult();
          return $this->render('UtExamProEvalBundle::Admin/tableReport.html.twig', [
              'generacion' => true,
              'GV' => $generationVRes,
              'GN' => $generationNRes,
              'gruposV' => $GrupoVRep,
              'gruposN' => $GrupoNRep
          ]);
        }

      }else {
        $queryRep = $em->createQuery('
          SELECT a
          FROM UtExam\ProEvalBundle\Entity\Alumnos a
          WHERE substring(a.fecha, 1,4) = :idGen AND a.grupo = :idGrup AND a.turno = :idTurno');
        $queryRep->setParameter('idGen', $generacion);
        $queryRep->setParameter('idGrup', $grupo);
        $queryRep->setParameter('idTurno', $turno);
        $generationRes=$queryRep->getArrayResult();
        if (empty($generationRes)) {
          return new Response("El grupo seleccionado no existe prueba cambinado el turno");
        }else {
          return $this->render('UtExamProEvalBundle::Admin/tableReport.html.twig', [
              'grupo' => true,
              'reporte' => $generationRes
          ]);
        }
      }

      return new Response("success");
    }

}
