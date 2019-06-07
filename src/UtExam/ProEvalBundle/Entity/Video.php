<?php

namespace UtExam\ProEvalBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * Video
 *
 * @ORM\Table(name="video")
 * @ORM\Entity(repositoryClass="UtExam\ProEvalBundle\Repository\VideoRepository")
 */
class Video
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nombre", type="string", length=255)
     */
    private $nombre;

    /**
     * @var string
     *
     * @ORM\Column(name="url", type="string", length=255)
     */
    private $url;

    /**
     * @var string
     *
     * @ORM\Column(name="correcto", type="boolean")
     */
    private $correcto;

    /**
     * @ORM\ManyToMany(targetEntity="Respuestas", mappedBy="video")
     */
    private $respuestas;

    /**
     * @ORM\OneToMany(targetEntity="Pregunta", mappedBy="video")
     */
    private $pregunta;

    /**
     * @var string
     *
     * @ORM\Column(name="archive", type="string", length=255)
     */
    private $archive;

    public function __construct()
    {
        $this->pregunta = new ArrayCollection();
        $this->respuestas = new ArrayCollection();
    }


    /**
     * Get id.
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set nombre.
     *
     * @param string $nombre
     *
     * @return Video
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * Get nombre.
     *
     * @return string
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * Set url.
     *
     * @param string $url
     *
     * @return Video
     */
    public function setUrl($url)
    {
        $this->url = $url;

        return $this;
    }

    /**
     * Get url.
     *
     * @return string
     */
    public function getUrl()
    {
        return $this->url;
    }

    /**
     * Add respuesta.
     *
     * @param \UtExam\ProEvalBundle\Entity\Respuestas $respuesta
     *
     * @return Video
     */
    public function addRespuesta(\UtExam\ProEvalBundle\Entity\Respuestas $respuesta)
    {
        $this->respuestas[] = $respuesta;

        return $this;
    }

    /**
     * Remove respuesta.
     *
     * @param \UtExam\ProEvalBundle\Entity\Respuestas $respuesta
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeRespuesta(\UtExam\ProEvalBundle\Entity\Respuestas $respuesta)
    {
        return $this->respuestas->removeElement($respuesta);
    }

    /**
     * Get respuestas.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getRespuestas()
    {
        return $this->respuestas;
    }

    /**
     * Add preguntum.
     *
     * @param \UtExam\ProEvalBundle\Entity\Pregunta $preguntum
     *
     * @return Video
     */
    public function addPreguntum(\UtExam\ProEvalBundle\Entity\Pregunta $preguntum)
    {
        $this->pregunta[] = $preguntum;

        return $this;
    }

    /**
     * Remove preguntum.
     *
     * @param \UtExam\ProEvalBundle\Entity\Pregunta $preguntum
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removePreguntum(\UtExam\ProEvalBundle\Entity\Pregunta $preguntum)
    {
        return $this->pregunta->removeElement($preguntum);
    }

    /**
     * Get pregunta.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getPregunta()
    {
        return $this->pregunta;
    }

    public function __toString()
    {
      return $this->nombre == null ? '' : $this->nombre;
    }

    /**
     * Set correcto.
     *
     * @param bool $correcto
     *
     * @return Video
     */
    public function setCorrecto($correcto)
    {
        $this->correcto = $correcto;

        return $this;
    }

    /**
     * Get correcto.
     *
     * @return bool
     */
    public function getCorrecto()
    {
        return $this->correcto;
    }

    /**
     * Set archive.
     *
     * @param string $archive
     *
     * @return Video
     */
    public function setArchive($archive)
    {
        $this->archive = $archive;

        return $this;
    }

    /**
     * Get archive.
     *
     * @return string
     */
    public function getArchive()
    {
        return $this->archive;
    }
}
