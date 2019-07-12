<?php

namespace UtExam\ProEvalBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use JMS\Serializer\Annotation\MaxDepth;

/**
 * Examen
 *
 * @ORM\Table(name="examen")
 * @ORM\Entity(repositoryClass="UtExam\ProEvalBundle\Repository\ExamenRepository")
 */
class Examen
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
     * @ORM\Column(name="titulo", type="string", length=255)
     */
    private $titulo;

    /**
     * @var string
     *
     * @ORM\Column(name="instrucciones", type="string", length=255)
     */
    private $instrucciones;

    /**
     * @var string
     *
     * @ORM\Column(name="codigoExam", type="string", length=255)
     */
    private $codigoExam;

    /**
     * @var string
     *
     * @ORM\Column(name="fecha", type="string", length=255)
     */
    private $fecha;

    /**
     * @var string
     *
     * @ORM\Column(name="tipo", type="string", length=255)
     */
    private $tipo;

    /**
     * @var string
     *
     * @ORM\Column(name="nivel", type="string", length=255)
     */
    private $nivel;

    /**
     * @var string
     *
     * @ORM\Column(name="tiempo", type="float")
     */
    private $tiempo;

    /**
     * @ORM\OneToMany(targetEntity="preguntasinExamen", mappedBy="examen", cascade={"persist"})
     */
    private $pregunta;

    /**
     * @ORM\OneToMany(targetEntity="Alumnos", mappedBy="examen", cascade={"persist"})
     */
    private $alumnos;

    /**
     * @ORM\ManyToOne(targetEntity="\Application\Sonata\UserBundle\Entity\User")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $user;

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
     * Set titulo.
     *
     * @param string $titulo
     *
     * @return Examen
     */
    public function setTitulo($titulo)
    {
        $this->titulo = $titulo;

        return $this;
    }

    /**
     * Get titulo.
     *
     * @return string
     */
    public function getTitulo()
    {
        return $this->titulo;
    }

    /**
     * Set instrucciones.
     *
     * @param string $instrucciones
     *
     * @return Examen
     */
    public function setInstrucciones($instrucciones)
    {
        $this->instrucciones = $instrucciones;

        return $this;
    }

    /**
     * Get instrucciones.
     *
     * @return string
     */
    public function getInstrucciones()
    {
        return $this->instrucciones;
    }

    /**
     * Set fecha.
     *
     * @param string $fecha
     *
     * @return Examen
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
     * Set tipo.
     *
     * @param string $tipo
     *
     * @return Examen
     */
    public function setTipo($tipo)
    {
        $this->tipo = $tipo;

        return $this;
    }

    /**
     * Get tipo.
     *
     * @return string
     */
    public function getTipo()
    {
        return $this->tipo;
    }

    /**
     * Set nivel.
     *
     * @param string $nivel
     *
     * @return Examen
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
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->pregunta= new ArrayCollection();
    }

    /**
     * Set user.
     *
     * @param \Application\Sonata\UserBundle\Entity\User|null $user
     *
     * @return Examen
     */
    public function setUser(\Application\Sonata\UserBundle\Entity\User $user = null)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user.
     *
     * @return \Application\Sonata\UserBundle\Entity\User|null
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * Add preguntum.
     *
     * @param \UtExam\ProEvalBundle\Entity\preguntasinExamen $preguntum
     *
     * @return Examen
     */
    public function addPreguntum(\UtExam\ProEvalBundle\Entity\preguntasinExamen $preguntum)
    {
        $this->pregunta[] = $preguntum;

        return $this;
    }

    /**
     * Remove preguntum.
     *
     * @param \UtExam\ProEvalBundle\Entity\preguntasinExamen $preguntum
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removePreguntum(\UtExam\ProEvalBundle\Entity\preguntasinExamen $preguntum)
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
     * Set codigoExam.
     *
     * @param string $codigoExam
     *
     * @return Examen
     */
    public function setCodigoExam($codigoExam)
    {
        $this->codigoExam = $codigoExam;

        return $this;
    }

    /**
     * Get codigoExam.
     *
     * @return string
     */
    public function getCodigoExam()
    {
        return $this->codigoExam;
    }
    public function __toString(){
      return $this->titulo == null ? '' : $this->titulo;
    }

    /**
     * Add alumno.
     *
     * @param \UtExam\ProEvalBundle\Entity\AlumnosEnExamen $alumno
     *
     * @return Examen
     */
    public function addAlumno(\UtExam\ProEvalBundle\Entity\AlumnosEnExamen $alumno)
    {
        $this->alumnos[] = $alumno;

        return $this;
    }

    /**
     * Remove alumno.
     *
     * @param \UtExam\ProEvalBundle\Entity\AlumnosEnExamen $alumno
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeAlumno(\UtExam\ProEvalBundle\Entity\AlumnosEnExamen $alumno)
    {
        return $this->alumnos->removeElement($alumno);
    }

    /**
     * Get alumnos.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getAlumnos()
    {
        return $this->alumnos;
    }

    /**
     * Set tiempo.
     *
     * @param float $tiempo
     *
     * @return Examen
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
}
