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

/**
 *
 */
class ExamenAdmin extends AbstractAdmin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
    ->add('titulo', TextType::class, [
      'label' => 'Titulo'])
    ->add('instrucciones', TextType::class, [
      'label' => 'Instrucciones del Examen'])
    ->add('codigoExam', TextType::class, [
      'label' => 'Codigo propio de examen'])
    ->add('pregunta', 'sonata_type_collection', array(
      'label' => 'preguntas',
      ),
      array(
             'edit'                  => 'inline',
             'inline'                => 'table',
             'sortable'              => 'position'
     ));
  }

  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
    ->add('titulo')
    ->add('alumnos')
    ->add('user');
  }

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->addIdentifier('titulo')
    ->add('user');
  }

  public function prePersist($object){
    //Variables
    $user =$this->getConfigurationPool()->getContainer()->get('security.token_storage')->getToken()->getUser();
    // dump($user);
    date_default_timezone_set('America/Monterrey');
    $object->setFecha(date('Y-m-d H:i:s'));
    $object->setTipo(0);
    $object->setNivel(0);
    $object->setNivel(0);
    $object->setUser($user);
    foreach ($object->getPregunta() as $pregunta) {
      $pregunta->setExamen($object);
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
  public function preUpdate($object)
  {
    foreach ($object->getPregunta() as $pregunta) {
      $pregunta->setExamen($object);
      if($pregunta->getPregunta() == null){
        $pregunta->setExamen(null);
      }
    }
    return $object;
  }
}
?>
