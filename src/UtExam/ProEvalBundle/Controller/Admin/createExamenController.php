<?php

namespace UtExam\ProEvalBundle\Controller\Admin;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
//use Doctrine paginator
use Doctrine\ORM\Tools\Pagination\Paginator;
$examen= "";
class createExamenController extends Controller
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
      $queryUser = $em->createQuery('
        SELECT partial u.{id, username}
        FROM Application\Sonata\UserBundle\Entity\user u');
      $userRes=$queryUser->getArrayResult();
      return $this->render('UtExamProEvalBundle::Admin/main.html.twig', array(
        'users' => $userRes,
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

    public function getPdfOfExamAction(Request $request){
      $em = $this->getDoctrine()->getManager();
      $examId=$request->get("id");
      $tipoExam=$request->get("tipoExam");
      $examRes=[];
      $bandera= false;
      if ($tipoExam == 1) {
        $queryExam = $em->createQuery('
          SELECT e, maMo, partial u.{id, username, firstname, lastname, biography }, p, pr, ma, res, text, aud, vid, img, paud, pvid, pimg
          FROM UtExam\ProEvalBundle\Entity\Examen e
          LEFT JOIN e.user u
          LEFT JOIN e.materiaModa maMo
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
          WHERE e.id = :examId');
        $queryExam->setParameter('examId', $examId);
        $examRes=$queryExam->getArrayResult();
        $bandera= true;
        if ($bandera) {
          $GLOBALS['examen']= $examRes;
          $estructura = array('A','B','C','D','E','F','G','H','I','J','K','L');
          // dump();
          // die;
          // Creación del objeto de la clase heredada
          $pdf = new PDF("P","mm","Letter");
          $pdf->AliasNbPages();
          $pdf->AddPage();
          $pdf->SetFont('Arial','B',11);
          // $pdf->Cell(55,10,'SISTEMA DE GESTION DE LA CALIDAD',0,0,"C");
          $pdf->Cell(110,10,'NOMBRE DE LA ASIGNATURA:','T,L',0);
          $pdf->Cell(85,10,'NOMBRE DEL DOCENTE:','T,L,R',0);
          //interbalo de la segunda columna
          $pdf->Ln(6);
          $pdf->SetFont('Arial','',11);
          $pdf->Cell(110,7,utf8_decode(strtoupper($examRes[0]['materiaModa']['nombre'])),"B,L",0);
          if (!empty($examRes[0]['user']['firstname']) && !is_null($examRes[0]['user']['firstname'])) {
            if (!empty($examRes[0]['user']['lastname']) && !is_null($examRes[0]['user']['lastname'])) {
              if (!empty($examRes[0]['user']['biography']) && !is_null($examRes[0]['user']['biography'])) {
                $pdf->Cell(85,7,utf8_decode($examRes[0]['user']['biography'].'. '.$examRes[0]['user']['firstname'].$examRes[0]['user']['lastname']),"B,L,R",0);
              }else {
                $pdf->Cell(85,7,utf8_decode($examRes[0]['user']['firstname'].$examRes[0]['user']['lastname']),"B,L,R",0);
              }
            }elseif (!empty($examRes[0]['user']['biography']) && !is_null($examRes[0]['user']['biography'])) {
              $pdf->Cell(85,7,utf8_decode($examRes[0]['user']['biography'].'. '.$examRes[0]['user']['firstname']),"B,L,R",0);
            }else {
              $pdf->Cell(85,7,utf8_decode($examRes[0]['user']['firstname']),"B,L,R",0);
            }
          }else {
            $pdf->Cell(85,7,utf8_decode($examRes[0]['user']['username']),"B,L,R",0);
          }
          $pdf->Ln(7);
          $pdf->SetFont('Arial','B',11);
          // $pdf->Cell(55,10,'SISTEMA DE GESTION DE LA CALIDAD',0,0,"C");
          $pdf->Cell(110,10,utf8_decode('UNIDAD(ES) TEMÁTICA(S):'),'T,L',0);
          $pdf->Cell(85,10,'GRUPOS:','T,L,R',0);
          //interbalo de la segunda columna
          $pdf->Ln(6);
          $pdf->SetFont('Arial','',11);
          $pdf->Cell(110,7,'__________________________________',"B,L",0);
          $pdf->Cell(85,7,'__________________________________',"B,L,R",0);
          $pdf->Ln(7);
          $pdf->SetFont('Arial','B',11);
          // $pdf->Cell(55,10,'SISTEMA DE GESTION DE LA CALIDAD',0,0,"C");
          $pdf->Cell(110,10,utf8_decode('TEMA(S):'),'T,L',0);
          $pdf->Cell(42.5,10,'FECHA:','T,L,R',0);
          $pdf->Cell(42.5,10,utf8_decode('CALIFICACIÓN:'),'T,L,R',0);
          //interbalo de la segunda columna
          $pdf->Ln(2);
          $pdf->SetFont('Arial','',11);
          $pdf->Cell(110,15,'__________________________________',"B,L",0);
          $pdf->Cell(42.5,15,utf8_decode(explode(" ", $examRes[0]['fecha'])[0]),"B,L,R",0);
          $pdf->Cell(42.5,15,'',"B,L,R",0);
          $pdf->Ln(30);
          $pdf->SetFont('Times','',12);
          $pdf->Cell(35,5,'Nombre del Alumno:____________________________________________ No. Matricula:__________________',0,1);
          // $pdf->Ln(5);
          $pdf->SetFont('Arial','B',11);
          $pdf->Cell(35,10,utf8_decode('INSTRUCCIONES:'),0,0);
          $pdf->SetFont('Times','',12);
          $pdf->Cell(10,10,utf8_decode($examRes[0]['instrucciones']),0,1);
          $pdf->Ln(5);
          // $pdf->Cell(42.5,10,'FECHA:','T,L,R',0);
          foreach ($examRes[0]['pregunta'] as $preguntaKey => $pregunta) {
            $pdf->Cell(0,10,utf8_decode($preguntaKey+1 .'.-'.$pregunta['pregunta']['escrito']),0,1);
            // dump();
            if (!empty($pregunta['pregunta']['respuestas']['texto']) && !is_null($pregunta['pregunta']['respuestas']['texto'])) {
              foreach ($pregunta['pregunta']['respuestas']['texto'] as $respuestaKey => $respuesta) {
                $pdf->Cell(0,5,utf8_decode($estructura[$respuestaKey].') '.$respuesta['escrito']),0,1);
                // dump($estructura[$respuestaKey].') '.$respuesta['escrito']);
              }
            }elseif (!empty($pregunta['pregunta']['respuestas']['audio']) && !is_null($pregunta['pregunta']['respuestas']['audio'])) {
              $pdf->Cell(0,5,'no puedes imprimir un audio >_>',0,1);
              // dump("no puedes imprimir un audio >_>");
            }elseif (!empty($pregunta['pregunta']['respuestas']['video']) && !is_null($pregunta['pregunta']['respuestas']['video'])) {
              $pdf->Cell(0,5,'no puedes imprimir un video >_>',0,1);
              // dump("null");
            }elseif (!empty($pregunta['pregunta']['respuestas']['imagen']) && !is_null($pregunta['pregunta']['respuestas']['imagen'])) {
              $pdf->Cell(0,5,'todavia no jaja',0,1);
              // dump("todavia no jaja");
            }
          }
          return new Response($pdf->Output(), 200, array(
            'Content-Type' => 'application/pdf'));
        }
        // return new JsonResponse($examenRes);
      }elseif ($tipoExam == 2) {
        $queryExam = $em->createQuery('
          SELECT eA
          FROM UtExam\ProEvalBundle\Entity\ExamenAuto eA
          WHERE eA.id = :examId');
        $queryExam->setParameter('examId', $examId);
        $examRes=$queryExam->getSingleResult();
        $bandera= true;
        if ($bandera) {
          $GLOBALS['examen']= $examRes;
          dump($examRes);
          die;
          // Creación del objeto de la clase heredada
          $pdf = new PDF("P","mm","Letter");
          $pdf->AliasNbPages();
          $pdf->AddPage();
          $pdf->SetFont('Times','',12);
          // $pdf->Cell(55,10,'SISTEMA DE GESTION DE LA CALIDAD',0,0,"C");
          $pdf->Cell(115,10,'NOMBRE DE LA ASIGNATURA:',1,0);
          $pdf->Cell(80,10,'NOMBRE DE LA ASIGNATURA:',1,0);
          $pdf->Ln(10);
          for($i=1;$i<=40;$i++)
              $pdf->Cell(0,10,'Imprimiendo línea número '.$i,0,1);
          return new Response($pdf->Output(), 200, array(
            'Content-Type' => 'application/pdf'));
        }
        // return new JsonResponse($examenAutoRes);
      }else {
        return new JsonResponse("Error");
      }
    }

}
$aa='some word';
class PDF extends \FPDF {
  // Cabecera de página
  function Header(){
      // Arial bold 15
      $this->SetFont('Arial','B',11);
      // Logo
      $this->Cell(40,25,$this->Image(__DIR__.'/../../Resources/public/images/UTicon.png',12,12,33),1,0);
      //contendio de la segunda columna
      $this->Cell(95,10,'UNIVERSIDAD TECNOLOGICA CADEREYTA',"T",0,"C");
      //interbalo para la tercera columna
      $this->SetFont('Arial','',9);
      $this->Cell(30,6,'Clave:',1,0);
      //interbalo para la cuarta columna
      $this->SetFont('Arial','B',9);
      $this->Cell(30,6,'R_01_8.6_DA',1,0,"C");
      //interbalo de la segunda columna
      $this->Ln(6);
      $this->SetFont('Arial','',11);
      $this->Cell(40);
      $this->Cell(95,10,utf8_decode('SISTEMA DE GESTION DE LA CALIDAD'),0,0,"C");
      //interbalo para la tercera columna
      $this->SetFont('Arial','',9);
      $this->Cell(30,6,'Fecha Elab:',1,0);
      //interbalo para la cuarta columna
      $this->Cell(30,6,'Febrero 2013',1,0,"C");
      //interbalo de la segunda columna
      $this->Ln(6);
      $this->SetFont('Arial','B',11);
      $this->Cell(40);
      $this->Cell(95,13,utf8_decode('EVALUACIÓN DE ÁPRENDISAJES'),"B",0,"C");
      //interbalo para la tercera columna
      $this->SetFont('Arial','',9);
      $this->Cell(30,6,'Revision:',1,0);
      //interbalo para la cuarta columna
      $this->Cell(30,6,'4',1,0,"C");
      //interbalo para la tercera columna
      $this->Ln(6);
      $this->Cell(135);
      $this->Cell(30,7,'Fecha Rev',1,0);
      //interbalo para la tercera columna
      $this->Cell(30,7,'11-Octubre-2018',1,0,"C");
      //ultimo salto de linea
      $this->Ln(10);
  }
  // Pie de página
  function Footer(){
      // Posición: a 1,5 cm del final
      $this->SetY(-15);
      // Arial italic 8
      $this->SetFont('Arial','I',8);
      // Número de página
      $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
  }
}
