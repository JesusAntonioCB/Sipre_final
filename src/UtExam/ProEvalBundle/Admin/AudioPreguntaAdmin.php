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
class AudioPreguntaAdmin extends AbstractAdmin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
    ->add('nombre', TextType::class, array("label" => "Nombre"))
    ->add('url', TextType::class, array(
          "label" => "Url (en caso de ser en linea)",
          'required' => false,
          "empty_data" => "NO APLICA",
          'attr' => array('class' => 'boxUrl'),
          ))
    ->add('archive', 'file', array(
                 'data_class'   =>  NULL,
                 'required' => false,
                 "label" => "Audio",
            ));
  }

  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
    ->add('nombre');
  }

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->addIdentifier('nombre');
  }

  public function configure() {
    $this->setTemplate('edit', '@UtExamProEval/Adminjs/edit_AdminAudio.html.twig');
  }
  public function prePersist($object){
    $destino= __DIR__."/../Resources/public/images/archivosSubidos/audios/";
    if (!is_null($object->getarchive())) {
      $vidOrigen= $object->getarchive()->getrealPath();
      $vidName= $object->getarchive()->getClientOriginalName();
      move_uploaded_file($vidOrigen,$destino.$vidName);
      $object->setArchive($vidName);
    }
    return $object;
  }
  public function preUpdate($object) {
    $container = $this->getConfigurationPool()->getContainer();
    $em = $container->get('doctrine.orm.entity_manager');
    $destino= __DIR__."/../Resources/public/images/archivosSubidos/audios/";
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
