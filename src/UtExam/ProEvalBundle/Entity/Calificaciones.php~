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
     *
     * @ORM\ManyToOne(targetEntity="Materias", inversedBy="calificaciones")
     * @ORM\JoinColumn(name="materia_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $materias;

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
     * Set materias.
     *
     * @param \UtExam\ProEvalBundle\Entity\Materias|null $materias
     *
     * @return Calificaciones
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
}
