<?php
namespace UtExam\ProEvalBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
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
    ->add('username')
    ->add('contrasena')
    ->add('carrera', null, ['label' => 'Carrera'])
    ->add('maestros', null, ['label' => 'Maestro'])
    ->add('grupo', null, ['label' => 'Grupo'])
    ->add('examen', null, ['label' => 'Examen Fijo Contestado'])
    ->add('examenAuto', null, ['label' => 'Examene Propedeutico'])
    ->add('fecha', null, ['label' => 'Fecha'])
    ->add('tiempo', null, ['label' => 'Duracion de Examen'])
    ->add('calificaciones', "sonata_type_collection", [
      'label' => 'Calificaciones'])
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
    ->add('grupo')
    ->add('maestros')
    ->add('examenAuto')
    ->add('nombre')
    ->add('username')
    ->add('contrasena')
    ->add('turno')
    ->add('fecha');
  }

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->addIdentifier('nombre')
    ->add('username')
    ->add('contrasena',null,["label"=>"Contraseña"])
    ->add('turno')
    ->add('maestros')
    ->add('examen',null,["label"=>"Examen Fijo"])
    ->add('grupo')
    ->add('examenAuto')
    ->add('fecha')
    ->add('codigoUsuario')
    // add custom action links
    ->add('_action', 'actions', [
        'actions' => [
            'view' => [],
            'edit' => [],
            'delete' => [],
        ]
    ]);
  }
  protected function configureShowFields(ShowMapper $showMapper){
        $showMapper
            ->tab('General') // the tab call is optional
                ->with('Alumno', [
                    'class'       => 'col-md-8',
                    'box_class'   => 'box box-solid box-primary',
                    'description' => 'Descripción del alumno',
                ])
                  ->add('nombre')
                  ->add('username')
                  ->add('contrasena')
                  ->add('turno')
                  ->add('grupo')
                  ->add('maestros')
                  ->add('examen')
                  ->add('examenAuto')
                  ->add('fecha')
                  ->add('calificaciones')
                  ->add('codigoUsuario')
                ->end()
            ->end()
        ;
    }

  public function preValidate($object){
    // if (!is_null($object->getCalificaciones())) {
    //   if (!empty($object->getCalificaciones()->getValues())) {
    //     $calificaciones= $object->getCalificaciones()->getValues();
    //     foreach ($calificaciones as $calificacion) {
    //       $calificacion->setAlumnos($object);
    //     }
    //   }
    // }
  }

  public function prePersist($object){
    //Variables
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
    return $object;
  }

  public function preUpdate($object){
    date_default_timezone_set('America/Monterrey');
    $object->setFechaActualizacion(date('Y-m-d H:i:s'));
    return $object;
  }

//   public function getExportFields() {
//     return array('id','customer.First_name','customer.Last_name',
//         'customer.contact','totalAmountFormated'
//         );
// }
}
?>
