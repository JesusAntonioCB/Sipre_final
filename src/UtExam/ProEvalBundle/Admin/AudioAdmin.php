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
class AudioAdmin extends AbstractAdmin
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
          ))
    ->add('correcto', null, array(
            "label" => "¿Es el audio correcta?",
            'attr' => array('class' => 'chech_Box_Confirm_Correct'),
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
}


 ?>
