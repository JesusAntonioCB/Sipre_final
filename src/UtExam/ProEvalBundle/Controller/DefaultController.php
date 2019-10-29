<?php

namespace UtExam\ProEvalBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use UtExam\ProEvalBundle\Entity\Alumnos;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use UtExam\ProEvalBundle\Entity\ExamenAuto;

class DefaultController extends Controller
{
    public function indexAction(){
        if(false){
           $isLoggedIn = "true";
           $UID = $_COOKIE["UID"];
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
        if(isset($_COOKIE["UID"])){
          $isLoggedIn = "true";
          $UID = $_COOKIE["UID"];
          $em = $this->getDoctrine()->getManager();
          $userQuery = $em->createQuery('
            SELECT a
            FROM UtExam\ProEvalBundle\Entity\Alumnos a
            WHERE a.codigoUsuario = :codeUser');
          $userQuery->setParameter('codeUser', $UID);
          $userRes=$userQuery->getArrayResult()[0]['nombre'];
          $userId=$userQuery->getArrayResult()[0]['id'];
          if (isset($_COOKIE["examenId"])) {
            $arrExam= explode("-", $_COOKIE["examenId"]);
            $type= $arrExam[0];
            $examenId=$arrExam[1];
            if ($type === "propedeutico") {
              //agregar a el objeto las preguntas con los filtros correspondientes
              $examenRes= $this->getExamen($examenId,1);
              if (empty($examenRes)) {
                return $this->render('UtExamProEvalBundle:Default:pageError.html.twig');
              }
              return $this->render('UtExamProEvalBundle:Examen:indexExam.html.twig',
                array(
                  'userName'=> $userRes,
                  'Author'=> $examenRes[0]['user']['username'],
                  'ExamDate'=> $examenRes[0]['fecha'],
                  'ExamTitle'=> $examenRes[0]['instrucciones'],
                  'ExamTiempo'=> $examenRes[0]['tiempo'],
                  'ExamId'=> $examenRes[0]['id'],
                  'preguntasGrup' => $this->getAllQuestion($examenRes),
                  'propedeutico'=> true
                )//final de array
              );//Final de return
            }else {
              $examenRes= $this->getExamen($examenId,2);
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
                  'ExamTiempo'=>$examenRes[0]['tiempo'],
                  'ExamId'=> $examenRes[0]['id'],
                  'preguntasGrup' => $this->getAllQuestionFijo($examenRes),
                  'propedeutico'=>false
                )//final de array
              );//Final de return
            }
          }else {
            $examQuery = $em->createQuery('
              SELECT partial eA.{id}
              FROM UtExam\ProEvalBundle\Entity\ExamenAuto eA
              WHERE eA.propedeutico = :boolean');
            $examQuery->setParameter('boolean', 1);
            $NumberRes=$examQuery->getArrayResult();
            $exam2Query = $em->createQuery('
              SELECT partial e.{id}
              FROM UtExam\ProEvalBundle\Entity\Examen e
              WHERE e.propedeutico = :boolean');
            $exam2Query->setParameter('boolean', 1);
            $Number2Res=$exam2Query->getArrayResult();
            if (!empty($examQuery)) {
              if (!empty($exam2Query)) {
                $numberExamRand = rand ( 1 , 2 );
              }else {
                $numberExamRand=1;
              }
            }elseif (!empty($exam2Query)) {
              $numberExamRand=2;
            }else {
              return $this->render('UtExamProEvalBundle:Default:pageError.html.twig');
            }
            if ($numberExamRand === 1) {
              //conseguir la misma cantidad de numeros random como examenes existen
              $rand = range(0, count($NumberRes)-1);
              shuffle($rand);
              for ($i=0; $i < 1; $i++) {
                //agregar a el objeto las preguntas con los filtros correspondientes
                $examenRandom=$NumberRes[$rand[$i]]['id'];
                $examenRes= $this->getExamen($examenRandom,1);
                $this->setExamenEnAlumno($examenRandom,$userId,1);
                if (empty($examenRes)) {
                  return $this->render('UtExamProEvalBundle:Default:pageError.html.twig');
                }
                return $this->render('UtExamProEvalBundle:Examen:indexExam.html.twig',
                  array(
                    'userName'=> $userRes,
                    'Author'=> $examenRes[0]['user']['username'],
                    'ExamDate'=> $examenRes[0]['fecha'],
                    'ExamTitle'=> $examenRes[0]['instrucciones'],
                    'ExamTiempo'=> $examenRes[0]['tiempo'],
                    'ExamId'=> $examenRes[0]['id'],
                    'preguntasGrup' => $this->getAllQuestion($examenRes),
                    'propedeutico'=> true
                  )//final de array
                );//Final de return
              }
            }else {
              $rand = range(0, count($Number2Res)-1);
              shuffle($rand);
              for ($i=0; $i < 1; $i++) {
                $examenRandom=$Number2Res[$rand[$i]]['id'];
                $examenRes= $this->getExamen($examenRandom,2);
                $this->setExamenEnAlumno($examenRes[0]['id'],$userId,2);
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
                    'ExamTiempo'=>$examenRes[0]['tiempo'],
                    'ExamId'=> $examenRes[0]['id'],
                    'preguntasGrup' => $this->getAllQuestionFijo($examenRes),
                    'propedeutico'=>false
                  )//final de array
                );//Final de return
              }
            }
          }
        }
        else {
          $em = $this->getDoctrine()->getManager();
          $query = $em->createQuery('
            SELECT m, mat
            FROM UtExam\ProEvalBundle\Entity\Maestros m
            LEFT JOIN m.materias mat');
          $lisMaestrosRes=$query->getArrayResult();
          return $this->render('UtExamProEvalBundle:Examen:login.html.twig',array(
            'maestros' => $lisMaestrosRes,
            'propedeutico'=> true
          ));
        }
    }

    public function examenFijoAction(Request $request){
        $codigoExam =$_GET['codeExam'];
        if(isset($_COOKIE["UID"])){
          $isLoggedIn = "true";
          $UID = $_COOKIE["UID"];
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
              'preguntasGrup' => $this->getAllQuestionFijo($examenRes),
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
          if (!empty($examenRes)) {
            $query = $em->createQuery('
              SELECT m, mat
              FROM UtExam\ProEvalBundle\Entity\Maestros m
              LEFT JOIN m.materias mat');
            $lisMaestrosRes=$query->getArrayResult();
            return $this->render('UtExamProEvalBundle:Examen:login.html.twig',array(
              'maestros' => $lisMaestrosRes,
              'propedeutico'=> false
            ));
          }else {
            return $this->render('UtExamProEvalBundle:Default:pageError.html.twig');
          }

        }
    }

    public function loginAction(){
      $em = $this->getDoctrine()->getManager();
      $valuePass= $_POST['pass'];
      $valueUserName= $_POST['userName'];
      $query = $em->createQuery('
        SELECT a
        FROM UtExam\ProEvalBundle\Entity\Alumnos a
        WHERE a.username = :user
        AND a.contrasena = :pass');
      $query->setParameter('user', $valueUserName);
      $query->setParameter('pass', $valuePass);
      $userRes=$query->getArrayResult();
      if (empty($userRes)){
        $responseArray = array(
          "mensaje" => "Nombre de usuario o contraseña Erroneo",
          "bandera" => false
         );
        return new JsonResponse($responseArray);
      }
      //crear sesion cookie
      $usercode = $userRes[0]["codigoUsuario"];
      $responseArray = array(
        "UID" => $usercode,
        "examen" => "Salida",
        "mensaje" => "Sesion iniciada correctamente",
        "bandera" => true
       );
      return new JsonResponse($responseArray);
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

    public function getResultsAction(){
      $em = $this->getDoctrine()->getManager();
      $examen= $_COOKIE["examen"];
      if ($_POST['respuestas']) {
        $respuestas= $_POST['respuestas'];
      }else {
        $respuestas=[];
      }
      if ($_POST['dquestion']) {
        $preguntas= (int)$_POST['dquestion'];
      }else {
        $preguntas= 0;
      }
      if ($preguntas < sizeof($respuestas, 0)) {
        $preguntas= 50;
      }
      $time= $_POST['time'];
      if ($_POST['QByGrup1']) {
        $Mat1= explode("=;", $_POST['QByGrup1'])[0];
        $preg1= (int)explode("=;", $_POST['QByGrup1'])[1];
      }else {
        $Mat1="";
        $preg1=0;
      }
      if ($_POST['QByGrup2']) {
        $Mat2= explode("=;", $_POST['QByGrup2'])[0];
        $preg2= (int)explode("=;", $_POST['QByGrup2'])[1];
      }else {
        $Mat2="";
        $preg2=0;
      }
      if ($_POST['QByGrup3']) {
        $Mat3= explode("=;", $_POST['QByGrup3'])[0];
        $preg3= (int)explode("=;", $_POST['QByGrup3'])[1];
      }else {
        $Mat3="";
        $preg3=0;
      }
      $RCorect1=0;
      $RCorect2=0;
      $RCorect3=0;
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
          if ($Mat1==$materia) {
            if ($isCorect) {
              $RCorect1 += 1;
            }
          }
          if ($Mat2==$materia) {
            if ($isCorect) {
              $RCorect2 += 1;
            }
          }
          if ($Mat3==$materia) {
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
          if ($Mat1==$materia) {
            if ($isCorect) {
              $RCorect1 += 1;
            }
          }
          if ($Mat2==$materia) {
            if ($isCorect) {
              $RCorect2 += 1;
            }
          }
          if ($Mat3==$materia) {
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
          if ($Mat1==$materia) {
            if ($isCorect) {
              $RCorect1 += 1;
            }
          }
          if ($Mat2==$materia) {
            if ($isCorect) {
              $RCorect2 += 1;
            }
          }
          if ($Mat3==$materia) {
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
          if ($Mat1==$materia) {
            if ($isCorect) {
              $RCorect1 += 1;
            }
          }
          if ($Mat2==$materia) {
            if ($isCorect) {
              $RCorect2 += 1;
            }
          }
          if ($Mat3==$materia) {
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
      if ($_COOKIE["UID"]) {
        $UID = $_COOKIE["UID"];
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
      return new Response("Gracias por contestar");
    }

    public function registerAction(){
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
        $responseArray = array(
          "UID" => $usercode,
          "examen" => "Entrada",
          "mensaje" => "Registro exitoso"
         );
        return new JsonResponse($responseArray);
      } catch (\Exception $e) {
        if (!is_null($e->getPrevious()->getSQLState())) {
          $responseArray = array(
            "mensaje" => "Error: El usuario ingresado ya existe"
           );
          return new JsonResponse($responseArray);
        }else {
          $responseArray = array(
            "mensaje" => 'Error: '.$e->getPrevious()->getMessage()
           );
          return new JsonResponse($responseArray);
        }
      }
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

    public function openModalCodeExamAction(){
      return $this->render('UtExamProEvalBundle:modals:modalCodeExam.html.twig');
    }

    public function getAllQuestion($examenRes){
      $questions=$examenRes[0]['preguntasAuto'];
      return $questions;
    }
    public function getAllQuestionFijo($examenRes){
      $questions=$examenRes[0]['pregunta'];
      return $questions;
    }
    public function getExamen($examenId,$type){
      $em = $this->getDoctrine()->getManager();
      if ((int)$type === 1) {
        $queryExam = $em->createQuery('
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
        $queryExam->setParameter('id', $examenId);
        $examenRes=$queryExam->getArrayResult();
        return $examenRes;
      }else {
        $queryExam = $em->createQuery('
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
          WHERE e.id = :id');
        $queryExam->setParameter('id', $examenId);
        $examenRes=$queryExam->getArrayResult();
        return $examenRes;
      }
    }
    public function setExamenEnAlumno($examenId,$userId,$type){
      $em = $this->getDoctrine()->getManager();
      if ((int)$type === 1) {
        $update = $em->createQuery('
          UPDATE UtExam\ProEvalBundle\Entity\Alumnos A
          SET A.examenAuto = :examen
          WHERE A.id = :idUser');
        $update->setParameter('examen', $examenId);
        $update->setParameter('idUser', $userId);
        $update->execute();
      }else {
        $update = $em->createQuery('
          UPDATE UtExam\ProEvalBundle\Entity\Alumnos A
          SET A.examen= :examen
          WHERE A.id = :idUser');
        $update->setParameter('examen', $examenId);
        $update->setParameter('idUser', $userId);
        $update->execute();
      }
    }
}
