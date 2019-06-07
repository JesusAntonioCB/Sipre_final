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
class preguntasinExamenAdmin extends AbstractAdmin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
    ->add('pregunta', 'sonata_type_model_list', [
             'label'                 => 'Preguntas',
             'by_reference'          => false
         ]);
  }

  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
    ->add('pregunta');

  }

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->addIdentifier('pregunta');
  }

  // public function preUpdate($object)
  // {
  //   dump($object);
  //   die();
  // }
}
