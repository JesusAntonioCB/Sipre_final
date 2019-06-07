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
class AlumnosEnExamenAdmin extends AbstractAdmin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
    ->add('alumnos', TextType::class, array("label" => "Alumnos"))
    ->add('examen', TextType::class, array("label" => "Examen"));
  }

  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
    ->add('alumnos')
    ->add('examen');
  }

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->add('alumnos')
    ->add('examen');
  }

}


 ?>
