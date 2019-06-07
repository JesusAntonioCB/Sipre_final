<?php

namespace UtExam\ProEvalBundle\Entity;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Respuestas
 *
 * @ORM\Table(name="respuestas")
 * @ORM\Entity(repositoryClass="UtExam\ProEvalBundle\Repository\RespuestasRepository")
 */
class Respuestas
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
     * @ORM\ManyToMany(targetEntity="Video", inversedBy="respuestas", cascade={"persist"})
     * @ORM\JoinTable(name="respuestas_video",
     *     joinColumns={
     *     @ORM\JoinColumn(name="respuestas_id", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="video_id", referencedColumnName="id")
     *   }
     * )
     */
    private $video;

    /**
     * @ORM\ManyToMany(targetEntity="Imagen", inversedBy="respuestas", cascade={"persist"})
     * @ORM\JoinTable(name="respuestas_imagen",
     *     joinColumns={
     *     @ORM\JoinColumn(name="respuestas_id", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="imagen_id", referencedColumnName="id")
     *   }
     * )
     */
    private $imagen;

    /**
     * @ORM\ManyToMany(targetEntity="Audio", inversedBy="respuestas", cascade={"persist"})
     * @ORM\JoinTable(name="respuestas_audio",
     *     joinColumns={
     *     @ORM\JoinColumn(name="respuestas_id", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="audio_id", referencedColumnName="id")
     *   }
     * )
     */
    private $audio;

    /**
     * @ORM\ManyToMany(targetEntity="Texto", inversedBy="respuestas", cascade={"persist"})
     * @ORM\JoinTable(name="respuestas_texto",
     *     joinColumns={
     *     @ORM\JoinColumn(name="respuestas_id", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="texto_id", referencedColumnName="id")
     *   }
     * )
     */
    private $texto;

    public function __construct()
    {
        $this->imagen = new ArrayCollection();
        $this->texto = new ArrayCollection();
        $this->audio = new ArrayCollection();
        $this->video = new ArrayCollection();
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
     * Add video.
     *
     * @param \UtExam\ProEvalBundle\Entity\Video $video
     *
     * @return Respuestas
     */
    public function addVideo(\UtExam\ProEvalBundle\Entity\Video $video)
    {
        $this->video[] = $video;

        return $this;
    }

    /**
     * Remove video.
     *
     * @param \UtExam\ProEvalBundle\Entity\Video $video
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeVideo(\UtExam\ProEvalBundle\Entity\Video $video)
    {
        return $this->video->removeElement($video);
    }

    /**
     * Get video.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getVideo()
    {
        return $this->video;
    }

    /**
     * Add imagen.
     *
     * @param \UtExam\ProEvalBundle\Entity\Imagen $imagen
     *
     * @return Respuestas
     */
    public function addImagen(\UtExam\ProEvalBundle\Entity\Imagen $imagen)
    {
        $this->imagen[] = $imagen;

        return $this;
    }

    /**
     * Remove imagen.
     *
     * @param \UtExam\ProEvalBundle\Entity\Imagen $imagen
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeImagen(\UtExam\ProEvalBundle\Entity\Imagen $imagen)
    {
        return $this->imagen->removeElement($imagen);
    }

    /**
     * Get imagen.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getImagen()
    {
        return $this->imagen;
    }

    /**
     * Add audio.
     *
     * @param \UtExam\ProEvalBundle\Entity\Audio $audio
     *
     * @return Respuestas
     */
    public function addAudio(\UtExam\ProEvalBundle\Entity\Audio $audio)
    {
        $this->audio[] = $audio;

        return $this;
    }

    /**
     * Remove audio.
     *
     * @param \UtExam\ProEvalBundle\Entity\Audio $audio
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeAudio(\UtExam\ProEvalBundle\Entity\Audio $audio)
    {
        return $this->audio->removeElement($audio);
    }

    /**
     * Get audio.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getAudio()
    {
        return $this->audio;
    }

    /**
     * Add texto.
     *
     * @param \UtExam\ProEvalBundle\Entity\Texto $texto
     *
     * @return Respuestas
     */
    public function addTexto(\UtExam\ProEvalBundle\Entity\Texto $texto)
    {
        $this->texto[] = $texto;

        return $this;
    }

    /**
     * Remove texto.
     *
     * @param \UtExam\ProEvalBundle\Entity\Texto $texto
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeTexto(\UtExam\ProEvalBundle\Entity\Texto $texto)
    {
        return $this->texto->removeElement($texto);
    }

    /**
     * Get texto.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getTexto()
    {
        return $this->texto;
    }

    public function __toString(){
      if (!$this->imagen->isEmpty()) {
        foreach ($this->imagen->getValues() as $value) {
          if ($value->getCorrecto()) {
            return $value->getNombre();
          }
        }
      }
      if (!$this->audio->isEmpty()) {
        foreach ($this->audio->getValues() as $value) {
          if ($value->getCorrecto()) {
            return $value->getNombre();
          }
        }
      }
      if (!$this->video->isEmpty()) {
        foreach ($this->video->getValues() as $value) {
          if ($value->getCorrecto()) {
            return $value->getNombre();
          }
        }
      }
      if (!$this->texto->isEmpty()) {
        foreach ($this->texto->getValues() as $value) {
          if ($value->getCorrecto()) {
            return $value->getEscrito();
          }
        }
      }
      return "No existe una respuesta correcta";
    }
}
