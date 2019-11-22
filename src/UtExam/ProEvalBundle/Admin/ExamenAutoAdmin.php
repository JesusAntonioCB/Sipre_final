<?php
namespace UtExam\ProEvalBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ShowBuilder;
use Sonata\AdminBundle\Form\FormMapper;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Validator\Constraints\DateTime;
use Sonata\AdminBundle\Form\Type\ChoiceFieldMaskType;
use Application\Sonata\UserBundle\Entity\User;
use Sonata\AdminBundle\Route\RouteCollection;
use UtExam\ProEvalBundle\Entity\Alumnos;
use Symfony\Component\Security\Core\SecurityContextInterface;
use Sonata\DatagridBundle\ProxyQuery\Doctrine\ProxyQuery;

/**
 *
 */
class ExamenAutoAdmin extends AbstractAdmin
{

  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
    ->add('titulo', TextType::class, [
      'label' => 'Titulo del examen'])
    ->add('tiempo', 'time', [
      'label' => 'Tiempo que durara el examen'])
    ->add('instrucciones', TextType::class, [
      'label' => 'Instrucciones del examen'])
    ->add('codigoExam', TextType::class, [
      'label' => 'Codigo propio de examen'])
    ->add('propedeutico', null, array("label" => "Marque la casilla si este examen servira como el propedeutico"))
    ->add('preguntasAuto', 'sonata_type_collection', array(
      'label' => 'preguntas'
      ), array(
          'edit' => 'inline',
          'inline' => 'table',
          'sortable' => 'position'
      ));
  }

  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
    ->add('titulo')
    ->add('alumnos')
    ->add('user')
    ->add('preguntasAuto')
    ->add('propedeutico');
  }

  public function createQuery($context = 'list'){
    $user =$this->getConfigurationPool()->getContainer()->get('security.token_storage')->getToken()->getUser();
    if ($user->hasRole("ROLE_SUPER_ADMIN")) {
      $query = parent::createQuery($context);
      return $query;
    }else {
      $userid=$user->getId();
      $query = parent::createQuery($context);
      $query->andWhere(
          $query->expr()->eq($query->getRootAliases()[0] . '.user', ':user')
      );
      $query->setParameter('user', (int)$userid);
      return $query;
    }
  }

  // protected $datagridValues = array (
  //         'user' => array ('value' => 1), // type 2 : >
  //         '_page' => 2, // Display the first page (default = 1)
  //         '_sort_order' => 'DESC', // Descendant ordering (default = 'ASC')
  //         '_sort_by' => 'id' // name of the ordered field (default = the model id field, if any)
  //    // the '_sort_by' key can be of the form 'mySubModel.mySubSubModel.myField'.
  // );

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->addIdentifier('titulo')
    ->add('codigoExam')
    ->add('user')
    ->add('preguntasAuto')
    ->add('materiaModa')
    ->add('propedeutico');
  }

  public function configure() {
    $this->setTemplate('edit', '@UtExamProEval/CRUD/edit_js_from_preguntas.html.twig');
  }

  public function preValidate($object){
    $container = $this->getConfigurationPool()->getContainer();
    $em = $container->get('doctrine.orm.entity_manager');
    $materiasCount = [];
    if (empty($object->getMateriaModa())) {
      foreach ($object->getPreguntasAuto() as $pregunta) {
        for ($i=0; $i < (int)$pregunta->getCantidad(); $i++) {
          array_push($materiasCount, $pregunta->getMaterias()->getId());
        }
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
    $container = $this->getConfigurationPool()->getContainer();
    $em = $container->get('doctrine.orm.entity_manager');
    $result= 0;
    $noFullP= count($object->getPreguntasAuto());
    $user =$this->getConfigurationPool()->getContainer()->get('security.token_storage')->getToken()->getUser();
    date_default_timezone_set('America/Monterrey');
    $object->setFecha(date('Y-m-d H:i:s'));
    $object->setTipo(0);
    $object->setNivel(0);
    $object->setUser($user);
    //agregar preguntas a preguntasAuto
    foreach ($object->getPreguntasAuto() as $preguntaAuto) {
      //obtener promedio
      $y= (int)$preguntaAuto->getNivel();
      $result+=$y;
      //constantes que serviran como filtros
      $numberOfPreguntas= (int)$preguntaAuto->getCantidad();
      $idOfMateria= $preguntaAuto->getMaterias()->getId();
      $idOfTypePregunta= $preguntaAuto->getTipoPregunta()->getId();
      $Dificultad=$preguntaAuto->getNivel();

      //otencion de cantidad de de preguntas que existen
      $query = $em->createQuery('
        SELECT partial p.{id}
        FROM UtExam\ProEvalBundle\Entity\Pregunta p
        WHERE p.nivel = :nivel
        AND p.materias = :idMateria
        AND p.tipoPregunta = :idTypePregunta');//p.nivel = :nivel AND
      $query->setParameter('nivel', $Dificultad );
      $query->setParameter('idMateria', $idOfMateria);
      $query->setParameter('idTypePregunta', $idOfTypePregunta);
      $NumberRes=$query->getArrayResult();
      //conseguir la misma cantidad de numeros random como preguntas existen
      $rand = range(0, count($NumberRes)-1);
      shuffle($rand);
      //Preguntar si existen la cantidad de preguntas que piden
      if ($numberOfPreguntas > count($NumberRes)) {
        var_dump("
        <h2>no hay tantas preguntas con los parametros seleccionados</h2>
        <button onclick='goBack()'>Go Back</button>
        <script>
          function goBack() {
            window.history.back();
          }
        </script>
        ");
        die();
      }
      for ($i=0; $i < $numberOfPreguntas; $i++) {
        //agregar a el objeto las preguntas con los filtros correspondientes
        $query2 = $em->createQuery('
          SELECT p
          FROM UtExam\ProEvalBundle\Entity\Pregunta p
          WHERE p.id = :id');
        $query2->setParameter('id', $NumberRes[$rand[$i]]['id']);
        $preguntasRes=$query2->getResult();
        $preguntaAuto->addPreguntum($preguntasRes[0]);
      }
    }
    $object->setNivel($result/=$noFullP);
    return $object;
  }
  public function preUpdate($object){
    //Variables
    $container = $this->getConfigurationPool()->getContainer();
    $em = $container->get('doctrine.orm.entity_manager');
    $result= 0;
    $noFullP= count($object->getPreguntasAuto());
    //agregar preguntas a preguntasAuto
    foreach ($object->getPreguntasAuto() as $preguntaAuto) {
      date_default_timezone_set('America/Monterrey');
      $object->setFechaActualizacion(date('Y-m-d H:i:s'));
      $query = $em->createQuery('
        SELECT partial pA.{id}, partial p.{id}
        FROM UtExam\ProEvalBundle\Entity\PreguntasAuto pA
        LEFT JOIN pA.pregunta p
        WHERE pA.id = :id');
      $query->setParameter('id', $preguntaAuto->getId());
      $preguntasRes=$query->getArrayResult();
      $resNumber=0;
      if(!empty($preguntasRes[0])) $resNumber = count($preguntasRes[0]['pregunta']);
      if ($resNumber != (int)$preguntaAuto->getCantidad()) {
        //obtener promedio
        $y= (int)$preguntaAuto->getNivel();
        $result+=$y;
        //constantes que serviran como filtros
        $numberOfPreguntas= (int)$preguntaAuto->getCantidad();
        $idOfMateria= $preguntaAuto->getMaterias()->getId();
        if (!is_null($preguntaAuto->getTipoPregunta()->getId())) {
          $idOfTypePregunta= $preguntaAuto->getTipoPregunta()->getId();
        }else {
          var_dump("
          <h2>no se selecciono el tipo de preguunta</h2>
          <button onclick='goBack()'>Go Back</button>
          <script>
            function goBack() {
              window.history.back();
            }
          </script>
          ");
          die;
        }
        $Dificultad=$preguntaAuto->getNivel();

        //otencion de cantidad de de preguntas que existen
        $query = $em->createQuery('
          SELECT partial p.{id}
          FROM UtExam\ProEvalBundle\Entity\Pregunta p
          WHERE p.nivel = :nivel
          AND p.materias = :idMateria
          AND p.tipoPregunta = :idTypePregunta');//p.nivel = :nivel AND
        $query->setParameter('nivel', $Dificultad );
        $query->setParameter('idMateria', $idOfMateria);
        $query->setParameter('idTypePregunta', $idOfTypePregunta);
        $NumberRes=$query->getArrayResult();
        //conseguir la misma cantidad de numeros random como preguntas existen
        $rand = range(0, count($NumberRes)-1);
        shuffle($rand);
        //Preguntar si existen la cantidad de preguntas que piden
        if ($numberOfPreguntas > count($NumberRes)) {
          var_dump("
          <h2>no hay tantas preguntas con los parametros seleccionados</h2>
          <button onclick='goBack()'>Go Back</button>
          <script>
            function goBack() {
              window.history.back();
            }
          </script>
          ");
          die();
        }
        if ($resNumber != 0) {
          foreach ($resNumber as $pregunta) {
            $resPregunta = $em->getRepository("UtExam\ProEvalBundle\Entity\Pregunta")
                        ->find($pregunta['id']);
            $preguntaAuto->removePreguntum($resPregunta);
          }
        }
        for ($i=0; $i < $numberOfPreguntas; $i++) {
          //agregar a el objeto las preguntas con los filtros correspondientes
          $query2 = $em->createQuery('
            SELECT p
            FROM UtExam\ProEvalBundle\Entity\Pregunta p
            WHERE p.id = :id');
          $query2->setParameter('id', $NumberRes[$rand[$i]]['id']);
          $preguntasRes=$query2->getResult();
          $preguntaAuto->addPreguntum($preguntasRes[0]);
        }
      }
    }
    $object->setNivel($result/=$noFullP);
    return $object;
  }
}
?>
