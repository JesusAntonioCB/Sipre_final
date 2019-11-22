<?php

namespace UtExam\ProEvalBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Alumnos
 *
 * @ORM\Table(name="alumnos",uniqueConstraints={@ORM\UniqueConstraint(name="username_uniq", columns={"username"})})
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
     * @ORM\Column(name="username", type="string", length=255 )
     */
    private $username;

    /**
     * @var string
     *
     * @ORM\Column(name="grupo", type="string", length=255)
     */
    private $grupo;

    /**
     * @var boolean
     *
     * @ORM\Column(name="examEntrada", type="boolean")
     */
    private $examEntrada;

    /**
     * @var boolean
     *
     * @ORM\Column(name="examSalida", type="boolean")
     */
    private $examSalida;

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
     * @ORM\Column(name="fechaActualizacion", type="string", length=255, nullable=true)
     */
    private $fechaActualizacion;

    /**
     * @var string
     *
     * @ORM\Column(name="tiempo", type="string", length=255)
     */
    private $tiempo;

    /**
     * @var string
     *
     * @ORM\Column(name="codigoUsuario", type="string", length=255)
     */
    private $codigoUsuario;

    /**
     * @var string
     *
     * @ORM\Column(name="contrasena", type="string", length=255)
     */
    private $contrasena;

    /**
     *
     * @ORM\ManyToOne(targetEntity="Examen", inversedBy="alumnos")
     * @ORM\JoinColumn(name="examen_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $examen;

    /**
     * @ORM\OneToMany(targetEntity="Calificaciones", mappedBy="alumnos",cascade={"persist"})
     */
    private $calificaciones;

    /**
     *
     * @ORM\ManyToOne(targetEntity="ExamenAuto", inversedBy="alumnos")
     * @ORM\JoinColumn(name="examenAuto_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $examenAuto;

     /**
      * @ORM\ManyToMany(targetEntity="Maestros", inversedBy="alumnos",cascade={"persist"})
      * @ORM\JoinTable(name="alumnos_maestros",
      *     joinColumns={
      *     @ORM\JoinColumn(name="alumnos_id", referencedColumnName="id")
      *   },
      *   inverseJoinColumns={
      *     @ORM\JoinColumn(name="maestros_id", referencedColumnName="id")
      *   }
      * )
      */
    private $maestros;

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

    /**
     * Set grupo.
     *
     * @param string $grupo
     *
     * @return Alumnos
     */
    public function setGrupo($grupo)
    {
        $this->grupo = $grupo;

        return $this;
    }

    /**
     * Get grupo.
     *
     * @return string
     */
    public function getGrupo()
    {
        return $this->grupo;
    }

    /**
     * Set contrasena.
     *
     * @param string $contrasena
     *
     * @return Alumnos
     */
    public function setContrasena($contrasena)
    {
        $this->contrasena = $contrasena;

        return $this;
    }

    /**
     * Get contrasena.
     *
     * @return string
     */
    public function getContrasena()
    {
        return $this->contrasena;
    }

    /**
     * Set username.
     *
     * @param string $username
     *
     * @return Alumnos
     */
    public function setUsername($username)
    {
        $this->username = $username;

        return $this;
    }

    /**
     * Get username.
     *
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->maestros = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add maestro.
     *
     * @param \UtExam\ProEvalBundle\Entity\Maestros $maestro
     *
     * @return Alumnos
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

    /**
     * Set fechaActualizacion.
     *
     * @param string $fechaActualizacion
     *
     * @return Alumnos
     */
    public function setFechaActualizacion($fechaActualizacion)
    {
        $this->fechaActualizacion = $fechaActualizacion;

        return $this;
    }

    /**
     * Get fechaActualizacion.
     *
     * @return string
     */
    public function getFechaActualizacion()
    {
        return $this->fechaActualizacion;
    }

    /**
     * Add calificacione.
     *
     * @param \UtExam\ProEvalBundle\Entity\Calificaciones $calificacione
     *
     * @return Alumnos
     */
    public function addCalificacione(\UtExam\ProEvalBundle\Entity\Calificaciones $calificacione)
    {
        $this->calificaciones[] = $calificacione;

        return $this;
    }

    /**
     * Remove calificacione.
     *
     * @param \UtExam\ProEvalBundle\Entity\Calificaciones $calificacione
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeCalificacione(\UtExam\ProEvalBundle\Entity\Calificaciones $calificacione)
    {
        return $this->calificaciones->removeElement($calificacione);
    }

    /**
     * Get calificaciones.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getCalificaciones()
    {
        return $this->calificaciones;
    }

    /**
     * Set examEntrada.
     *
     * @param bool $examEntrada
     *
     * @return Alumnos
     */
    public function setExamEntrada($examEntrada)
    {
        $this->examEntrada = $examEntrada;

        return $this;
    }

    /**
     * Get examEntrada.
     *
     * @return bool
     */
    public function getExamEntrada()
    {
        return $this->examEntrada;
    }

    /**
     * Set examSalida.
     *
     * @param bool $examSalida
     *
     * @return Alumnos
     */
    public function setExamSalida($examSalida)
    {
        $this->examSalida = $examSalida;

        return $this;
    }

    /**
     * Get examSalida.
     *
     * @return bool
     */
    public function getExamSalida()
    {
        return $this->examSalida;
    }
}
