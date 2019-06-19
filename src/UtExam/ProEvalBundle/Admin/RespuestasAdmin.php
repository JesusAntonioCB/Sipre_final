<?php
namespace UtExam\ProEvalBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Sonata\AdminBundle\Form\Type\CollectionType;

/**
 *
 */
class RespuestasAdmin extends AbstractAdmin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
    ->add('texto','sonata_type_collection', array(
          'by_reference' => false,
          'label' => 'Respuesta en Texto',
          'required'      => false,
          'type_options'  => ['delete' => false],
        ), array(
            'edit' => 'inline',
            'inline' => 'table',
            'sortable' => 'position'
        ))
     ->add('imagen','sonata_type_collection', array(
           'by_reference' => false,
           'label' => 'Respuesta en Imagen',
           'required'      => false,
           'type_options' => array(

               'delete' => false,
               'delete_options' => array(
                   // You may otherwise choose to put the field but hide it
                   'type'         => 'hidden',
                   // In that case, you need to fill in the options as well
                   'type_options' => array(
                       'mapped'   => false,
                       'required' => false,
                   )
               )
           )
         ), array(
             'edit' => 'inline',
             'inline' => 'table',
             'sortable' => 'position',
         ))
      ->add('audio','sonata_type_collection', array(
            'by_reference' => false,
            'label' => 'Respuesta en Audio',
            'required'      => false,
            'type_options' => array(

                'delete' => false,
                'delete_options' => array(
                    // You may otherwise choose to put the field but hide it
                    'type'         => 'hidden',
                    // In that case, you need to fill in the options as well
                    'type_options' => array(
                        'mapped'   => false,
                        'required' => false,
                    )
                )
            )
          ), array(
              'edit' => 'inline',
              'inline' => 'table',
              'sortable' => 'position'
          ))
       ->add('video','sonata_type_collection',array(
             'by_reference' => false,
             'label' => 'Respuesta en Video',
             'required'      => false,
             'type_options' => array(

                 'delete' => false,
                 'delete_options' => array(
                     // You may otherwise choose to put the field but hide it
                     'type'         => 'hidden',
                     // In that case, you need to fill in the options as well
                     'type_options' => array(
                         'mapped'   => false,
                         'required' => false,
                     )
                 )
             )
           ), array(
               'edit' => 'inline',
               'inline' => 'table',
               'sortable' => 'position'
           ));
  }

  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
    ->add('texto');
  }

  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
    ->add('texto');
  }
  public function prePersist($object){
    if (!is_null($object->getImagen())) {
      if (!empty($object->getImagen()->getValues())) {
        $imagenes= $object->getImagen()->getValues();
        $destino= __DIR__."/../Resources/public/images/archivosSubidos/imagenes/";
        foreach ($imagenes as $imagen) {
          if (!is_null($imagen->getarchive())) {
            $imgOrigen= $imagen->getarchive()->getrealPath();
            $imgName= $imagen->getarchive()->getClientOriginalName();
            move_uploaded_file($imgOrigen,$destino.$imgName);
            $imagen->setArchive($imgName);
          }
        }
      }
    }
    if (!is_null($object->getVideo())) {
      if (!empty($object->getVideo()->getValues())) {
        $videos= $object->getVideo()->getValues();
        $destino= __DIR__."/../Resources/public/images/archivosSubidos/videos/";
        foreach ($videos as $video) {
          if (!is_null($video->getarchive())) {
            $vidOrigen= $video->getarchive()->getrealPath();
            $vidName= $video->getarchive()->getClientOriginalName();
            move_uploaded_file($vidOrigen,$destino.$vidName);
            $video->setArchive($vidName);
          }
        }
      }
    }
    if (!is_null($object->getAudio())) {
      if (!empty($object->getAudio()->getValues())) {
        $audios= $object->getAudio()->getValues();
        $destino= __DIR__."/../Resources/public/images/archivosSubidos/audios/";
        foreach ($audios as $audio) {
          if (!is_null($audio->getarchive())) {
            $audOrigen= $audio->getarchive()->getrealPath();
            $audName= $audio->getarchive()->getClientOriginalName();
            move_uploaded_file($audOrigen,$destino.$audName);
            $audio->setArchive($audName);
          }
        }
      }
    }
    return $object;
  }
  public function preUpdate($object)
  {
    $container = $this->getConfigurationPool()->getContainer();
    $em = $container->get('doctrine.orm.entity_manager');
    if (!is_null($object->getImagen())) {
      if (!empty($object->getImagen()->getValues())) {
        $imagenes= $object->getImagen()->getValues();
        $destino= __DIR__."/../Resources/public/images/archivosSubidos/imagenes/";
        foreach ($imagenes as $imagen) {
          if (!is_null($imagen->getarchive())) {
            $imgOrigen= $imagen->getarchive()->getrealPath();
            $imgName= $imagen->getarchive()->getClientOriginalName();
            move_uploaded_file($imgOrigen,$destino.$imgName);
            $imagen->setArchive($imgName);
          }else {
            $id =$imagen->getId();
            $queryimg = $em->createQuery('
              SELECT i
              FROM UtExam\ProEvalBundle\Entity\Imagen i
              WHERE i.id = :id');
            $queryimg->setParameter('id', $id);
            $imgRes=$queryimg->getArrayResult();
            $imgName=$imgRes[0]['archive'];
            $imagen->setArchive($imgName);
          }
        }
      }
    }
    if (!is_null($object->getVideo())) {
      if (!empty($object->getVideo()->getValues())) {
        $videos= $object->getVideo()->getValues();
        $destino= __DIR__."/../Resources/public/images/archivosSubidos/videos/";
        foreach ($videos as $video) {
          if (!is_null($video->getarchive())) {
            $vidOrigen= $video->getarchive()->getrealPath();
            $vidName= $video->getarchive()->getClientOriginalName();
            move_uploaded_file($vidOrigen,$destino.$vidName);
            $video->setArchive($vidName);
          }else {
            $id =$video->getId();
            $queryvid = $em->createQuery('
              SELECT v
              FROM UtExam\ProEvalBundle\Entity\Video v
              WHERE v.id = :id');
            $queryvid->setParameter('id', $id);
            $vidRes=$queryvid->getArrayResult();
            $vidName=$vidRes[0]['archive'];
            $video->setArchive($vidName);
          }
        }
      }
    }
    if (!is_null($object->getAudio())) {
      if (!empty($object->getAudio()->getValues())) {
        $audios= $object->getAudio()->getValues();
        $destino= __DIR__."/../Resources/public/images/archivosSubidos/audios/";
        foreach ($audios as $audio) {
          if (!is_null($audio->getarchive())) {
            $audOrigen= $audio->getarchive()->getrealPath();
            $audName= $audio->getarchive()->getClientOriginalName();
            move_uploaded_file($audOrigen,$destino.$audName);
            $audio->setArchive($audName);
          }else {
            $id =$audio->getId();
            $queryaud = $em->createQuery('
              SELECT a
              FROM UtExam\ProEvalBundle\Entity\Audio a
              WHERE a.id = :id');
            $queryaud->setParameter('id', $id);
            $audRes=$queryaud->getArrayResult();
            $audName=$audRes[0]['archive'];
            $audio->setArchive($audName);
          }
        }
      }
    }
    return $object;
  }
}


 ?>
