<?php

namespace UtExam\ProEvalBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * AlumnosEnExamen
 *
 * @ORM\Table(name="alumnos_en_examen")
 * @ORM\Entity(repositoryClass="UtExam\ProEvalBundle\Repository\AlumnosEnExamenRepository")
 */
class AlumnosEnExamen
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
     *
     * @ORM\ManyToOne(targetEntity="Examen", inversedBy="alumnos")
     * @ORM\JoinColumn(name="examen_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $examen;

    /**
     *
     * @ORM\ManyToOne(targetEntity="Alumnos", inversedBy="examen")
     * @ORM\JoinColumn(name="alumno_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
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
     * Set examen.
     *
     * @param \UtExam\ProEvalBundle\Entity\Examen|null $examen
     *
     * @return AlumnosEnExamen
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
     * Set alumnos.
     *
     * @param \UtExam\ProEvalBundle\Entity\Alumnos|null $alumnos
     *
     * @return AlumnosEnExamen
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

    // public function __toString(){
    //   return $this->alumnos->getNombre() == null ? '' : $this->alumnos->getNombre();
    // }
    public function __toString(){
      return $this->examen->getTitulo() == null ? '' : $this->examen->getTitulo();
    }
}
