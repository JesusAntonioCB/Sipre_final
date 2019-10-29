<?php
namespace UtExam\ProEvalBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Validator\Constraints\DateTime;
use Symfony\Component\Form\Extension\Core\Type\TimeType;
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
    ->add('tiempo', 'time', [
      'label' => 'Tiempo que durara el examen'])
    ->add('instrucciones', TextType::class, [
      'label' => 'Instrucciones del Examen'])
    ->add('codigoExam', TextType::class, [
      'label' => 'Codigo propio de examen'])
    ->add('materiaModa', 'sonata_type_model', [
      'label' => 'Materia al que pertenece el Examen',
      'required' => false,
      'btn_add'  => false
    ])
    ->add('propedeutico', null, array("label" => "Marque la casilla si este examen servira como el propedeutico"))
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
    ->add('user')
    ->add('propedeutico');
  }

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->addIdentifier('titulo')
    ->add('user')
    ->add('materiaModa')
    ->add('propedeutico');
  }

  public function createQuery($context = 'list'){
    $user =$this->getConfigurationPool()->getContainer()->get('security.token_storage')->getToken()->getUser()->getId();
    $query = parent::createQuery($context);
    $query->andWhere(
        $query->expr()->eq($query->getRootAliases()[0] . '.user', ':user')
    );
    $query->setParameter('user', (int)$user);
    return $query;
  }
  public function preValidate($object){
    $container = $this->getConfigurationPool()->getContainer();
    $em = $container->get('doctrine.orm.entity_manager');
    $materiasCount = [];
    if (empty($object->getMateriaModa())) {
      foreach ($object->getPregunta() as $pregunta) {
        array_push($materiasCount, $pregunta->getPregunta()->getMaterias()->getId());
      }
      $counts = array_count_values($materiasCount);
      arsort($counts);
      $top_with_count = array_slice($counts, 0, 5, true);
      $top = array_keys($top_with_count);
      if (!empty($top)) {
        $resMateria = $em->getRepository("UtExam\ProEvalBundle\Entity\Materias")
                    ->find((int)$top[0]);
        $object->setMateriaModa($resMateria);
      }
    }
    return $object;
  }

  public function prePersist($object){
    //Variables
    $user =$this->getConfigurationPool()->getContainer()->get('security.token_storage')->getToken()->getUser();
    date_default_timezone_set('America/Monterrey');
    $object->setFecha(date('Y-m-d H:i:s'));
    $object->setTipo(0);
    $object->setNivel(0);
    $object->setNivel(0);
    $object->setUser($user);
    foreach ($object->getPregunta() as $pregunta) {
      $pregunta->setExamen($object);
    }
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
    date_default_timezone_set('America/Monterrey');
    $object->setFechaActualizacion(date('Y-m-d H:i:s'));
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
