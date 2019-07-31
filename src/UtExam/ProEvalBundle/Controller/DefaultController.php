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
           return $this->render('UtExamProEvalBundle:Examen:indexExam.html.twig',
             array(
               'userName'=> 'Antonio',
             )//final de array
           );//Final de return
        }
        else {
          $direccion= "propedeutico";
          return $this->render('UtExamProEvalBundle:Default:index.html.twig',
            array(
              'direccion' => $direccion
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
          $em = $this->getDoctrine()->getManager();
          $query = $em->createQuery('
            SELECT m, mat
            FROM UtExam\ProEvalBundle\Entity\Maestros m
            LEFT JOIN m.materias mat');
          $lisMaestrosRes=$query->getArrayResult();
          // dump($lisMaestrosRes);
          return $this->render('UtExamProEvalBundle:Examen:login.html.twig',array(
            'maestros' => $lisMaestrosRes
          ));
        }
    }

    public function loginAction(){
      if (session_status() == PHP_SESSION_ACTIVE) {
        session_destroy();
      }
      session_start();
      $em = $this->getDoctrine()->getManager();
      $valuePass= $_POST['pass'];
      $valueUserName= $_POST['userName'];
      // dump("antes");
      $query = $em->createQuery('
        SELECT a
        FROM UtExam\ProEvalBundle\Entity\Alumnos a
        WHERE a.username = :user
        AND a.contrasena = :pass');
      $query->setParameter('user', $valueUserName);
      $query->setParameter('pass', $valuePass);
      $userRes=$query->getArrayResult();
      if (empty($userRes)){
        return new Response('Nombre de usuario o contraseña Erroneo');
      }
      //crear sesion
      // dump($userRes);
      $usercode = $userRes[0]["codigoUsuario"];
      $_SESSION["UID"] = $usercode;
      setcookie("examen", "Salida", 0);
      return new Response('success');
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
          $userId=$query->getArrayResult()[0]['id'];
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
          $updateExam = $em->createQuery('
            UPDATE UtExam\ProEvalBundle\Entity\Alumnos A
            SET A.examen= :examen
            WHERE A.id = :idUser');
          $updateExam->setParameter('examen', $examenRes[0]['id']);
          $updateExam->setParameter('idUser', $userId);
          $updateExam->execute();
          // $random= DefaultController::getAllQuestionFijo($examenRes);
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
        return new JsonResponse(count($numberRes));
      }elseif ($banderaDificultad) {
        $query = $em->createQuery('
          SELECT partial p.{id}
          FROM UtExam\ProEvalBundle\Entity\Pregunta p
          WHERE p.nivel = :idTypeNivel');
        $query->setParameter('idTypeNivel', $idOfDificultad);
        $numberRes=$query->getArrayResult();
        return new JsonResponse(count($numberRes));
      }
    }

    public function registerAction(){
      if (session_status() == PHP_SESSION_ACTIVE) {
        session_destroy();
      }
      $usercode= chr(rand(ord("a"), ord("z"))).rand(1, 9).chr(rand(ord("a"), ord("z"))).
                 chr(rand(ord("a"), ord("z"))).rand(1, 9).chr(rand(ord("a"), ord("z"))).
                 chr(rand(ord("a"), ord("z"))).rand(1, 9).chr(rand(ord("a"), ord("z"))).
                 rand(1, 9).rand(1, 9).chr(rand(ord("a"), ord("z"))).rand(1, 9).rand(1, 9).
                 chr(rand(ord("a"), ord("z"))).rand(1, 9).chr(rand(ord("a"), ord("z"))).
                 chr(rand(ord("a"), ord("z"))).rand(1, 9).chr(rand(ord("a"), ord("z")));
      date_default_timezone_set('America/Monterrey');
      $em = $this->getDoctrine()->getManager();
      $valueName = $_POST['alumno'];
      $valueCarrera = $_POST['carrera'];
      $valueTurno = $_POST['turno'];
      $valueGrupo = $_POST['grupo'];
      $valuePass= $_POST['pass'];
      $valueUserName= $_POST['userName'];
      $valueMaestro1= $this->getDoctrine()
                     ->getRepository("UtExam\ProEvalBundle\Entity\Maestros")
                     ->find((int)$_POST['maestro1']);
      $valueMaestro2= $this->getDoctrine()
                     ->getRepository("UtExam\ProEvalBundle\Entity\Maestros")
                     ->find((int)$_POST['maestro2']);
      $valueMaestro3= $this->getDoctrine()
                     ->getRepository("UtExam\ProEvalBundle\Entity\Maestros")
                     ->find((int)$_POST['maestro3']);
      $valueEval = $_POST['evaluacion'];
      // dump($_POST['maestro1']);
      // dump($_POST['maestro2']);
      // dump($_POST['maestro3']);
      try {
        $alumno = new Alumnos();
        $alumno->setNombre($valueName);
        $alumno->setUsername($valueUserName);
        $alumno->setTurno($valueTurno);
        $alumno->setContrasena($valuePass);
        $alumno->setFecha(date('Y-m-d H:i:s'));
        $alumno->setTiempo(0);
        $alumno->setCalificacionE1(0);
        $alumno->setCalificacionE2(0);
        $alumno->setCalificacionE3(0);
        $alumno->setCalificacionS1(0);
        $alumno->setCalificacionS2(0);
        $alumno->setCalificacionS3(0);
        $alumno->setCodigoUsuario($usercode);
        $alumno->setCarrera($valueCarrera);
        $alumno->setGrupo($valueGrupo);
        $alumno->addMaestro($valueMaestro1);
        $alumno->addMaestro($valueMaestro2);
        $alumno->addMaestro($valueMaestro3);
        $alumno->setEvaluacion($valueEval);
        $em->persist($alumno);
        $em->flush();
        session_start();
        $_SESSION["UID"] = $usercode;
        setcookie("examen", "Entrada", 0);
        return new Response('Registro exitoso');
      } catch (\Exception $e) {
        if ($e->getPrevious()->getSQLState()==="23000") {
          return new Response('Error: El usuario ingresado ya existe');
        }else {
          return new Response('Error: '.$e->getPrevious()->getMessage());
        }
      }
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
      $examen= $_COOKIE["examen"];
      if ($preguntas < sizeof($respuestas, 0)) {
        $preguntas= 50;
      }
      $time= $_POST['time'];
      $RCorect1=0;
      $RCorect2=0;
      $RCorect3=0;
      $Mat1="";
      $Mat2="";
      $Mat3="";
      $preg1=0;
      $preg2=0;
      $preg3=0;
      $calificacion1=0;
      $calificacion2=0;
      $calificacion3=0;
      $materiaTempo=[];
      foreach ($respuestas as $value) {
        $type=$value[0];
        $RId=$value[1];
        if ($type=== "texto") {
          $querytext = $em->createQuery('
            SELECT partial t.{id, correcto}, partial r.{id}, partial p.{id}, m
            FROM UtExam\ProEvalBundle\Entity\Texto t
            LEFT JOIN t.respuestas r
            LEFT JOIN r.pregunta p
            LEFT JOIN p.materias m
            WHERE t.id = :idtexto');
          $querytext->setParameter('idtexto', $RId);
          $respuestaRes=$querytext->getArrayResult()[0];
          $isCorect=$respuestaRes["correcto"];
          $materia= $respuestaRes["respuestas"][0]["pregunta"]["materias"]["nombre"];
          if ($Mat1 == "") {
            $Mat1=$materia;
          }elseif ($Mat2 == "") {
            if ($Mat1!=$materia) {
              $Mat2=$materia;
            }
          }  elseif ($Mat3 == "") {
            if ($Mat2!=$materia) {
              $Mat3=$materia;
            }
          }
          if ($Mat1==$materia) {
            $preg1 += 1;
            if ($isCorect) {
              $RCorect1 += 1;
            }
          }
          if ($Mat2==$materia) {
            $preg2 += 1;
            if ($isCorect) {
              $RCorect2 += 1;
            }
          }
          if ($Mat3==$materia) {
            $preg3 += 1;
            if ($isCorect) {
              $RCorect3 += 1;
            }
          }
        }
        if ($type=== "video") {
          $queryVid = $em->createQuery('
            SELECT partial v.{id, correcto}, partial r.{id}, partial p.{id}, m
            FROM UtExam\ProEvalBundle\Entity\Video v
            LEFT JOIN v.respuestas r
            LEFT JOIN r.pregunta p
            LEFT JOIN p.materias m
            WHERE v.id = :idvideo');
          $queryVid->setParameter('idvideo', $RId);
          $resVidResult=$queryVid->getArrayResult()[0];
          $isCorect=$resVidResult["correcto"];
          $materia= $resVidResult["respuestas"][0]["pregunta"]["materias"]["nombre"];
          if ($Mat1 == "") {
            $Mat1=$materia;
          }elseif ($Mat2 == "") {
            if ($Mat1!=$materia) {
              $Mat2=$materia;
            }
          }  elseif ($Mat3 == "") {
            if ($Mat2!=$materia) {
              $Mat3=$materia;
            }
          }
          if ($Mat1==$materia) {
            $preg1 += 1;
            if ($isCorect) {
              $RCorect1 += 1;
            }
          }
          if ($Mat2==$materia) {
            $preg2 += 1;
            if ($isCorect) {
              $RCorect2 += 1;
            }
          }
          if ($Mat3==$materia) {
            $preg3 += 1;
            if ($isCorect) {
              $RCorect3 += 1;
            }
          }
        }
        if ($type=== "imagen") {
          $queryimg = $em->createQuery('
            SELECT partial I.{id, correcto}, partial r.{id}, partial p.{id}, m
            FROM UtExam\ProEvalBundle\Entity\Imagen I
            LEFT JOIN I.respuestas r
            LEFT JOIN r.pregunta p
            LEFT JOIN p.materias m
            WHERE I.id = :idimagen');
          $queryimg->setParameter('idimagen', $RId);
          $resImgResult=$queryimg->getArrayResult()[0];
          $isCorect=$resImgResult["correcto"];
          $materia= $resImgResult["respuestas"][0]["pregunta"]["materias"]["nombre"];
          if ($Mat1 == "") {
            $Mat1=$materia;
          }elseif ($Mat2 == "") {
            if ($Mat1!=$materia) {
              $Mat2=$materia;
            }
          }  elseif ($Mat3 == "") {
            if ($Mat2!=$materia) {
              $Mat3=$materia;
            }
          }
          if ($Mat1==$materia) {
            $preg1 += 1;
            if ($isCorect) {
              $RCorect1 += 1;
            }
          }
          if ($Mat2==$materia) {
            $preg2 += 1;
            if ($isCorect) {
              $RCorect2 += 1;
            }
          }
          if ($Mat3==$materia) {
            $preg3 += 1;
            if ($isCorect) {
              $RCorect3 += 1;
            }
          }
        }
        if ($type=== "audio") {
          $queryAud = $em->createQuery('
            SELECT partial a.{id, correcto}, partial r.{id}, partial p.{id}, m
            FROM UtExam\ProEvalBundle\Entity\Audio a
            LEFT JOIN a.respuestas r
            LEFT JOIN r.pregunta p
            LEFT JOIN p.materias m
            WHERE a.id = :idaudio');
          $queryAud->setParameter('idaudio', $RId);
          $resAudResult=$queryAud->getArrayResult()[0];
          $isCorect=$resAudResult["correcto"];
          $materia= $resAudResult["respuestas"][0]["pregunta"]["materias"]["nombre"];
          if ($Mat1 == "") {
            $Mat1=$materia;
          }elseif ($Mat2 == "") {
            if ($Mat1!=$materia) {
              $Mat2=$materia;
            }
          }  elseif ($Mat3 == "") {
            if ($Mat2!=$materia) {
              $Mat3=$materia;
            }
          }
          if ($Mat1==$materia) {
            $preg1 += 1;
            if ($isCorect) {
              $RCorect1 += 1;
            }
          }
          if ($Mat2==$materia) {
            $preg2 += 1;
            if ($isCorect) {
              $RCorect2 += 1;
            }
          }
          if ($Mat3==$materia) {
            $preg3 += 1;
            if ($isCorect) {
              $RCorect3 += 1;
            }
          }
        }
      }
      if ($preg1 != 0) {
        $calificacion1=($RCorect1/$preg1)*100;
        $calificacion1= round($calificacion1,2);
      }
      if ($preg2 != 0) {
        $calificacion2=($RCorect2/$preg2)*100;
        $calificacion2= round($calificacion2,2);
      }
      if ($preg3 != 0) {
        $calificacion3=($RCorect3/$preg3)*100;
        $calificacion3= round($calificacion3,2);
      }
      if ($_SESSION["UID"]) {
        $UID = $_SESSION["UID"];
        if ($examen === "Entrada") {
          $updateCali = $em->createQuery('
            UPDATE UtExam\ProEvalBundle\Entity\Alumnos A
            SET A.calificacionE1 = :calificacion1 ,
            A.calificacionE2 = :calificacion2 ,
            A.calificacionE3 = :calificacion3 ,
            A.tiempo = :time
            WHERE A.codigoUsuario = :idUser');
          $updateCali->setParameter('calificacion1', $Mat1.":=".$calificacion1);
          $updateCali->setParameter('calificacion2', $Mat2.":=".$calificacion2);
          $updateCali->setParameter('calificacion3', $Mat3.":=".$calificacion3);
          $updateCali->setParameter('time', $time);
          $updateCali->setParameter('idUser', $UID);
          $updateCali->execute();
        }else {
          $updateCali = $em->createQuery('
            UPDATE UtExam\ProEvalBundle\Entity\Alumnos A
            SET A.calificacionS1 = :calificacion1 ,
            A.calificacionS2 = :calificacion2 ,
            A.calificacionS3 = :calificacion3 ,
            A.tiempo = :time
            WHERE A.codigoUsuario = :idUser');
          $updateCali->setParameter('calificacion1', $Mat1.":=".$calificacion1);
          $updateCali->setParameter('calificacion2', $Mat2.":=".$calificacion2);
          $updateCali->setParameter('calificacion3', $Mat3.":=".$calificacion3);
          $updateCali->setParameter('time', $time);
          $updateCali->setParameter('idUser', $UID);
          $updateCali->execute();
        }

      }else {
        return new Response("Error: La sesion a caducado");
      }
      session_destroy();
      setcookie("examen", "", -1);
      return new Response("Gracias por contestar");
    }

    public function openModalCodeExamAction(){
      return $this->render('UtExamProEvalBundle:modals:modalCodeExam.html.twig');
    }
}
