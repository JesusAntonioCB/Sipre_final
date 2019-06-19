<?php
namespace UtExam\ProEvalBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Sonata\MediaBundle\Form\Type\MediaType;

/**
 *
 */
class ImagenPreguntaAdmin extends AbstractAdmin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
    // 'attr' => array('class' => 'tinymce'), probar
    ->add('nombre', TextType::class, array("label" => "Nombre"))
    ->add('url', null, array(
          "label" => "Url (en caso de ser en linea)",
          'required' => false,
          "empty_data" => "NO APLICA",
          'attr' => array('class' => 'boxUrlimg')
          ))
    ->add('archive', 'file', array(
                 'data_class'   =>  NULL,
                 'required' => false,
                 "label" => "Imagen",
            ));
  }

  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
    ->add('nombre')
    ->add('url');
  }

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->addIdentifier('nombre')
    ->addIdentifier('url');
  }

  // public function configure() {
  //   $this->setTemplate('edit', '@UtExamProEval/CRUD/edit_js_from_preguntas.html.twig');
  //   // $this->setTemplate('edit', '@UtExamProEval/Adminjs/edit_AdminImagen.html.twig');
  // }
  public function prePersist($object){
    $destino= __DIR__."/../Resources/public/images/archivosSubidos/videos/";
    if (!is_null($object->getarchive())) {
      $vidOrigen= $object->getarchive()->getrealPath();
      $vidName= $object->getarchive()->getClientOriginalName();
      move_uploaded_file($vidOrigen,$destino.$vidName);
      $object->setArchive($vidName);
    }
    return $object;
  }
  public function preUpdate($object)
  {
    $container = $this->getConfigurationPool()->getContainer();
    $em = $container->get('doctrine.orm.entity_manager');
    $destino= __DIR__."/../Resources/public/images/archivosSubidos/videos/";
    if (!is_null($object->getarchive())) {
      $vidOrigen= $object->getarchive()->getrealPath();
      $vidName= $object->getarchive()->getClientOriginalName();
      move_uploaded_file($vidOrigen,$destino.$vidName);
      $object->setArchive($vidName);
    }else {
      $id =$object->getId();
      $queryvid = $em->createQuery('
        SELECT v
        FROM UtExam\ProEvalBundle\Entity\VideoPregunta v
        WHERE v.id = :id');
      $queryvid->setParameter('id', $id);
      $vidRes=$queryvid->getArrayResult();
      $vidName=$vidRes[0]['archive'];
      $object->setArchive($vidName);
    }
    return $object;
  }
}


 ?>
