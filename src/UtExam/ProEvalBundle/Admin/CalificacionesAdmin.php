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
    ->add('materias', null, array("label" => "Materia"));
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
