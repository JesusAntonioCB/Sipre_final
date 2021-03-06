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
class CalificacionesAdmin extends AbstractAdmin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
    ->add('calificacion', null, array("label" => "Calificacion"))
    ->add('evaluacion', null, array("label" => "Calificacion"))
    ->add('caliMateria', "sonata_type_collection", array(
      "label" => "Materia"), [
          'edit' => 'inline',
          'inline' => 'table'
      ])
    ->add('examen', null, array("label" => "Examen"))
    ->add('examenAuto', null, array("label" => "Examen Automatico"));
  }

  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
    ->add('calificacion');
  }

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->add('id')
    ->addIdentifier('calificacion');
  }
}


 ?>
