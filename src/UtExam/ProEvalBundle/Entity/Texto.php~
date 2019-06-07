<?php

namespace UtExam\ProEvalBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * Texto
 *
 * @ORM\Table(name="texto")
 * @ORM\Entity(repositoryClass="UtExam\ProEvalBundle\Repository\TextoRepository")
 */
class Texto
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
     * @ORM\Column(name="Escrito", type="string", length=255)
     */
    private $escrito;

    /**
     * @var string
     *
     * @ORM\Column(name="correcto", type="boolean")
     */
    private $correcto;

    /**
     * @ORM\ManyToMany(targetEntity="Respuestas", mappedBy="texto")
     */
    private $respuestas;

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
     * Set escrito.
     *
     * @param string $escrito
     *
     * @return Texto
     */
    public function setEscrito($escrito)
    {
        $this->escrito = $escrito;

        return $this;
    }

    /**
     * Get escrito.
     *
     * @return string
     */
    public function getEscrito()
    {
        return $this->escrito;
    }

    /**
     * Set correcto.
     *
     * @param string $correcto
     *
     * @return Texto
     */
    public function setCorrecto($correcto)
    {
        $this->correcto = $correcto;

        return $this;
    }

    /**
     * Get correcto.
     *
     * @return string
     */
    public function getCorrecto()
    {
        return $this->correcto;
    }

    /**
     * Add respuesta.
     *
     * @param \UtExam\ProEvalBundle\Entity\Respuestas $respuesta
     *
     * @return Texto
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
      return $this->escrito == null ? '' : $this->escrito;
    }
}
