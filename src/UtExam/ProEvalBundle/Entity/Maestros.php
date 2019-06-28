<?php

namespace UtExam\ProEvalBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Maestros
 *
 * @ORM\Table(name="maestros")
 * @ORM\Entity(repositoryClass="UtExam\ProEvalBundle\Repository\MaestrosRepository")
 */
class Maestros
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
     * @ORM\Column(name="turno", type="string", length=255)
     */
    private $turno;

    /**
     * @ORM\ManyToMany(targetEntity="Alumnos", mappedBy="maestros")
     */

    private $alumnos;

    /**
     * @ORM\ManyToOne(targetEntity="Materias", inversedBy="maestros")
     * @ORM\JoinColumn(name="materias_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
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
     * Set nombre.
     *
     * @param string $nombre
     *
     * @return Maestros
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
     * Constructor
     */
    public function __construct()
    {
        $this->alumnos = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add maestro.
     *
     * @param \UtExam\ProEvalBundle\Entity\Alumnos $alumnos
     *
     * @return Maestros
     */
    public function addMaestro(\UtExam\ProEvalBundle\Entity\Alumnos $alumnos)
    {
        $this->alumnos[] = $alumnos;

        return $this;
    }

    /**
     * Remove maestro.
     *
     * @param \UtExam\ProEvalBundle\Entity\Alumnos $alumnos
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeMaestro(\UtExam\ProEvalBundle\Entity\Alumnos $alumnos)
    {
        return $this->alumnos->removeElement($alumnos);
    }

    /**
     * Get alumnos.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getMaestros()
    {
        return $this->alumnos;
    }

    public function __toString(){
      return $this->nombre == null ? '' : $this->nombre;
    }

    /**
     * Set turno.
     *
     * @param string $turno
     *
     * @return Maestros
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
     * Add alumno.
     *
     * @param \UtExam\ProEvalBundle\Entity\Alumnos $alumno
     *
     * @return Maestros
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
     * Set materias.
     *
     * @param \UtExam\ProEvalBundle\Entity\Materias|null $materias
     *
     * @return Maestros
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
}
