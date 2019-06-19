<?php
namespace UtExam\ProEvalBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Symfony\Component\Form\Extension\Core\Type\TextType;

/**
 *
 */
class PreguntaAdmin extends AbstractAdmin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
    ->add('nivel', TextType::class, array(
          "label" => "dificultad",
        'attr' => ["class" => "Dificultad_Materias"]))
    ->add('materias', 'sonata_type_model', array(
          "label" => "Materia a la que pertenese",
          'placeholder'   => 'Selecciona una Materia...',
          'attr' => array('class' => 'boxUrlimg')))
    ->add('tipoPregunta', 'sonata_type_model', array(
          "label" => "Tipo de pregunta"))
    ->add('escrito', TextType::class, array(
          "label" => "Pregunta"))
    ->add('respuestas', 'sonata_type_model_list', array(
          "label" => "Respuesta",
        ), array(
        'placeholder' => 'Agrega una Respuesta'))
    ->add('imagen','sonata_type_collection', array(
          'by_reference' => false,
          'label' => 'Agregar Imagen (opcional)',
          'required'      => false,
          'type_options' => array(

              'delete' => false,
              'delete_options' => array(
                  // You may otherwise choose to put the field but hide it
                  'type'         => 'hidden',
                  // In that case, you need to fill in the options as well
                  'type_options' => array(
                      'mapped'   => false,
                      'required' => false,
                  )
              )
          )
        ), array(
            'edit' => 'inline',
            'inline' => 'table',
            'sortable' => 'position'
        ))
    ->add('audio','sonata_type_model_list', array(
          'by_reference' => false,
          'label' => 'Agregar Audio (opcional)',
          'required'      => false,
        ), array(
            'edit' => 'inline',
            'inline' => 'table',
            'sortable' => 'position'
        ))
    ->add('video','sonata_type_model_list', array(
          'by_reference' => false,
          'label' => 'Agregar Video (opcional)',
          'required'      => false,
        ), array(
            'edit' => 'inline',
            'inline' => 'table',
            'sortable' => 'position'
        ));
  }

  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
    ->add('escrito')
    ->add('materias')
    ->add('nivel')
    ->add('respuestas')
    ->add('tipoPregunta');
  }

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->addIdentifier('escrito')
    ->add('materias')
    ->add('nivel')
    ->add('respuestas')
    ->add('tipoPregunta');
  }

  // public function configure() {
  //   $this->setTemplate('edit', '@UtExamProEval/CRUD/edit_js_from_preguntas.html.twig');
  // }

  // public function configure() {
  //   $this->setTemplate('edit', '@UtExamProEval/CRUD/edit_js_from_preguntas.html.twig');
  // }
  // public function prePersist($object){
  //   //Variables
  //
  //   // $size = getpreguntasize($object->getMedia()->getPathname());
  //   // $object->setWidth($size[0]);
  //   // $object->setHeight($size[1]);
  //   // $object->setFormat($object->getMedia()->guessClientExtension());
  //   // $object->setMediaName($object->getMedia()->getClientOriginalName());
  //   // $object->setUpdatedAt(new \DateTime());
  //   return $object;
  // }
  public function prePersist($object){
    if (!is_null($object->getImagen())) {
      if (!empty($object->getImagen()->getValues())) {
        $imagenes= $object->getImagen()->getValues();
        $destino= __DIR__."/../Resources/public/images/archivosSubidos/imagenes/";
        foreach ($imagenes as $imagen) {
          if (!is_null($imagen->getarchive())) {
            $imgOrigen= $imagen->getarchive()->getrealPath();
            $imgName= $imagen->getarchive()->getClientOriginalName();
            move_uploaded_file($imgOrigen,$destino.$imgName);
            $imagen->setArchive($imgName);
          }
        }
      }
    }
    return $object;
  }
  public function preUpdate($object)
  {
    // move_uploaded_file($object->getImagen()[0]->getarchive()->getrealPath(),__DIR__."/../Resources/public/archivosDeUsuario".$object->getImagen()[0]->getarchive()->getClientOriginalName());

    $container = $this->getConfigurationPool()->getContainer();
    $em = $container->get('doctrine.orm.entity_manager');
    if (!is_null($object->getImagen())) {
      if (!empty($object->getImagen())) {
        $imagenes= $object->getImagen()->getValues();
        $destino= __DIR__."/../Resources/public/images/archivosSubidos/imagenes/";
        foreach ($imagenes as $imagen) {
          if (!is_null($imagen->getarchive())) {
            $imgOrigen= $imagen->getarchive()->getrealPath();
            $imgName= $imagen->getarchive()->getClientOriginalName();
            move_uploaded_file($imgOrigen,$destino.$imgName);
            $imagen->setArchive($imgName);
          }else {
            $id =$imagen->getId();
            $queryimg = $em->createQuery('
              SELECT i
              FROM UtExam\ProEvalBundle\Entity\ImagenPregunta i
              WHERE i.id = :id');
            $queryimg->setParameter('id', $id);
            $imgRes=$queryimg->getArrayResult();
            $imgName=$imgRes[0]['archive'];
            $imagen->setArchive($imgName);
          }
        }
      }
    }
    // move_uploaded_file($object->getImagen()[0]->getarchive()->getrealPath(),__DIR__."/../Resources/public/archivosDeUsuario".$object->getImagen()[0]->getarchive()->getClientOriginalName());

    return $object;
  }
}


 ?>
