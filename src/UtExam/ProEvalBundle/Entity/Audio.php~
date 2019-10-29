<?php

namespace UtExam\ProEvalBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * Audio
 *
 * @ORM\Table(name="audio")
 * @ORM\Entity(repositoryClass="UtExam\ProEvalBundle\Repository\AudioRepository")
 */
class Audio
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
     * @ORM\ManyToMany(targetEntity="Respuestas", mappedBy="audio")
     */
    private $respuestas;

    /**
     * @var string
     *
     * @ORM\Column(name="archive", type="string", length=255)
     */
    private $archive;

    public function __construct()
    {
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
     * @return Audio
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
     * @return Audio
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
     * @return Audio
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

    public function __toString()
    {
      return $this->nombre == null ? '' : $this->nombre;
    }

    /**
     * Set correcto.
     *
     * @param bool $correcto
     *
     * @return Audio
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
     * @return Audio
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
