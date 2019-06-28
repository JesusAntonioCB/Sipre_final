<?php

namespace UtExam\ProEvalBundle\Entity;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Materias
 *
 * @ORM\Table(name="materias")
 * @ORM\Entity(repositoryClass="UtExam\ProEvalBundle\Repository\MateriasRepository")
 */
class Materias
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
     * @ORM\OneToMany(targetEntity="Pregunta", mappedBy="materias")
     */
    private $pregunta;

    /**
     * @ORM\OneToMany(targetEntity="PreguntasAuto", mappedBy="materias")
     */
    private $preguntasAuto;

    /**
     * @ORM\OneToMany(targetEntity="Maestros", mappedBy="materias")
     */
    private $maestros;

    public function __construct()
    {
        $this->pregunta = new ArrayCollection();
        $this->preguntasAuto = new ArrayCollection();
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
     * @return Materias
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
     * Add preguntum.
     *
     * @param \UtExam\ProEvalBundle\Entity\Pregunta $preguntum
     *
     * @return Materias
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

    public function __toString(){
      return $this->nombre == null ? '' : $this->nombre;
    }

    /**
     * Add preguntasAuto.
     *
     * @param \UtExam\ProEvalBundle\Entity\PreguntasAuto $preguntasAuto
     *
     * @return Materias
     */
    public function addPreguntasAuto(\UtExam\ProEvalBundle\Entity\PreguntasAuto $preguntasAuto)
    {
        $this->preguntasAuto[] = $preguntasAuto;

        return $this;
    }

    /**
     * Remove preguntasAuto.
     *
     * @param \UtExam\ProEvalBundle\Entity\PreguntasAuto $preguntasAuto
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removePreguntasAuto(\UtExam\ProEvalBundle\Entity\PreguntasAuto $preguntasAuto)
    {
        return $this->preguntasAuto->removeElement($preguntasAuto);
    }

    /**
     * Get preguntasAuto.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getPreguntasAuto()
    {
        return $this->preguntasAuto;
    }


    /**
     * Add maestro.
     *
     * @param \UtExam\ProEvalBundle\Entity\Maestros $maestro
     *
     * @return Materias
     */
    public function addMaestro(\UtExam\ProEvalBundle\Entity\Maestros $maestro)
    {
        $this->maestros[] = $maestro;

        return $this;
    }

    /**
     * Remove maestro.
     *
     * @param \UtExam\ProEvalBundle\Entity\Maestros $maestro
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeMaestro(\UtExam\ProEvalBundle\Entity\Maestros $maestro)
    {
        return $this->maestros->removeElement($maestro);
    }

    /**
     * Get maestros.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getMaestros()
    {
        return $this->maestros;
    }
}
