<?php

namespace UtExam\ProEvalBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CalificacionesDeMaterias
 *
 * @ORM\Table(name="calificaciones_de_materias")
 * @ORM\Entity(repositoryClass="UtExam\ProEvalBundle\Repository\CalificacionesDeMateriasRepository")
 */
class CalificacionesDeMaterias
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
     *
     * @ORM\ManyToOne(targetEntity="Calificaciones", inversedBy="caliMateria")
     * @ORM\JoinColumn(name="calificaciones_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $calificaciones;

    /**
     *
     * @ORM\ManyToOne(targetEntity="Materias", inversedBy="calificaciones")
     * @ORM\JoinColumn(name="materia_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $materias;


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
     * @return CalificacionesDeMaterias
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
     * Set materias.
     *
     * @param \UtExam\ProEvalBundle\Entity\Materias|null $materias
     *
     * @return CalificacionesDeMaterias
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
     * Set calificaciones.
     *
     * @param \UtExam\ProEvalBundle\Entity\Calificaciones|null $calificaciones
     *
     * @return CalificacionesDeMaterias
     */
    public function setCalificaciones(\UtExam\ProEvalBundle\Entity\Calificaciones $calificaciones = null)
    {
        $this->calificaciones = $calificaciones;

        return $this;
    }

    /**
     * Get calificaciones.
     *
     * @return \UtExam\ProEvalBundle\Entity\Calificaciones|null
     */
    public function getCalificaciones()
    {
        return $this->calificaciones;
    }
}
