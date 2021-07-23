<?php
namespace UtExam\ProEvalBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Sonata\AdminBundle\Form\Type\ChoiceFieldMaskType;

/**
 *
 */
class MaestrosAdmin extends AbstractAdmin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
    ->add('nombre', TextType::class, array("label" => "Nombre"))
    ->add('turno', ChoiceFieldMaskType::class, [
      'choices' => [
          'Matutino' => 'Matutino',
          'Nocturno' => 'Nocturno',
      ],
      'placeholder' => 'Selecciona una turno'])
    ->add('materias', 'sonata_type_model', array("label" => "Materia"));
  }

  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
    ->add('nombre')
    ->add('turno')
    ->add('materias');
  }

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->addIdentifier('nombre')
    ->add('turno')
    ->add('materias');
  }

}
?>
