<?php

namespace UtExam\ProEvalBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use UtExam\ProEvalBundle\Entity\Alumnos;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use  UtExam\ProEvalBundle\Entity\ExamenAuto;

/**
 * @Route("/home")
 */
class DefaultController extends Controller
{
    public function indexAction(){
        if(false){
           $isLoggedIn = "true";
           $UID = $_SESSION["UID"];
           $em = $this->getDoctrine()->getManager();
           $query = $em->createQuery('
             SELECT a
             FROM UtExam\ProEvalBundle\Entity\Alumnos a
             WHERE a.codigoUsuario = :codeUser');
           $query->setParameter('codeUser', $UID);
           $ImageRes=$query->getArrayResult();
           dump($ImageRes);
           die;
           return $this->render('UtExamProEvalBundle:Examen:indexExam.html.twig',
             array(
               'userName'=> 'Antonio',
             )//final de array
           );//Final de return
        }
        else {
          dump("que?");
          $direccion= "propedeutico";
          return $this->render('UtExamProEvalBundle:Default:index.html.twig',
            array(
              'direccion' => $direccion,
            )
          );
        }
    }

    public function propedeuticoAction(){
        if(isset($_SESSION["UID"])){
          $isLoggedIn = "true";
          $UID = $_SESSION["UID"];
          $em = $this->getDoctrine()->getManager();
          $query = $em->createQuery('
            SELECT a, ma
            FROM UtExam\ProEvalBundle\Entity\Alumnos a
            LEFT JOIN a.examen ma
            WHERE a.codigoUsuario = :codeUser');
          $query->setParameter('codeUser', $UID);
          $userRes=$query->getArrayResult()[0]['nombre'];
          $userId=$query->getArrayResult()[0]['id'];
          // $json = file_get_contents('http://127.0.0.1:8000/api/v2/examen');
          // $service = json_decode($json);
          $query = $em->createQuery('
            SELECT partial p.{id}
            FROM UtExam\ProEvalBundle\Entity\ExamenAuto p');
          $NumberRes=$query->getArrayResult();
          //conseguir la misma cantidad de numeros random como preguntas existen
          $rand = range(0, count($NumberRes)-1);
          shuffle($rand);
          for ($i=0; $i < 1; $i++) {
            //agregar a el objeto las preguntas con los filtros correspondientes
            $examenRandom=$NumberRes[$rand[$i]]['id'];
            // dump($examenRandom);
            $query2 = $em->createQuery('
              SELECT e,partial u.{id, username}, pA, ma, p, res, text, aud, vid, img, paud, pvid, pimg
              FROM UtExam\ProEvalBundle\Entity\ExamenAuto e
              LEFT JOIN e.user u
              LEFT JOIN e.preguntasAuto pA
              LEFT JOIN pA.materias ma
              LEFT JOIN pA.pregunta p
              LEFT JOIN p.audio paud
              LEFT JOIN p.video pvid
              LEFT JOIN p.imagen pimg
              LEFT JOIN p.respuestas res
              LEFT JOIN res.texto text
              LEFT JOIN res.audio aud
              LEFT JOIN res.video vid
              LEFT JOIN res.imagen img
              WHERE e.id = :id');
            $query2->setParameter('id', $examenRandom);
            $examenRes=$query2->getArrayResult();

            $updateCali = $em->createQuery('
              UPDATE UtExam\ProEvalBundle\Entity\Alumnos A
              SET A.examenAuto = :examen
              WHERE A.id = :idUser');
            $updateCali->setParameter('examen', $examenRandom);
            $updateCali->setParameter('idUser', $userId);
            $updateCali->execute();
            return $this->render('UtExamProEvalBundle:Examen:indexExam.html.twig',
              array(
                'userName'=> $userRes,
                'Author'=> $examenRes[0]['user']['username'],
                'ExamDate'=>$examenRes[0]['fecha'],
                'ExamTitle'=>$examenRes[0]['instrucciones'],
                'preguntasGrup' => DefaultController::getAllQuestion($examenRes),
                'propedeutico'=>"PROPEDEUTICO"
              )//final de array
            );//Final de return
          }
        }
        else {
          return $this->render('UtExamProEvalBundle:Examen:login.html.twig');
        }
    }

    public function examenFijoAction(Request $request){
        // $codigoExam =$request->get('codigoExam');
        $codigoExam =$_GET['codeExam'];
        if(isset($_SESSION["UID"])){
          $isLoggedIn = "true";
          $UID = $_SESSION["UID"];
          $em = $this->getDoctrine()->getManager();
          $query = $em->createQuery('
            SELECT a
            FROM UtExam\ProEvalBundle\Entity\Alumnos a
            WHERE a.codigoUsuario = :codeUser');
          $query->setParameter('codeUser', $UID);
          $userRes=$query->getArrayResult()[0]['nombre'];
          $query = $em->createQuery('
            SELECT e,partial u.{id, username}, p, pr, ma, res, text, aud, vid, img, paud, pvid, pimg
            FROM UtExam\ProEvalBundle\Entity\Examen e
            LEFT JOIN e.user u
            LEFT JOIN e.pregunta p
            LEFT JOIN p.pregunta pr
            LEFT JOIN pr.materias ma
            LEFT JOIN pr.audio paud
            LEFT JOIN pr.video pvid
            LEFT JOIN pr.imagen pimg
            LEFT JOIN pr.respuestas res
            LEFT JOIN res.texto text
            LEFT JOIN res.audio aud
            LEFT JOIN res.video vid
            LEFT JOIN res.imagen img
            WHERE e.codigoExam = :codeExam');
          $query->setParameter('codeExam', $codigoExam);
          $examenRes=$query->getArrayResult();
          // $random= DefaultController::getAllQuestionFijo($examenRes);
          // dump($examenRes);
          // die;
          if (empty($examenRes)) {
            return $this->render('UtExamProEvalBundle:Default:pageError.html.twig');
          }

          return $this->render('UtExamProEvalBundle:Examen:indexExam.html.twig',
            array(
              'userName'=> $userRes,
              'examen'=> $examenRes,
              'Author'=> $examenRes[0]['user']['username'],
              'ExamDate'=>$examenRes[0]['fecha'],
              'ExamTitle'=>$examenRes[0]['instrucciones'],
              'preguntasGrup' => DefaultController::getAllQuestionFijo($examenRes),
              'propedeutico'=>false
            )//final de array
          );//Final de return
        }
        else {
          $em = $this->getDoctrine()->getManager();
          $query = $em->createQuery('
            SELECT e
            FROM UtExam\ProEvalBundle\Entity\Examen e
            WHERE e.codigoExam = :codeExam');
          $query->setParameter('codeExam', $codigoExam);
          $examenRes=$query->getArrayResult();
          if (empty($examenRes)) {
            return $this->render('UtExamProEvalBundle:Examen:login.html.twig',array('again' => true ));
          }
          return $this->render('UtExamProEvalBundle:Examen:login.html.twig');
        }
    }

    public function filteredQuestionsAction(Request $request){
      $em = $this->getDoctrine()->getManager();
      $banderaCompleta= true;
      $banderaMateria= true;
      $banderaTypePregunta= true;
      $banderaDificultad= true;
      $banderaMateria_TypePregunta = true;
      $banderaMateria_Dificultad = true;
      $banderaTypePregunta_Dificultad= true;
      $idOfMateria= $request->query->get("Materia");
      if ($idOfMateria === null) {
        $banderaMateria= false;
        $banderaMateria_TypePregunta = false;
        $banderaMateria_Dificultad = false;
        $banderaCompleta= false;
      }
      $idOfTypePregunta= $request->query->get("TypoPregunta");
      if ($idOfTypePregunta === null) {
        $banderaTypePregunta= false;
        $banderaMateria_TypePregunta = false;
        $banderaTypePregunta_Dificultad= false;
        $banderaCompleta= false;
      }
      $idOfDificultad= $request->query->get("Dificultad");
      if ($idOfDificultad === null) {
        $banderaDificultad= false;
        $banderaMateria_Dificultad = false;
        $banderaTypePregunta_Dificultad= false;
        $banderaCompleta= false;
      }
      if ($banderaCompleta) {
        $query = $em->createQuery('
          SELECT partial p.{id}
          FROM UtExam\ProEvalBundle\Entity\Pregunta p
          LEFT JOIN p.materias m
          LEFT JOIN p.tipoPregunta tip
          WHERE m.nombre = :idMateria
          AND tip.nombre = :idTypePregunta
          AND p.nivel = :nivel');
        $query->setParameter('nivel', $idOfDificultad );
        $query->setParameter('idMateria', $idOfMateria);
        $query->setParameter('idTypePregunta', $idOfTypePregunta);
        $numberRes=$query->getArrayResult();
        return new JsonResponse(count($numberRes));
      }elseif ($banderaMateria_TypePregunta) {
        $query = $em->createQuery('
          SELECT partial p.{id}
          FROM UtExam\ProEvalBundle\Entity\Pregunta p
          LEFT JOIN p.materias m
          LEFT JOIN p.tipoPregunta tip
          WHERE m.nombre = :idMateria
          AND tip.nombre = :idTypePregunta');
        $query->setParameter('idMateria', $idOfMateria);
        $query->setParameter('idTypePregunta', $idOfTypePregunta);
        $numberRes=$query->getArrayResult();
        return new JsonResponse(count($numberRes));
      }elseif ($banderaMateria_Dificultad) {
        $query = $em->createQuery('
          SELECT partial p.{id}
          FROM UtExam\ProEvalBundle\Entity\Pregunta p
          LEFT JOIN p.materias m
          WHERE m.nombre = :idMateria
          AND p.nivel = :nivel');
        $query->setParameter('nivel', $idOfDificultad );
        $query->setParameter('idMateria', $idOfMateria);
        $numberRes=$query->getArrayResult();
        return new JsonResponse(count($numberRes));
      }elseif ($banderaTypePregunta_Dificultad) {
        $query = $em->createQuery('
          SELECT partial p.{id}
          FROM UtExam\ProEvalBundle\Entity\Pregunta p
          LEFT JOIN p.tipoPregunta tip
          WHERE tip.nombre = :idTypePregunta
          AND p.nivel = :nivel');
        $query->setParameter('nivel', $idOfDificultad );
        $query->setParameter('idTypePregunta', $idOfTypePregunta);
        $numberRes=$query->getArrayResult();
        return new JsonResponse(count($numberRes));
      }elseif ($banderaMateria) {
        $query = $em->createQuery('
          SELECT partial p.{id}
          FROM UtExam\ProEvalBundle\Entity\Pregunta p
          LEFT JOIN p.materias m
          WHERE m.nombre = :idMateria');
        $query->setParameter('idMateria', $idOfMateria);
        $numberRes=$query->getArrayResult();
        return new JsonResponse(count($numberRes));
      }elseif ($banderaTypePregunta) {
        $query = $em->createQuery('
          SELECT partial p.{id}
          FROM UtExam\ProEvalBundle\Entity\Pregunta p
          LEFT JOIN p.tipoPregunta tip
          WHERE tip.nombre = :idTypePregunta');
        $query->setParameter('idTypePregunta', $idOfTypePregunta);
        $numberRes=$query->getArrayResult();
        // dump($numberRes);
        // die;
        return new JsonResponse(count($numberRes));
      }elseif ($banderaDificultad) {
        $query = $em->createQuery('
          SELECT partial p.{id}
          FROM UtExam\ProEvalBundle\Entity\Pregunta p
          WHERE p.nivel = :idTypeNivel');
        $query->setParameter('idTypeNivel', $idOfDificultad);
        $numberRes=$query->getArrayResult();
        // dump($numberRes);
        // die;
        return new JsonResponse(count($numberRes));
      }
    }

    public function registerAction(){
      if (session_status() == PHP_SESSION_ACTIVE) {
        session_destroy();
      }
      session_start();
      $usercode= chr(rand(ord("a"), ord("z"))).rand(1, 9).chr(rand(ord("a"), ord("z"))).
                 chr(rand(ord("a"), ord("z"))).rand(1, 9).chr(rand(ord("a"), ord("z"))).
                 chr(rand(ord("a"), ord("z"))).rand(1, 9).chr(rand(ord("a"), ord("z"))).
                 rand(1, 9).rand(1, 9).chr(rand(ord("a"), ord("z"))).rand(1, 9).rand(1, 9).
                 chr(rand(ord("a"), ord("z"))).rand(1, 9).chr(rand(ord("a"), ord("z"))).
                 chr(rand(ord("a"), ord("z"))).rand(1, 9).chr(rand(ord("a"), ord("z")));
      $_SESSION["UID"] = $usercode;
      date_default_timezone_set('America/Monterrey');
      $em = $this->getDoctrine()->getManager();
      $valueName = $_POST['alumno'];
      $valueCarrera = $_POST['carrera'];
      $valueTurno = $_POST['turno'];
      $alumno = new Alumnos();
      $alumno->setNombre($valueName);
      $alumno->setTurno($valueTurno);
      $alumno->setFecha(date('Y-m-d H:i:s'));
      $alumno->setTiempo(0);
      $alumno->setCalificacion(0);
      $alumno->setCodigoUsuario($usercode);
      $alumno->setCarrera($valueCarrera);
      $em ->persist($alumno);
      $em->flush();
      die;
      return new Response('success');
      // return $this->render('UtExamProEvalBundle:Examen:indexExam.html.twig',
      //   array(
      //     'userName'=> $valueName,
      //     'userCarrera' => $valueCarrera,
      //     'userTurno'=>$valueTurno,
      //   )//final de array);
      // );//Final de return
    }
    public function getMateriasAction(Request $request){
      $em = $this->getDoctrine()->getManager();
      $dificultad = $request->query->get("dificultad");
      $query = $em->createQuery('
        SELECT m
        FROM UtExam\ProEvalBundle\Entity\Materias m
        WHERE m.grado = :id');
      $query->setParameter('id', $dificultad);
      $examenRes=$query->getArrayResult();
      // dump($examenRes);
      // die;
      return new JsonResponse($examenRes);

    }
    public function getAllQuestion($examenRes){
      $questions=$examenRes[0]['preguntasAuto'];
      return $questions;
    }
    public function getAllQuestionFijo($examenRes){
      $questions=$examenRes[0]['pregunta'];
      return $questions;
    }
    public function getResultsAction(){
      $em = $this->getDoctrine()->getManager();
      $respuestas= $_POST['respuestas'];
      $preguntas= (int)$_POST['dquestion'];
      if ($preguntas < sizeof($respuestas, 0)) {
        $preguntas= 50;
      }
      $time= $_POST['time'];
      $RCorect=0;
      foreach ($respuestas as $value) {
        $type=$value[0];
        $RId=$value[1];
        if ($type=== "texto") {
          $querytext = $em->createQuery('
            SELECT partial t.{id, correcto}
            FROM UtExam\ProEvalBundle\Entity\Texto t
            WHERE t.id = :idtexto');
          $querytext->setParameter('idtexto', $RId);
          $isCorect=$querytext->getArrayResult()[0]["correcto"];
          if ($isCorect) {
            $RCorect += 1;
          }
        }
        if ($type=== "video") {
          $querytext = $em->createQuery('
            SELECT partial v.{id, correcto}
            FROM UtExam\ProEvalBundle\Entity\Video v
            WHERE v.id = :idvideo');
          $querytext->setParameter('idvideo', $RId);
          $isCorect=$querytext->getArrayResult()[0]["correcto"];
          if ($isCorect) {
            $RCorect += 1;
          }
        }
        if ($type=== "imagen") {
          $querytext = $em->createQuery('
            SELECT partial I.{id, correcto}
            FROM UtExam\ProEvalBundle\Entity\Imagen I
            WHERE I.id = :idimagen');
          $querytext->setParameter('idimagen', $RId);
          $isCorect=$querytext->getArrayResult()[0]["correcto"];
          if ($isCorect) {
            $RCorect += 1;
          }
        }
        if ($type=== "audio") {
          $querytext = $em->createQuery('
            SELECT partial a.{id, correcto}
            FROM UtExam\ProEvalBundle\Entity\Audio a
            WHERE a.id = :idaudio');
          $querytext->setParameter('idaudio', $RId);
          $isCorect=$querytext->getArrayResult()[0]["correcto"];
          if ($isCorect) {
            $RCorect += 1;
          }
        }
      }
      $calificacion=($RCorect/$preguntas)*100;
      $calificacion= round($calificacion,2);
      if ($_SESSION["UID"]) {
        $UID = $_SESSION["UID"];
        $updateCali = $em->createQuery('
          UPDATE UtExam\ProEvalBundle\Entity\Alumnos A
          SET A.calificacion = :calificacion ,
          A.tiempo = :time
          WHERE A.codigoUsuario = :idUser');
        $updateCali->setParameter('calificacion', $calificacion);
        $updateCali->setParameter('time', $time);
        $updateCali->setParameter('idUser', $UID);
        $updateCali->execute();

      }else {
        return new Response("Error: La sesion a caducado");
      }
      session_destroy();
      return new Response($calificacion);
    }

    public function openModalCodeExamAction(){
      return $this->render('UtExamProEvalBundle:modals:modalCodeExam.html.twig');
    }
}
