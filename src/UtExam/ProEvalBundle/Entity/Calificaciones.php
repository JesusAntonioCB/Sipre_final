<?php

namespace UtExam\ProEvalBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Calificaciones
 *
 * @ORM\Table(name="calificaciones")
 * @ORM\Entity(repositoryClass="UtExam\ProEvalBundle\Repository\CalificacionesRepository")
 */
class Calificaciones
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
     * @var float
     *
     * @ORM\Column(name="calificacion", type="float")
     */
    private $calificacion;

    /**
     * @var string
     *
     * @ORM\Column(name="evaluacion", type="string", length=255)
     */
    private $evaluacion;

    /**
     * @var string
     *
     * @ORM\Column(name="tiempo", type="string", length=255)
     */
    private $tiempo;

    /**
     * @ORM\OneToMany(targetEntity="CalificacionesDeMaterias", mappedBy="calificaciones",cascade={"persist"})
     */
    private $caliMateria;

    /**
     *
     * @ORM\ManyToOne(targetEntity="Examen", inversedBy="calificaciones")
     * @ORM\JoinColumn(name="examen_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $examen;

    /**
     *
     * @ORM\ManyToOne(targetEntity="ExamenAuto", inversedBy="calificaciones")
     * @ORM\JoinColumn(name="examenAuto_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $examenAuto;

    /**
     *
     * @ORM\ManyToOne(targetEntity="Alumnos", inversedBy="calificaciones")
     * @ORM\JoinColumn(name="alumnos_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $alumnos;


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
     * Set calificacion.
     *
     * @param float $calificacion
     *
     * @return Calificaciones
     */
    public function setCalificacion($calificacion)
    {
        $this->calificacion = $calificacion;

        return $this;
    }

    /**
     * Get calificacion.
     *
     * @return float
     */
    public function getCalificacion()
    {
        return $this->calificacion;
    }

    /**
     * Set alumnos.
     *
     * @param \UtExam\ProEvalBundle\Entity\Alumnos|null $alumnos
     *
     * @return Calificaciones
     */
    public function setAlumnos(\UtExam\ProEvalBundle\Entity\Alumnos $alumnos = null)
    {
        $this->alumnos = $alumnos;

        return $this;
    }

    /**
     * Get alumnos.
     *
     * @return \UtExam\ProEvalBundle\Entity\Alumnos|null
     */
    public function getAlumnos()
    {
        return $this->alumnos;
    }

    /**
     * Set evaluacion.
     *
     * @param string $evaluacion
     *
     * @return Calificaciones
     */
    public function setEvaluacion($evaluacion)
    {
        $this->evaluacion = $evaluacion;

        return $this;
    }

    /**
     * Get evaluacion.
     *
     * @return string
     */
    public function getEvaluacion()
    {
        return $this->evaluacion;
    }

    /**
     * Set examen.
     *
     * @param \UtExam\ProEvalBundle\Entity\Examen|null $examen
     *
     * @return Calificaciones
     */
    public function setExamen(\UtExam\ProEvalBundle\Entity\Examen $examen = null)
    {
        $this->examen = $examen;

        return $this;
    }

    /**
     * Get examen.
     *
     * @return \UtExam\ProEvalBundle\Entity\Examen|null
     */
    public function getExamen()
    {
        return $this->examen;
    }

    /**
     * Set examenAuto.
     *
     * @param \UtExam\ProEvalBundle\Entity\ExamenAuto|null $examenAuto
     *
     * @return Calificaciones
     */
    public function setExamenAuto(\UtExam\ProEvalBundle\Entity\ExamenAuto $examenAuto = null)
    {
        $this->examenAuto = $examenAuto;

        return $this;
    }

    /**
     * Get examenAuto.
     *
     * @return \UtExam\ProEvalBundle\Entity\ExamenAuto|null
     */
    public function getExamenAuto()
    {
        return $this->examenAuto;
    }

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->caliMateria = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add caliMaterium.
     *
     * @param \UtExam\ProEvalBundle\Entity\CalificacionesDeMaterias $caliMaterium
     *
     * @return Calificaciones
     */
    public function addCaliMaterium(\UtExam\ProEvalBundle\Entity\CalificacionesDeMaterias $caliMaterium)
    {
        $this->caliMateria[] = $caliMaterium;

        return $this;
    }

    /**
     * Remove caliMaterium.
     *
     * @param \UtExam\ProEvalBundle\Entity\CalificacionesDeMaterias $caliMaterium
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeCaliMaterium(\UtExam\ProEvalBundle\Entity\CalificacionesDeMaterias $caliMaterium)
    {
        return $this->caliMateria->removeElement($caliMaterium);
    }

    /**
     * Get caliMateria.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getCaliMateria()
    {
        return $this->caliMateria;
    }

    /**
     * Set tiempo.
     *
     * @param string $tiempo
     *
     * @return Calificaciones
     */
    public function setTiempo($tiempo)
    {
        $this->tiempo = $tiempo;

        return $this;
    }

    /**
     * Get tiempo.
     *
     * @return string
     */
    public function getTiempo()
    {
        return $this->tiempo;
    }
}
