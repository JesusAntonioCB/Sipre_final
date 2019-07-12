<?php

namespace UtExam\ProEvalBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * ExamenAuto
 *
 * @ORM\Table(name="examen_auto")
 * @ORM\Entity(repositoryClass="UtExam\ProEvalBundle\Repository\ExamenAutoRepository")
 */
class ExamenAuto
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
     * @ORM\ManyToMany(targetEntity="PreguntasAuto", inversedBy="examenAuto",cascade={"persist"})
     * @ORM\JoinTable(name="ExamenAuto_PreguntasAuto",
     *     joinColumns={
     *     @ORM\JoinColumn(name="examenAuto_id", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="PreguntasAuto_id", referencedColumnName="id")
     *   }
     * )
     */
    private $preguntasAuto;

    /**
     * @ORM\ManyToOne(targetEntity="\Application\Sonata\UserBundle\Entity\User")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $user;

    /**
     * @ORM\OneToMany(targetEntity="Alumnos", mappedBy="examenAuto", cascade={"persist"})
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
     * Set titulo.
     *
     * @param string $titulo
     *
     * @return ExamenAuto
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
     * @return ExamenAuto
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
     * Set codigoExam.
     *
     * @param string $codigoExam
     *
     * @return ExamenAuto
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

    /**
     * Set fecha.
     *
     * @param string $fecha
     *
     * @return ExamenAuto
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
     * @return ExamenAuto
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
     * @return ExamenAuto
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
        $this->preguntasAuto = new \Doctrine\Common\Collections\ArrayCollection();
        $this->alumnos = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add preguntasAuto.
     *
     * @param \UtExam\ProEvalBundle\Entity\PreguntasAuto $preguntasAuto
     *
     * @return ExamenAuto
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
     * Set user.
     *
     * @param \Application\Sonata\UserBundle\Entity\User|null $user
     *
     * @return ExamenAuto
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

    public function __toString(){
      return $this->titulo == null ? '' : $this->titulo;
    }

    /**
     * Add alumno.
     *
     * @param \UtExam\ProEvalBundle\Entity\Alumnos $alumno
     *
     * @return ExamenAuto
     */
    public function addAlumno(\UtExam\ProEvalBundle\Entity\Alumnos $alumno)
    {
        $this->alumnos[] = $alumno;

        return $this;
    }

    /**
     * Remove alumno.
     *
     * @param \UtExam\ProEvalBundle\Entity\Alumnos $alumno
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeAlumno(\UtExam\ProEvalBundle\Entity\Alumnos $alumno)
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
     * @return ExamenAuto
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
