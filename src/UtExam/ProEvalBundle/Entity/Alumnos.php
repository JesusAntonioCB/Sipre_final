<?php

namespace UtExam\ProEvalBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Alumnos
 *
 * @ORM\Table(name="alumnos")
 * @ORM\Entity(repositoryClass="UtExam\ProEvalBundle\Repository\AlumnosRepository")
 */
class Alumnos
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
     * @ORM\Column(name="carrera", type="string", length=255)
     */
    private $carrera;

    /**
     * @var string
     *
     * @ORM\Column(name="turno", type="string", length=255)
     */
    private $turno;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fecha", type="string", length=255)
     */
    private $fecha;

    /**
     * @var string
     *
     * @ORM\Column(name="tiempo", type="string", length=255)
     */
    private $tiempo;

    /**
     * @var float
     *
     * @ORM\Column(name="calificacion", type="float")
     */
    private $calificacion;

    /**
     * @var string
     *
     * @ORM\Column(name="codigoUsuario", type="string", length=255)
     */
    private $codigoUsuario;

    /**
     *
     * @ORM\ManyToOne(targetEntity="Examen", inversedBy="alumnos")
     * @ORM\JoinColumn(name="examen_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $examen;

    /**
     *
     * @ORM\ManyToOne(targetEntity="ExamenAuto", inversedBy="alumnos")
     * @ORM\JoinColumn(name="examenAuto_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $examenAuto;

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
     * @return Alumnos
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
     * Set carrera.
     *
     * @param string $carrera
     *
     * @return Alumnos
     */
    public function setCarrera($carrera)
    {
        $this->carrera = $carrera;

        return $this;
    }

    /**
     * Get carrera.
     *
     * @return string
     */
    public function getCarrera()
    {
        return $this->carrera;
    }

    /**
     * Set turno.
     *
     * @param string $turno
     *
     * @return Alumnos
     */
    public function setTurno($turno)
    {
        $this->turno = $turno;

        return $this;
    }

    /**
     * Get turno.
     *
     * @return string
     */
    public function getTurno()
    {
        return $this->turno;
    }

    /**
     * Set tiempo.
     *
     * @param float $tiempo
     *
     * @return Alumnos
     */
    public function setTiempo($tiempo)
    {
        $this->tiempo = $tiempo;

        return $this;
    }

    /**
     * Get tiempo.
     *
     * @return float
     */
    public function getTiempo()
    {
        return $this->tiempo;
    }

    /**
     * Set calificacion.
     *
     * @param float $calificacion
     *
     * @return Alumnos
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
     * Set fecha.
     *
     * @param string $fecha
     *
     * @return Alumnos
     */
    public function setFecha($fecha)
    {
        $this->fecha = $fecha;

        return $this;
    }

    /**
     * Get fecha.
     *
     * @return string
     */
    public function getFecha()
    {
        return $this->fecha;
    }

    /**
     * Set codigoUsuario.
     *
     * @param string $codigoUsuario
     *
     * @return Alumnos
     */
    public function setCodigoUsuario($codigoUsuario)
    {
        $this->codigoUsuario = $codigoUsuario;

        return $this;
    }

    /**
     * Get codigoUsuario.
     *
     * @return string
     */
    public function getCodigoUsuario()
    {
        return $this->codigoUsuario;
    }

    public function __toString(){
      return $this->nombre == null ? '' : $this->nombre;
    }

    /**
     * Set examen.
     *
     * @param \UtExam\ProEvalBundle\Entity\Examen|null $examen
     *
     * @return Alumnos
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
     * @return Alumnos
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
}
