<?php
namespace UtExam\ProEvalBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Sonata\AdminBundle\Route\RouteCollection;

/**
 *
 */
class PreguntasAutoAdmin extends AbstractAdmin
{
  protected function configureRoutes(RouteCollection $collection)
  {
    if ($this->hasParentFieldDescription()) {
          $collection->remove('create');
      }
  }
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
    ->add('materias', null, array(
          "label" => "Materia a la que pertenese",
          'attr' => ["class" => "Materias"],

          'placeholder'   => 'Selecciona una Materia...'))
    ->add('tipoPregunta', null, array(
          "label" => "Tipo de pregunta",
          'placeholder'   => 'Selecciona un Tipo de Pregunta...',
          'attr' => ["class" => "tipoPregunta"],
          ))
    ->add('nivel', 'choice', array(
          "label" => "Dificultad",
          'attr' => ["class" => "boxDificultad"],
          'choices' => [
                  '1' => '1',
                  '2' => '2',
                  '3' => '3',
                  '4' => '4',
                  '5' => '5',
                  '6' => '6'
              ]))
    ->add('cantidad', TextType::class, array(
          "label" => "Cantidad",
          'attr' => ["class" => "cantidadPreguntas"]));
  }

  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
    ->add('materias')
    ->add('nivel')
    ->add('tipoPregunta');
  }

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->add('materias')
    ->add('nivel')
    ->add('tipoPregunta');
  }

  public function configure() {
    // dump(get_class_methods($this));
    // dump($this->id());
    $this->setTemplate('edit', '@UtExamProEval/CRUD/edit_js_from_preguntas.html.twig');
    // dump($this->getTemplates());
  }

  public function prePersist($object){
    $container = $this->getConfigurationPool()->getContainer();
    $em = $container->get('doctrine.orm.entity_manager');
    //constantes que serviran como filtros
    $numberOfPreguntas= (int)$object->getCantidad();
    $idOfMateria= $object->getMaterias()->getId();
    $idOfTypePregunta= $object->getTipoPregunta()->getId();
    $Dificultad=$object->getNivel();
    dump("cantidad de preguntas= ".$numberOfPreguntas);
    dump("Id de Materia= ".$idOfMateria);
    dump("Id de Tipo de pregunta= ".$idOfTypePregunta);
    dump("dificultad= ".$Dificultad);

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
      dump("no hay tantas preguntas");
      die();
    }
    for ($i=0; $i < $numberOfPreguntas; $i++) {
      //agregar a el objeto las preguntas con los filtros correspondientes
      dump($NumberRes[$rand[$i]]['id']);
      $query2 = $em->createQuery('
        SELECT p
        FROM UtExam\ProEvalBundle\Entity\Pregunta p
        WHERE p.id = :id');
      $query2->setParameter('id', $NumberRes[$rand[$i]]['id']);
      $preguntasRes=$query2->getResult();
      $object->addPreguntum($preguntasRes[0]);
      dump($preguntasRes);
    }

    // dump($object);
    // die;
    // $size = getpreguntasize($object->getMedia()->getPathname());
    // $object->setWidth($size[0]);
    // $object->setHeight($size[1]);
    // $object->setFormat($object->getMedia()->guessClientExtension());
    // $object->setMediaName($object->getMedia()->getClientOriginalName());
    // $object->setUpdatedAt(new \DateTime());
    return $object;
  }
}


 ?>
