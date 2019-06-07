<?php

namespace UtExam\ProEvalBundle\Controller\Admin;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
//use Doctrine paginator
use Doctrine\ORM\Tools\Pagination\Paginator;

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

    public function getPdfOfExamAction(){
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

}
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
    $this->Cell(95,10,'SISTEMA DE GESTION DE LA CALIDAD',0,0,"C");
    //interbalo para la tercera columna
    $this->SetFont('Arial','',9);
    $this->Cell(30,6,'Fecha Elab:',1,0);
    //interbalo para la cuarta columna
    $this->Cell(30,6,'Febrero 2013',1,0,"C");
    //interbalo de la segunda columna
    $this->Ln(6);
    $this->SetFont('Arial','B',11);
    $this->Cell(40);
    $this->Cell(95,13,'EVALUACION DE APRENDIDIZAJES',"B",0,"C");
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
