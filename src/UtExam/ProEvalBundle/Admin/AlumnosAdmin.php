<?php
namespace UtExam\ProEvalBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Validator\Constraints\DateTime;
use Sonata\AdminBundle\Form\Type\ChoiceFieldMaskType;

/**
 *
 */
class AlumnosAdmin extends AbstractAdmin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
    ->add('nombre', TextType::class, [
      'label' => 'Nombre'])
    ->add('carrera', null, ['label' => 'Carrera'])
    ->add('examen', null, ['label' => 'Examen Fijo Contestado'])
    ->add('examenAuto', null, ['label' => 'Examene Propedeutico'])
    ->add('fecha', null, ['label' => 'Fecha'])
    ->add('tiempo', null, ['label' => 'Duracion de Examen'])
    ->add('calificacion', null, ['label' => 'Calificacion'])
    ->add('codigoUsuario', null, ['label' => 'Codigo unico de Alumno'])
    ->add('turno', ChoiceFieldMaskType::class, [
      'choices' => [
          'Matutino' => 'Matutino',
          'Nocturno' => 'Nocturno',
      ],
      'placeholder' => 'Selecciona una turno']);
  }

  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
    ->add('examen',null,["label"=>"Examen Fijo"])
    ->add('examenAuto')
    ->add('nombre')
    ->add('turno')
    ->add('fecha')
    ->add('calificacion');
  }

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->addIdentifier('nombre')
    ->add('turno')
    ->add('examen',null,["label"=>"Examen Fijo"])
    ->add('examenAuto')
    ->add('fecha')
    ->add('tiempo')
    ->add('calificacion')
    ->add('codigoUsuario');
  }

  public function prePersist($object){
    //Variables
    // dump($object->getExamen());
    // dump(get_class_methods($object->getExamen()));
    // die;
    $usercode= chr(rand(ord("a"), ord("z"))).rand(1, 9).chr(rand(ord("a"), ord("z"))).
               chr(rand(ord("a"), ord("z"))).rand(1, 9).chr(rand(ord("a"), ord("z"))).
               chr(rand(ord("a"), ord("z"))).rand(1, 9).chr(rand(ord("a"), ord("z"))).
               rand(1, 9).rand(1, 9).chr(rand(ord("a"), ord("z"))).rand(1, 9).rand(1, 9).
               chr(rand(ord("a"), ord("z"))).rand(1, 9).chr(rand(ord("a"), ord("z"))).
               chr(rand(ord("a"), ord("z"))).rand(1, 9).chr(rand(ord("a"), ord("z")));
    date_default_timezone_set('America/Monterrey');
    $object->setFecha(date('Y-m-d H:i:s'));
    $object->setTiempo(0);
    $object->setCalificacion(0);
    $object->setCodigoUsuario($usercode);
    // dump($usercode);
    // dump($object);
    // die;
    return $object;
  }
}
?>
