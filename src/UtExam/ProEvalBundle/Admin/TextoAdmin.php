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
class TextoAdmin extends AbstractAdmin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
    ->add('escrito', TextType::class, array("label" => "Texto"))
    ->add('correcto', null, array("label" => "¿Es la respuesta correcta?"));
  }

  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
    ->add('escrito');
  }

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->addIdentifier('escrito')
    ->add('correcto');
  }
}


 ?>
