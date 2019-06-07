<?php

namespace UtExam\ProEvalBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * PreguntasAuto
 *
 * @ORM\Table(name="preguntas_auto")
 * @ORM\Entity(repositoryClass="UtExam\ProEvalBundle\Repository\PreguntasAutoRepository")
 */
class PreguntasAuto
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
     * @ORM\Column(name="cantidad", type="string", length=255)
     */
    private $cantidad;

    /**
     * @var string
     *
     * @ORM\Column(name="nivel", type="string", length=255)
     */
    private $nivel;

    /**
     * @ORM\ManyToMany(targetEntity="ExamenAuto", mappedBy="preguntasAuto")
     */
    private $examenAuto;

    /**
     * @ORM\ManyToOne(targetEntity="Materias", inversedBy="preguntasAuto")
     * @ORM\JoinColumn(name="materias_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $materias;

    /**
     * @ORM\ManyToOne(targetEntity="TipoPregunta", inversedBy="preguntasAuto")
     * @ORM\JoinColumn(name="tipoPregunta_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $tipoPregunta;

    /**
     * @ORM\ManyToMany(targetEntity="Pregunta", inversedBy="preguntasAuto")
     * @ORM\JoinTable(name="preguntasAuto_Pregunta",
     *     joinColumns={
     *     @ORM\JoinColumn(name="preguntasAuto_id", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="Pregunta_id", referencedColumnName="id")
     *   }
     * )
     */
    private $pregunta;


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
     * Constructor
     */
    public function __construct()
    {
        $this->examenAuto = new ArrayCollection();
        $this->pregunta = new ArrayCollection();
    }

    /**
     * Set cantidad.
     *
     * @param string $cantidad
     *
     * @return PreguntasAuto
     */
    public function setCantidad($cantidad)
    {
        $this->cantidad = $cantidad;

        return $this;
    }

    /**
     * Get cantidad.
     *
     * @return string
     */
    public function getCantidad()
    {
        return $this->cantidad;
    }

    /**
     * Add examenAuto.
     *
     * @param \UtExam\ProEvalBundle\Entity\ExamenAuto $examenAuto
     *
     * @return PreguntasAuto
     */
    public function addExamenAuto(\UtExam\ProEvalBundle\Entity\ExamenAuto $examenAuto)
    {
        $this->examenAuto[] = $examenAuto;

        return $this;
    }

    /**
     * Remove examenAuto.
     *
     * @param \UtExam\ProEvalBundle\Entity\ExamenAuto $examenAuto
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeExamenAuto(\UtExam\ProEvalBundle\Entity\ExamenAuto $examenAuto)
    {
        return $this->examenAuto->removeElement($examenAuto);
    }

    /**
     * Get examenAuto.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getExamenAuto()
    {
        return $this->examenAuto;
    }

    /**
     * Set materias.
     *
     * @param \UtExam\ProEvalBundle\Entity\Materias|null $materias
     *
     * @return PreguntasAuto
     */
    public function setMaterias(\UtExam\ProEvalBundle\Entity\Materias $materias = null)
    {
        $this->materias = $materias;

        return $this;
    }

    /**
     * Get materias.
     *
     * @return \UtExam\ProEvalBundle\Entity\Materias|null
     */
    public function getMaterias()
    {
        return $this->materias;
    }

    /**
     * Set tipoPregunta.
     *
     * @param \UtExam\ProEvalBundle\Entity\TipoPregunta|null $tipoPregunta
     *
     * @return PreguntasAuto
     */
    public function setTipoPregunta(\UtExam\ProEvalBundle\Entity\TipoPregunta $tipoPregunta = null)
    {
        $this->tipoPregunta = $tipoPregunta;

        return $this;
    }

    /**
     * Get tipoPregunta.
     *
     * @return \UtExam\ProEvalBundle\Entity\TipoPregunta|null
     */
    public function getTipoPregunta()
    {
        return $this->tipoPregunta;
    }

    /**
     * Add preguntum.
     *
     * @param \UtExam\ProEvalBundle\Entity\Pregunta $preguntum
     *
     * @return PreguntasAuto
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

    /**
     * Set nivel.
     *
     * @param string $nivel
     *
     * @return PreguntasAuto
     */
    public function setNivel($nivel)
    {
        $this->nivel = $nivel;

        return $this;
    }

    /**
     * Get nivel.
     *
     * @return string
     */
    public function getNivel()
    {
        return $this->nivel;
    }
    public function __toString(){
      return $this->nivel == null ? '' : $this->cantidad;
    }
}
