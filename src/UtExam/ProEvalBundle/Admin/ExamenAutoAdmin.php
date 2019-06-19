<?php
namespace UtExam\ProEvalBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Validator\Constraints\DateTime;
use Sonata\AdminBundle\Form\Type\ChoiceFieldMaskType;
use Application\Sonata\UserBundle\Entity\User;
use Sonata\AdminBundle\Route\RouteCollection;

/**
 *
 */
class ExamenAutoAdmin extends AbstractAdmin
{

  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
    ->add('titulo', TextType::class, [
      'label' => 'Titulo del Examen'])
    ->add('instrucciones', TextType::class, [
      'label' => 'Instrucciones del Examen'])
    ->add('codigoExam', TextType::class, [
      'label' => 'Codigo propio de examen'])
    ->add('preguntasAuto', 'sonata_type_collection', array(
      'label' => 'preguntas'
      ), array(
          'edit' => 'inline',
          'inline' => 'table',
          'sortable' => 'position'
      ));
  }

  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
    ->add('titulo')
    ->add('user')
    ->add('preguntasAuto');
  }

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->addIdentifier('titulo')
    ->add('user')
    ->add('preguntasAuto');
  }
  public function configure() {
    $this->setTemplate('edit', '@UtExamProEval/CRUD/edit_js_from_preguntas.html.twig');
  }
  public function prePersist($object){
    //Variables
    $container = $this->getConfigurationPool()->getContainer();
    $em = $container->get('doctrine.orm.entity_manager');
    $result= 0;
    $noFullP= count($object->getPreguntasAuto());
    $user =$this->getConfigurationPool()->getContainer()->get('security.token_storage')->getToken()->getUser();
    date_default_timezone_set('America/Monterrey');
    $object->setFecha(date('Y-m-d H:i:s'));
    $object->setTipo(0);
    $object->setNivel(0);
    $object->setUser($user);
    //agregar preguntas a preguntasAuto
    foreach ($object->getPreguntasAuto() as $preguntaAuto) {
      //obtener promedio
      $y= (int)$preguntaAuto->getNivel();
      $result+=$y;
      //constantes que serviran como filtros
      $numberOfPreguntas= (int)$preguntaAuto->getCantidad();
      $idOfMateria= $preguntaAuto->getMaterias()->getId();
      $idOfTypePregunta= $preguntaAuto->getTipoPregunta()->getId();
      $Dificultad=$preguntaAuto->getNivel();

      //otencion de cantidad de de preguntas que existen
      $query = $em->createQuery('
        SELECT partial p.{id}
        FROM UtExam\ProEvalBundle\Entity\Pregunta p
        WHERE p.nivel = :nivel
        AND p.materias = :idMateria
        AND p.tipoPregunta = :idTypePregunta');//p.nivel = :nivel AND
      $query->setParameter('nivel', $Dificultad );
      $query->setParameter('idMateria', $idOfMateria);
      $query->setParameter('idTypePregunta', $idOfTypePregunta);
      $NumberRes=$query->getArrayResult();
      //conseguir la misma cantidad de numeros random como preguntas existen
      $rand = range(0, count($NumberRes)-1);
      shuffle($rand);
      //Preguntar si existen la cantidad de preguntas que piden
      if ($numberOfPreguntas > count($NumberRes)) {
        dump("no hay tantas preguntas con los parametros seleccionados");
        die();
      }
      for ($i=0; $i < $numberOfPreguntas; $i++) {
        //agregar a el objeto las preguntas con los filtros correspondientes
        $query2 = $em->createQuery('
          SELECT p
          FROM UtExam\ProEvalBundle\Entity\Pregunta p
          WHERE p.id = :id');
        $query2->setParameter('id', $NumberRes[$rand[$i]]['id']);
        $preguntasRes=$query2->getResult();
        $preguntaAuto->addPreguntum($preguntasRes[0]);
      }
    }
    $object->setNivel($result/=$noFullP);
    return $object;
  }
  public function preUpdate($object)
  {
    // foreach ($object->getPreguntasAuto() as $pregunta) {
    //   $pregunta->addExamenAuto($object);
    //   if($pregunta->getPreguntasAuto() == null){
    //     $pregunta->addExamenAuto(null);
    //   }
    // }
    return $object;
  }
}
?>
