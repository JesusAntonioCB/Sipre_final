<?php

namespace UtExam\ProEvalBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use UtExam\ProEvalBundle\Entity\Alumnos;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use UtExam\ProEvalBundle\Entity\ExamenAuto;
use UtExam\ProEvalBundle\Entity\Calificaciones;
use UtExam\ProEvalBundle\Entity\CalificacionesDeMaterias;

class DefaultController extends Controller
{
    public function indexAction(){
      $direccion= "propedeutico";
      return $this->render('UtExamProEvalBundle:Default:index.html.twig',
        array(
          'direccion' => $direccion
        )
      );
    }

    public function propedeuticoAction(){
      //preguntar si ya se inicio sesion
        if(isset($_COOKIE["UID"])){
          $isLoggedIn = "true";
          $UID = $_COOKIE["UID"];
          $em = $this->getDoctrine()->getManager();
          //pedimos el usuario basandonos en el codigo de usuario unico de cada alumno
          $alumnoRes = $this->getAlumno($UID);
          $userRes = $alumnoRes[0]['nombre'];
          $userId = $alumnoRes[0]['id'];
          //aqui es para que regrese el mismo examen si se recarga la pestaña o se cierra
          if (isset($_COOKIE["examenId"])) {
            $arrExam= explode("-", $_COOKIE["examenId"]);
            $type= $arrExam[0];
            $examenId=$arrExam[1];
            //si es un examen tipo auto o fijo
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
                  'Author'=> $examenRes[0]['user']['username'],
                  'ExamDate'=>$examenRes[0]['fecha'],
                  'ExamTitle'=>$examenRes[0]['instrucciones'],
                  'ExamTiempo'=>$examenRes[0]['tiempo'],
                  'ExamId'=> $examenRes[0]['id'],
                  'ExamMateria'=> $examenRes[0]['materiaModa'],
                  'ExamNivel'=> $examenRes[0]['nivel'],
                  'preguntas' => $this->getAllQuestionFijo($examenRes),
                  'propedeutico'=>false
                )//final de array
              );//Final de return
            }
          }else {
            //para averiguar los examenes que serviran como propedeuticos ya sean fijos o automaticos
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
            //una ves que tenemos los resultados tomaremos en cuenta que las consultas que
            //regresen vacias son porque no se eligieron en ese tipo de examen
            if (!empty($NumberRes)) {
              if (!empty($Number2Res)) {
                //cuando ambas contengan examenes que serviran como examen propedeutico
                //se tomara uno de los 2 randomizando la eleccion
                $numberExamRand = rand ( 1 , 2 );
              }else {
                $numberExamRand=1;
              }
            }elseif (!empty($Number2Res)) {
              $numberExamRand=2;
            }else {
              //si no se eligio ninguno entonces devolvera una pagina de error
              return $this->render('UtExamProEvalBundle:Default:pageError.html.twig');
            }
            if ($numberExamRand == 1) {
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
                    'Author'=> $examenRes[0]['user']['username'],
                    'ExamDate'=>$examenRes[0]['fecha'],
                    'ExamTitle'=>$examenRes[0]['instrucciones'],
                    'ExamTiempo'=>$examenRes[0]['tiempo'],
                    'ExamId'=> $examenRes[0]['id'],
                    'ExamMateria'=> $examenRes[0]['materiaModa'],
                    'ExamNivel'=> $examenRes[0]['nivel'],
                    'preguntas' => $this->getAllQuestionFijo($examenRes),
                    'propedeutico'=>false
                  )//final de array
                );//Final de return
              }
            }
          }
        }
        else {
          //llevara a la pagina donde podremos registrarnos o iniciar sesion
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
      $em = $this->getDoctrine()->getManager();
      $codigoExam =$_GET['codeExam'];
      if(isset($_COOKIE["UID"])){
        $isLoggedIn = "true";
        $UID = $_COOKIE["UID"];
        $query = $em->createQuery('
          SELECT a
          FROM UtExam\ProEvalBundle\Entity\Alumnos a
          WHERE a.codigoUsuario = :codeUser');
        $query->setParameter('codeUser', $UID);
        $userRes=$query->getArrayResult()[0]['nombre'];
        $userId=$query->getArrayResult()[0]['id'];

        $query = $em->createQuery('
          SELECT partial e.{id}
          FROM UtExam\ProEvalBundle\Entity\Examen e
          WHERE e.codigoExam = :codeExam');
        $query->setParameter('codeExam', $codigoExam);
        $examenRes=$query->getArrayResult();
        if (empty($examenRes)) {
          $query = $em->createQuery('
            SELECT partial e.{id}
            FROM UtExam\ProEvalBundle\Entity\ExamenAuto e
            WHERE e.codigoExam = :codeExam');
          $query->setParameter('codeExam', $codigoExam);
          $examenRes=$query->getArrayResult();
          if (empty($examenRes)) {
            return $this->render('UtExamProEvalBundle:Default:pageError.html.twig');
          }else {
            $examenId=$examenRes[0]['id'];
            $examenRes= $this->getExamen($examenId,1);
            $this->setExamenEnAlumno($examenRes[0]['id'],$userId,1);
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
          $examenId=$examenRes[0]['id'];
          $examenRes= $this->getExamen($examenId,2);
          $this->setExamenEnAlumno($examenRes[0]['id'],$userId,2);
          if (empty($examenRes)) {
            return $this->render('UtExamProEvalBundle:Default:pageError.html.twig');
          }
          return $this->render('UtExamProEvalBundle:Examen:indexExam.html.twig',
            array(
              'userName'=> $userRes,
              'Author'=> $examenRes[0]['user']['username'],
              'ExamDate'=>$examenRes[0]['fecha'],
              'ExamTitle'=>$examenRes[0]['instrucciones'],
              'ExamTiempo'=>$examenRes[0]['tiempo'],
              'ExamId'=> $examenRes[0]['id'],
              'ExamMateria'=> $examenRes[0]['materiaModa'],
              'ExamNivel'=> $examenRes[0]['nivel'],
              'preguntas' => $this->getAllQuestionFijo($examenRes),
              'propedeutico'=>false
            )//final de array
          );//Final de return
        }
      }else {
        $query = $em->createQuery('
          SELECT partial e.{id}
          FROM UtExam\ProEvalBundle\Entity\Examen e
          WHERE e.codigoExam = :codeExam');
        $query->setParameter('codeExam', $codigoExam);
        $examenRes=$query->getArrayResult();
        if (empty($examenRes)) {
          $query = $em->createQuery('
            SELECT partial e.{id}
            FROM UtExam\ProEvalBundle\Entity\ExamenAuto e
            WHERE e.codigoExam = :codeExam');
          $query->setParameter('codeExam', $codigoExam);
          $examenRes=$query->getArrayResult();
          if (empty($examenRes)) {
            return $this->render('UtExamProEvalBundle:Default:pageError.html.twig');
          }else {
            $query = $em->createQuery('
              SELECT m, mat
              FROM UtExam\ProEvalBundle\Entity\Maestros m
              LEFT JOIN m.materias mat');
            $lisMaestrosRes=$query->getArrayResult();
            return $this->render('UtExamProEvalBundle:Examen:login.html.twig',array(
              'maestros' => $lisMaestrosRes,
              'propedeutico'=> false
            ));
          }
        }else {
            $query = $em->createQuery('
              SELECT m, mat
              FROM UtExam\ProEvalBundle\Entity\Maestros m
              LEFT JOIN m.materias mat');
            $lisMaestrosRes=$query->getArrayResult();
            return $this->render('UtExamProEvalBundle:Examen:login.html.twig',array(
              'maestros' => $lisMaestrosRes,
              'propedeutico'=> false
            ));
        }
      }
    }

    public function loginAction(){
      $em = $this->getDoctrine()->getManager();
      $valuePass= $_POST['pass'];
      $valueUserName= $_POST['userName'];
      $evaluacion= $_POST['evaluacion'];
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
      $mensaje= "Hola <b class='text-primary'>".$userRes[0]["nombre"]."</b> tu grupo sigue siendo: <b class='text-primary'>".$userRes[0]["grupo"]."</b>?";
      $responseArray = array(
        "UID" => $usercode,
        "examen" => $evaluacion,
        "mensaje" => $mensaje,
        "bandera" => true
       );
      return new JsonResponse($responseArray);
    }

    public function updateGrupAction(){
      $em = $this->getDoctrine()->getManager();
      $UID="";
      $newGrup="";
      try {
        if(isset($_POST)){
          if(isset($_POST['newGrup'])) $newGrup = $_POST['newGrup'];
          if(isset($_POST["UID"])) $UID = $_POST["UID"];
        }
        $updateCali = $em->createQuery('
          UPDATE UtExam\ProEvalBundle\Entity\Alumnos A
          SET A.grupo = :newGrupo
          WHERE A.codigoUsuario = :codeUser');
        $updateCali->setParameter('newGrupo', $newGrup);
        $updateCali->setParameter('codeUser', $UID);
        $updateCali->execute();
        $responseArray = array(
          "bandera" => true
         );
      } catch (\Exception $e) {
        $responseArray = array(
          "bandera" => false
         );
      }
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
      if (isset($_COOKIE["examenId"])) {
        $arrExam= explode("-", $_COOKIE["examenId"]);
        $typeExam= $arrExam[0];
        $examenId=$arrExam[1];
        $examen= "";
        $preguntas= 0;
        $respuestas= [];
        $time= "";
        $arrayQByGrup= [];
        $materiaID="";
        $preg=0;
        $RCorect=[];
        $calificacion=[];
        $corect=0;
        $pTotal=0;
        $caliTempo=0;
        if(isset($_POST)){
          if(isset($_POST['dquestion'])) $preguntas = $_POST['dquestion'];
          if(isset($_POST["respuestas"])) $respuestas = $_POST["respuestas"];
          if(isset($_POST["time"])) $time = $_POST["time"];
          if(isset($_POST["arrayQByGrup"])) $arrayQByGrup = $_POST["arrayQByGrup"];
        }
        if ($preguntas < sizeof($respuestas, 0)) {
          $preguntas= 100;
        }
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
            $materiaID= $respuestaRes["respuestas"][0]["pregunta"]["materias"]["id"];
            if ($isCorect) {
              if (empty($RCorect[$materiaID])) {
                $corect=0;
                $corect ++;
                $pTotal=0;
                $pTotal ++;
              }else {
                $corect = (int)$RCorect[$materiaID]['correctas'];
                $corect ++;
                $pTotal = (int)$RCorect[$materiaID]['total'];
                $pTotal ++;
              }
              $arrayCorrect = array(
                'correctas' => $corect,
                'total' => $pTotal
              );
              $RCorect[$materiaID]= $arrayCorrect;
            }else {
              if (empty($RCorect[$materiaID])) {
                $corect =0;
                $pTotal =0;
                $pTotal ++;
                $arrayCorrect = array(
                  'correctas' => $corect,
                  'total' => $pTotal
                );
                $RCorect[$materiaID]= $arrayCorrect;
              }else {
                $corect = (int)$RCorect[$materiaID]['correctas'];
                $corect += 0;
                $pTotal = (int)$RCorect[$materiaID]['total'];
                $pTotal ++;
              }
              $arrayCorrect = array(
                'correctas' => $corect,
                'total' => $pTotal
              );
              $RCorect[$materiaID]= $arrayCorrect;
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
            $materiaID= $resVidResult["respuestas"][0]["pregunta"]["materias"]["id"];
            if ($isCorect) {
              if (empty($RCorect[$materiaID])) {
                $corect=0;
                $corect ++;
                $pTotal=0;
                $pTotal ++;
              }else {
                $corect = (int)$RCorect[$materiaID]['correctas'];
                $corect ++;
                $pTotal = (int)$RCorect[$materiaID]['total'];
                $pTotal ++;
              }
              $arrayCorrect = array(
                'correctas' => $corect,
                'total' => $pTotal
              );
              $RCorect[$materiaID]= $arrayCorrect;
            }else {
              if (empty($RCorect[$materiaID])) {
                $corect =0;
                $pTotal =0;
                $pTotal ++;
                $arrayCorrect = array(
                  'correctas' => $corect,
                  'total' => $pTotal
                );
                $RCorect[$materiaID]= $arrayCorrect;
              }else {
                $corect = (int)$RCorect[$materiaID]['correctas'];
                $corect += 0;
                $pTotal = (int)$RCorect[$materiaID]['total'];
                $pTotal ++;
              }
              $arrayCorrect = array(
                'correctas' => $corect,
                'total' => $pTotal
              );
              $RCorect[$materiaID]= $arrayCorrect;
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
            $materiaID= $resImgResult["respuestas"][0]["pregunta"]["materias"]["id"];
            if ($isCorect) {
              if (empty($RCorect[$materiaID])) {
                $corect=0;
                $corect ++;
                $pTotal=0;
                $pTotal ++;
              }else {
                $corect = (int)$RCorect[$materiaID]['correctas'];
                $corect ++;
                $pTotal = (int)$RCorect[$materiaID]['total'];
                $pTotal ++;
              }
              $arrayCorrect = array(
                'correctas' => $corect,
                'total' => $pTotal
              );
              $RCorect[$materiaID]= $arrayCorrect;
            }else {
              if (empty($RCorect[$materiaID])) {
                $corect =0;
                $pTotal =0;
                $pTotal ++;
                $arrayCorrect = array(
                  'correctas' => $corect,
                  'total' => $pTotal
                );
                $RCorect[$materiaID]= $arrayCorrect;
              }else {
                $corect = (int)$RCorect[$materiaID]['correctas'];
                $corect += 0;
                $pTotal = (int)$RCorect[$materiaID]['total'];
                $pTotal ++;
              }
              $arrayCorrect = array(
                'correctas' => $corect,
                'total' => $pTotal
              );
              $RCorect[$materiaID]= $arrayCorrect;
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
            $materiaID= $resAudResult["respuestas"][0]["pregunta"]["materias"]["id"];
            if ($isCorect) {
              if (empty($RCorect[$materiaID])) {
                $corect=0;
                $corect ++;
                $pTotal=0;
                $pTotal ++;
              }else {
                $corect = (int)$RCorect[$materiaID]['correctas'];
                $corect ++;
                $pTotal = (int)$RCorect[$materiaID]['total'];
                $pTotal ++;
              }
              $arrayCorrect = array(
                'correctas' => $corect,
                'total' => $pTotal
              );
              $RCorect[$materiaID]= $arrayCorrect;
            }else {
              if (empty($RCorect[$materiaID])) {
                $corect =0;
                $pTotal =0;
                $pTotal ++;
                $arrayCorrect = array(
                  'correctas' => $corect,
                  'total' => $pTotal
                );
                $RCorect[$materiaID]= $arrayCorrect;
              }else {
                $corect = (int)$RCorect[$materiaID]['correctas'];
                $corect += 0;
                $pTotal = (int)$RCorect[$materiaID]['total'];
                $pTotal ++;
              }
              $arrayCorrect = array(
                'correctas' => $corect,
                'total' => $pTotal
              );
              $RCorect[$materiaID]= $arrayCorrect;
            }
          }
        }
        // return new Response("Gracias por contestar");
        foreach ($arrayQByGrup as $grup) {
          $GrupMateriaId= explode("=;", $grup)[0];
          if (!array_key_exists((int)$GrupMateriaId, $RCorect)) {
             $arrayCorrect = array(
               'correctas' => 0,
               'total' => explode("=;", $grup)[1]
             );
             $RCorect[$GrupMateriaId]=$arrayCorrect;
             continue;
          }
          foreach ($RCorect as $key => $califi) {
            if ((int)$key == (int)$GrupMateriaId) {
              if ($califi["total"] != explode("=;", $grup)[1]) {
                $arrayCorrect = array(
                  'correctas' => $califi["correctas"],
                  'total' => explode("=;", $grup)[1]
                );
                $RCorect[$key]=$arrayCorrect;
              }else {
                continue;
              }
            }else {
              continue;
            }
          }
        }
        foreach ($RCorect as $key => $RCorectOfGrup) {
          $caliTempo=($RCorectOfGrup['correctas']/$RCorectOfGrup['total'])*100;
          if (is_float($caliTempo)) {
            $caliTempo= round($caliTempo);
          }
          $calificacion[$key]= (int)$caliTempo;
        }

        if(isset($_COOKIE["examen"])) $examen = $_COOKIE["examen"];
        //si es un examen tipo auto o fijo

        if ($_COOKIE["UID"]) {
          $UID = $_COOKIE["UID"];
          $caliGeneral= 0;
          $alumnoRes = $this->getAlumno($UID);
          $alumnoId = $alumnoRes[0]['id'];
          $objAlumno = $this->getDoctrine()
                         ->getRepository("UtExam\ProEvalBundle\Entity\Alumnos")
                         ->find((int)$alumnoId);
          $alumnoCali = new Calificaciones();
          $alumnoCali->setAlumnos($objAlumno);
          $alumnoCali->setEvaluacion($examen);
          if ($typeExam === "propedeutico") {
            $objExamen = $this->getDoctrine()
                           ->getRepository("UtExam\ProEvalBundle\Entity\ExamenAuto")
                           ->find((int)$examenId);
            $alumnoCali->setExamenAuto($objExamen);
          }else {
            $objExamen = $this->getDoctrine()
                           ->getRepository("UtExam\ProEvalBundle\Entity\Examen")
                           ->find((int)$examenId);
            $alumnoCali->setExamen($objExamen);
          }
          $alumnoCali->setTiempo($time);
          foreach ($calificacion as $key => $value) {
            $caliGeneral += $value;
            $objMateria = $this->getDoctrine()
                           ->getRepository("UtExam\ProEvalBundle\Entity\Materias")
                           ->find((int)$key);
            $caliMaterias = new CalificacionesDeMaterias();
            $caliMaterias->setCalificacion($value);
            $caliMaterias->setMaterias($objMateria);
            $caliMaterias->setCalificaciones($alumnoCali);
            $alumnoCali->addCaliMaterium($caliMaterias);
          }
          $caliGeneral = $caliGeneral/count($calificacion);
          $alumnoCali->setCalificacion($caliGeneral);
          $em->persist($alumnoCali);
          $em->flush();
          $userQuery = $em->createQuery('
            SELECT a, cali
            FROM UtExam\ProEvalBundle\Entity\Alumnos a
            LEFT JOIN a.calificaciones cali
            WHERE a.codigoUsuario = :codeUser');
          $userQuery->setParameter('codeUser', $UID);
          $userRes=$userQuery->getArrayResult();
          // return new Response("Gracias por contestar");
          $updateCali = $em->createQuery('
            UPDATE UtExam\ProEvalBundle\Entity\Alumnos A
            SET A.examSalida = :status
            WHERE A.id = :idUser');
          $updateCali->setParameter('status', true);
          $updateCali->setParameter('idUser', $alumnoId);
          $updateCali->execute();
        }else {
          return new Response("Error: La sesion a caducado");
        }
        return new Response("Gracias por contestar");
      }
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
      $valueEval = $_POST['evaluacion'];
      if ($valueEval == "Entrada") {
        $valueMaestro1= $this->getDoctrine()
                       ->getRepository("UtExam\ProEvalBundle\Entity\Maestros")
                       ->find((int)$_POST['maestro1']);
        $valueMaestro2= $this->getDoctrine()
                       ->getRepository("UtExam\ProEvalBundle\Entity\Maestros")
                       ->find((int)$_POST['maestro2']);
        $valueMaestro3= $this->getDoctrine()
                       ->getRepository("UtExam\ProEvalBundle\Entity\Maestros")
                       ->find((int)$_POST['maestro3']);
      }
      try {
        $alumno = new Alumnos();
        $alumno->setNombre($valueName);
        $alumno->setUsername($valueUserName);
        $alumno->setTurno($valueTurno);
        $alumno->setContrasena($valuePass);
        $alumno->setFecha(date('Y-m-d H:i:s'));
        $alumno->setTiempo(0);
        $alumno->setCodigoUsuario($usercode);
        $alumno->setCarrera($valueCarrera);
        $alumno->setGrupo($valueGrupo);
        $alumno->setExamSalida(false);
        $alumno->setExamEntrada(false);
        if ($valueEval == "Entrada") {
          $alumno->addMaestro($valueMaestro1);
          $alumno->addMaestro($valueMaestro2);
          $alumno->addMaestro($valueMaestro3);
        }
        $em->persist($alumno);
        $em->flush();
        $responseArray = array(
          "UID" => $usercode,
          "examen" => $valueEval,
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
    public function openModalUpdateGrupAction(){
      return $this->render('UtExamProEvalBundle:modals:modalUpdateGrup.html.twig');
    }

    public function getAllQuestion($examenRes){
      $questions=$examenRes[0]['preguntasAuto'];
      return $questions;
    }
    public function getAllQuestionFijo($examenRes){
      $questions=$examenRes[0]['pregunta'];
      return $questions;
    }
    public function getAlumno($UID){
      $em = $this->getDoctrine()->getManager();
      $userQuery = $em->createQuery('
        SELECT a
        FROM UtExam\ProEvalBundle\Entity\Alumnos a
        WHERE a.codigoUsuario = :codeUser');
      $userQuery->setParameter('codeUser', $UID);
      $userRes=$userQuery->getArrayResult();
      return $userRes;
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
          SELECT e,partial u.{id, username}, maMo , p, pr, ma, res, text, aud, vid, img, paud, pvid, pimg
          FROM UtExam\ProEvalBundle\Entity\Examen e
          LEFT JOIN e.user u
          LEFT JOIN e.pregunta p
          LEFT JOIN e.materiaModa maMo
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
