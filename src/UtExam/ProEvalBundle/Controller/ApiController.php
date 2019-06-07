<?php

namespace UtExam\ProEvalBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
//use Doctrine paginator
use Doctrine\ORM\Tools\Pagination\Paginator;
/**
 * @Route("/api/v2")
 */
class ApiController extends Controller
{
    /**
     * @Route("/")
     */
    public function IndexAction()
    {
        echo "welcome to api final";
        die();
    }

    /**
     * @Route("/examen", name="examen")
     * @Route("/examen/{id}", name="examen_optional")
     *
     */
    public function GalleryAction($id=null)
    {
      $em = $this->getDoctrine()->getManager();
      if ($id!=null) {
        echo "Que bien";
        die();
      }else {
        $query = $em->createQuery('
          SELECT e, partial u.{id, username}, p, pr, res, text, aud, vid
          FROM UtExam\ProEvalBundle\Entity\Examen e
          LEFT JOIN e.user u
          LEFT JOIN e.pregunta p
          LEFT JOIN p.pregunta pr
          LEFT JOIN pr.respuestas res
          LEFT JOIN res.texto text
          LEFT JOIN res.audio aud
          LEFT JOIN res.video vid
          ORDER BY e.id DESC');
          $queryRes = new Paginator($query, $fetchJoinCollection = true);
          $examenRes=$query->getArrayResult();
          // dump($examenRes);
          // die;
          // dump(get_class_methods($queryRes->getIterator()));
          // dump($query->getSQL());
          // // dump($galleryRes=$query->getArrayResult());
          // dump($queryRes->getIterator()->getArrayCopy());
          // dump(json_encode($queryRes->getIterator()->getArrayCopy()));
          // $result=(object)$queryRes->getIterator()->getArrayCopy()[0];
          // dump($result);
          // dump(json_encode($result));
          // die();
          // $galleryRes=$query->getResult();
          // foreach ($galleryRes as $i => $value) {
          //   foreach ($galleryRes[$i]['image'] as $key => $url) {
          //     $galleryRes[$i]['image'][$key]['image']['url']="http://$_SERVER[HTTP_HOST]/image/".$url['image']['id'];
          //   }
          // }
       return new JsonResponse($examenRes);
      }
    }

    /**
     * @Route("/events", name="events")
     * @Route("/events/{number}", name="events_optional")
     *
     */
     public function lastEventAction($number=5){
        $em = $this->getDoctrine()->getManager();
        $limit = $number;
        $query = $em->createQuery('
          SELECT e, partial p.{id, name, address, phone}, pr, g,partial tE.{id, name}
          FROM PhotobookBundle\Entity\Event e
          LEFT JOIN e.gallery g
          LEFT JOIN e.typeEvent tE
          LEFT JOIN e.place p
          LEFT JOIN e.providers pr
          ORDER BY e.id DESC');
          $query->setMaxResults($limit);
          $queryRes = new Paginator($query, $fetchJoinCollection = true);
          $arrayEvents= array();
           foreach ($queryRes as $value) {
              $arrayEvents[] = $value->getAllData();
           }
       return new JsonResponse($arrayEvents);
     }

     /**
      * @Route("/author", name="author")
      * @Route("/author/{number}", name="author_optional")
      *
      */
     public function AuthorAction($number=5)
     {
       $limit = $number;
       $em = $this->getDoctrine()->getManager();
       $query = $em->createQuery('
         SELECT a, g, partial i.{id, name}
         FROM PhotobookBundle\Entity\Author a
         LEFT JOIN a.gallery g
         LEFT JOIN a.image i
         ORDER BY a.id DESC');
       $query->setMaxResults($limit);
       $authorRes=$query->getArrayResult();
       foreach ($authorRes as $i => $value) {
         foreach ($authorRes[$i]['image'] as $key => $url) {
           $authorRes[$i]['image'][$key]['url']="http://$_SERVER[HTTP_HOST]/image/".$url['id'];
         }
       }
       return new JsonResponse($authorRes);
     }

     /**
      * @Route("/location", name="location")
      * @Route("/location/{number}", name="location_optional")
      *
      */
     public function LocationAction($number=5)
     {
       $limit = $number;
       $em = $this->getDoctrine()->getManager();
       $query = $em->createQuery('
         SELECT l, partial p.{id, name}, partial g.{id, name}
         FROM PhotobookBundle\Entity\Location l
         LEFT JOIN l.publication p
         LEFT JOIN p.gallery g
         ORDER BY l.id DESC');
       $query->setMaxResults($limit);
       $authorRes=$query->getArrayResult();
       return new JsonResponse($authorRes);
     }

     /**
      * @Route("/people", name="people")
      * @Route("/people/{number}", name="people_optional")
      *
      */
     public function PeopleAction($number=5)
     {
       $limit = $number;
       $em = $this->getDoctrine()->getManager();
       $query = $em->createQuery('
         SELECT p, partial i.{id, name}
         FROM PhotobookBundle\Entity\People p
         LEFT JOIN p.image i
         ORDER BY p.id DESC');
       $query->setMaxResults($limit);
       $authorRes=$query->getArrayResult();
       // foreach ($authorRes as $i => $value) {
       //   dump($authorRes[$i]);
       //   // foreach ($authorRes[$i]['image'] as $key => $url) {
       //   //   $authorRes[$i]['image'][$key]['image']['url']="http://$_SERVER[HTTP_HOST]/image/".$url['image']['id'];
       //   // }
       // }
       // die();
       return new JsonResponse($authorRes);
     }

}
