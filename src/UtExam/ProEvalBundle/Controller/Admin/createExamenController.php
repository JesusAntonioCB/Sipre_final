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
      $userRes=[];
      // $query = $em->createQuery('
      //   SELECT partial Ea.{id, titulo}
      //   FROM UtExam\ProEvalBundle\Entity\ExamenAuto Ea');
      // $examenRes=$query->getArrayResult();
      // dump($examenRes);
      // $queryUser = $em->createQuery('
      //   SELECT partial u.{id, username}
      //   FROM Application\Sonata\UserBundle\Entity\user u');
      // $userRes=$queryUser->getArrayResult();
      if ($this->getUser()->hasRole("ROLE_SUPER_ADMIN")) {
        $queryUser = $em->createQuery('
          SELECT partial u.{id, username}
          FROM Application\Sonata\UserBundle\Entity\user u');
        $userRes=$queryUser->getArrayResult();
      }else {
        array_push($userRes,$this->getUser());
      }
      return $this->render('UtExamProEvalBundle::Admin/main.html.twig', array(
        'users' => $userRes,
      ));
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
          SELECT partial E.{id, titulo}, partial maMo.{id, nombre}
          FROM UtExam\ProEvalBundle\Entity\Examen E
          LEFT JOIN E.user u
          LEFT JOIN E.materiaModa maMo
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
      $em = $this->getDoctrine()->getManager();
      $examId= "1";
      $tipoExam= "1";
      $examTitle= "";
      $examdata1= "";
      $examdata2= "";
      $examdata3= "";
      if(isset($_GET)){
        if(isset($_GET["examId"])) $examId = $_GET["examId"];
        if(isset($_GET["examType"])) $tipoExam = $_GET["examType"];
        if(isset($_GET["examTitle"])) $examTitle = $_GET["examTitle"];
        if(isset($_GET["examdata1"])) $examdata1 = $_GET["examdata1"];
        if(isset($_GET["examdata2"])) $examdata2= $_GET["examdata2"];
        if(isset($_GET["examdata3"])) $examdata3 = $_GET["examdata3"];
        //if(isset($_GET["subscriptions"])) $subscriptions = $_GET["subscriptions"];
      }
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
          // dump($examRes);
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
          if ($examTitle === "") {
            $pdf->Cell(110,7,iconv('UTF-8', 'windows-1252', strtoupper($examRes[0]['materiaModa']['nombre'])),"B,L",0);
          }else {
            $pdf->Cell(110,7,iconv('UTF-8', 'windows-1252', strtoupper($examTitle)),"B,L",0);
          }
          if (!empty($examRes[0]['user']['firstname']) && !is_null($examRes[0]['user']['firstname'])) {
            if (!empty($examRes[0]['user']['lastname']) && !is_null($examRes[0]['user']['lastname'])) {
              if (!empty($examRes[0]['user']['biography']) && !is_null($examRes[0]['user']['biography'])) {
                $pdf->Cell(85,7,iconv('UTF-8', 'windows-1252', $examRes[0]['user']['biography'].'. '.$examRes[0]['user']['firstname'].$examRes[0]['user']['lastname']),"B,L,R",0);
              }else {
                $pdf->Cell(85,7,iconv('UTF-8', 'windows-1252', $examRes[0]['user']['firstname'].$examRes[0]['user']['lastname']),"B,L,R",0);
              }
            }elseif (!empty($examRes[0]['user']['biography']) && !is_null($examRes[0]['user']['biography'])) {
              $pdf->Cell(85,7,iconv('UTF-8', 'windows-1252', $examRes[0]['user']['biography'].'. '.$examRes[0]['user']['firstname']),"B,L,R",0);
            }else {
              $pdf->Cell(85,7,iconv('UTF-8', 'windows-1252', $examRes[0]['user']['firstname']),"B,L,R",0);
            }
          }else {
            $pdf->Cell(85,7,iconv('UTF-8', 'windows-1252', $examRes[0]['user']['username']),"B,L,R",0);
          }
          $pdf->Ln(7);
          $pdf->SetFont('Arial','B',11);
          // $pdf->Cell(55,10,'SISTEMA DE GESTION DE LA CALIDAD',0,0,"C");
          $pdf->Cell(110,10,iconv('UTF-8', 'windows-1252', 'UNIDAD(ES) TEMÁTICA(S):'),'T,L',0);
          $pdf->Cell(85,10,'GRUPO:','T,L,R',0);
          //interbalo de la segunda columna
          $pdf->Ln(6);
          $pdf->SetFont('Arial','',11);
          $pdf->Cell(110,7,iconv('UTF-8', 'windows-1252', $examdata1),"B,L",0);
          $pdf->Cell(85,7,iconv('UTF-8', 'windows-1252', $examdata2),"B,L,R",0);
          $pdf->Ln(7);
          $pdf->SetFont('Arial','B',11);
          // $pdf->Cell(55,10,'SISTEMA DE GESTION DE LA CALIDAD',0,0,"C");
          $pdf->Cell(110,10,iconv('UTF-8', 'windows-1252', 'TEMA(S):'),'T,L',0);
          $pdf->Cell(42.5,10,'FECHA:','T,L,R',0);
          $pdf->Cell(42.5,10,iconv('UTF-8', 'windows-1252', 'CALIFICACIÓN:'),'T,L,R',0);
          //interbalo de la segunda columna
          $pdf->Ln(2);
          $pdf->SetFont('Arial','',11);
          $pdf->Cell(110,15,iconv('UTF-8', 'windows-1252', $examdata3),"B,L",0);
          $pdf->Cell(42.5,15,iconv('UTF-8', 'windows-1252', explode(" ", $examRes[0]['fecha'])[0]),"B,L,R",0);
          $pdf->Cell(42.5,15,'',"B,L,R",0);
          $pdf->Ln(30);
          $pdf->SetFont('Times','',12);
          $pdf->Cell(35,5,'Nombre del Alumno:____________________________________________ No. Matricula:__________________',0,1);
          // $pdf->Ln(5);
          $pdf->SetFont('Arial','B',11);
          $pdf->Cell(35,10,iconv('UTF-8', 'windows-1252', 'INSTRUCCIONES:'),0,0);
          $pdf->SetFont('Times','',12);
          $pdf->Cell(10,10,iconv('UTF-8', 'windows-1252', $examRes[0]['instrucciones']),0,1);
          $pdf->Ln(5);
          // $pdf->Cell(42.5,10,'FECHA:','T,L,R',0);
          foreach ($examRes[0]['pregunta'] as $preguntaKey => $pregunta) {
            // $pdf->Cell(10,10,(strlen($preguntaKey+1 .'.-'.$pregunta['pregunta']['escrito'])/91)."::".$pdf->GetY(),0,1);
            if ($pdf->GetY()>217) {
              $pdf->AddPage();
            }elseif ($pdf->GetY()>210) {
              if ((strlen($preguntaKey+1 .'.-'.$pregunta['pregunta']['escrito'])/91)>=5) {
                $pdf->AddPage();
              }
            }
            $pdf->MultiCell(0,5,$pdf->WriteHTML(iconv('UTF-8', 'windows-1252', $preguntaKey+1 .'.-'.$pregunta['pregunta']['escrito'])),0);
            $pdf->Ln(5);
            if (!empty($pregunta['pregunta']['respuestas']['texto']) && !is_null($pregunta['pregunta']['respuestas']['texto'])) {
              foreach ($pregunta['pregunta']['respuestas']['texto'] as $respuestaKey => $respuesta) {
                $pdf->MultiCell(0,5,iconv('UTF-8', 'windows-1252', $estructura[$respuestaKey].') '.$respuesta['escrito']),0,1);
                // dump($estructura[$respuestaKey].') '.$respuesta['escrito']);
              }
            }elseif (!empty($pregunta['pregunta']['respuestas']['audio']) && !is_null($pregunta['pregunta']['respuestas']['audio'])) {
              $pdf->MultiCell(0,5,'no puedes imprimir un audio >_>',0,1);
              // dump("no puedes imprimir un audio >_>");
            }elseif (!empty($pregunta['pregunta']['respuestas']['video']) && !is_null($pregunta['pregunta']['respuestas']['video'])) {
              $pdf->MultiCell(0,5,'no puedes imprimir un video >_>',0,1);
              // dump("null");
            }elseif (!empty($pregunta['pregunta']['respuestas']['imagen']) && !is_null($pregunta['pregunta']['respuestas']['imagen'])) {
              $pdf->MultiCell(0,5,'todavia no jaja',0,1);
              // dump("todavia no jaja");
            }
            $pdf->Ln(5);
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
function hex2dec($couleur = "#000000"){
    $R = substr($couleur, 1, 2);
    $rouge = hexdec($R);
    $V = substr($couleur, 3, 2);
    $vert = hexdec($V);
    $B = substr($couleur, 5, 2);
    $bleu = hexdec($B);
    $tbl_couleur = array();
    $tbl_couleur['R']=$rouge;
    $tbl_couleur['V']=$vert;
    $tbl_couleur['B']=$bleu;
    return $tbl_couleur;
}

//conversion pixel -> millimeter at 72 dpi
function px2mm($px){
  return $px*25.4/72;
}

function txtentities($html){
  $trans = get_html_translation_table(HTML_ENTITIES);
  $trans = array_flip($trans);
  return strtr($html, $trans);
}
class PDF extends \FPDF {
  //variables of html parser
  protected $B;
  protected $I;
  protected $U;
  protected $HREF;
  protected $fontList;
  protected $issetfont;
  protected $issetcolor;

  function __construct($orientation='P', $unit='mm', $format='A4'){
    //Call parent constructor
    parent::__construct($orientation,$unit,$format);
    //Initialization
    $this->B=0;
    $this->I=0;
    $this->U=0;
    $this->HREF='';
    $this->fontlist=array('arial', 'times', 'courier', 'helvetica', 'symbol');
    $this->issetfont=false;
    $this->issetcolor=false;
  }
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
      $this->Cell(95,10,iconv('UTF-8', 'windows-1252', 'SISTEMA DE GESTION DE LA CALIDAD'),0,0,"C");
      //interbalo para la tercera columna
      $this->SetFont('Arial','',9);
      $this->Cell(30,6,'Fecha Elab:',1,0);
      //interbalo para la cuarta columna
      $this->Cell(30,6,'Febrero 2013',1,0,"C");
      //interbalo de la segunda columna
      $this->Ln(6);
      $this->SetFont('Arial','B',11);
      $this->Cell(40);
      $this->Cell(95,13,iconv('UTF-8', 'windows-1252', 'EVALUACIÓN DE ÁPRENDISAJES'),"B",0,"C");
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
  function WriteHTML($html){
    //HTML parser
    $html=strip_tags($html,"<b><u><i><a><img><p><br><strong><em><font><tr><blockquote>"); //supprime tous les tags sauf ceux reconnus
    $html=str_replace("\n",' ',$html); //remplace retour à la ligne par un espace
    $a=preg_split('/<(.*)>/U',$html,-1,PREG_SPLIT_DELIM_CAPTURE); //éclate la chaîne avec les balises
    foreach($a as $i=>$e){
      if($i%2==0){
        //Text
        if($this->HREF)
            $this->PutLink($this->HREF,$e);
        else
            $this->Write(5,stripslashes(txtentities($e)));
      }else{
        //Tag
        if($e[0]=='/')
          $this->CloseTag(strtoupper(substr($e,1)));
        else{
          //Extract attributes
          $a2=explode(' ',$e);
          $tag=strtoupper(array_shift($a2));
          $attr=array();
          foreach($a2 as $v){
            if(preg_match('/([^=]*)=["\']?([^"\']*)/',$v,$a3))
              $attr[strtoupper($a3[1])]=$a3[2];
          }
          $this->OpenTag($tag,$attr);
        }
      }
    }
  }

  function OpenTag($tag, $attr){
      //Opening tag
      switch($tag){
        case 'STRONG':
            $this->SetStyle('B',true);
            break;
        case 'EM':
            $this->SetStyle('I',true);
            break;
        case 'B':
        case 'I':
        case 'U':
            $this->SetStyle($tag,true);
            break;
        case 'A':
            $this->HREF=$attr['HREF'];
            break;
        case 'IMG':
            if(isset($attr['SRC']) && (isset($attr['WIDTH']) || isset($attr['HEIGHT']))) {
              if(!isset($attr['WIDTH']))
                  $attr['WIDTH'] = 0;
              if(!isset($attr['HEIGHT']))
                  $attr['HEIGHT'] = 0;
              $this->Image($attr['SRC'], $this->GetX(), $this->GetY(), px2mm($attr['WIDTH']), px2mm($attr['HEIGHT']));
            }
            break;
        case 'TR':
        case 'BLOCKQUOTE':
        case 'BR':
            $this->Ln(5);
            break;
        case 'P':
            $this->Ln(10);
            break;
        case 'FONT':
            if (isset($attr['COLOR']) && $attr['COLOR']!='') {
              $coul=hex2dec($attr['COLOR']);
              $this->SetTextColor($coul['R'],$coul['V'],$coul['B']);
              $this->issetcolor=true;
            }
            if (isset($attr['FACE']) && in_array(strtolower($attr['FACE']), $this->fontlist)) {
              $this->SetFont(strtolower($attr['FACE']));
              $this->issetfont=true;
            }
            break;
      }
  }

  function CloseTag($tag){
    //Closing tag
    if($tag=='STRONG')
        $tag='B';
    if($tag=='EM')
        $tag='I';
    if($tag=='B' || $tag=='I' || $tag=='U')
        $this->SetStyle($tag,false);
    if($tag=='A')
        $this->HREF='';
    if($tag=='FONT'){
      if ($this->issetcolor==true) {
          $this->SetTextColor(0);
      }
      if ($this->issetfont) {
          $this->SetFont('arial');
          $this->issetfont=false;
      }
    }
  }

  function SetStyle($tag, $enable){
    //Modify style and select corresponding font
    $this->$tag+=($enable ? 1 : -1);
    $style='';
    foreach(array('B','I','U') as $s)
    {
        if($this->$s>0)
            $style.=$s;
    }
    $this->SetFont('',$style);
  }

  function PutLink($URL, $txt){
    //Put a hyperlink
    $this->SetTextColor(0,0,255);
    $this->SetStyle('U',true);
    $this->Write(5,$txt,$URL);
    $this->SetStyle('U',false);
    $this->SetTextColor(0);
  }
}
