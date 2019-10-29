<?php

namespace UtExam\ProEvalBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * preguntasinExamen
 *
 * @ORM\Table(name="preguntasin_examen")
 * @ORM\Entity(repositoryClass="UtExam\ProEvalBundle\Repository\preguntasinExamenRepository")
 */
class preguntasinExamen
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
     * @ORM\ManyToOne(targetEntity="Examen", inversedBy="pregunta")
     * @ORM\JoinColumn(name="examen_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $examen;

    /**
     *
     * @ORM\ManyToOne(targetEntity="Pregunta", inversedBy="examen")
     * @ORM\JoinColumn(name="pregunta_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    private $pregunta;

    public function getPregunta()
  {
    return $this->pregunta;
  }

  public function getExamen()
  {
    return $this->examen;
  }

  public function setPregunta($pregunta)
  {
    $this->pregunta = $pregunta;
    return $this;
  }

  public function setExamen($examen)
  {
    $this->examen = $examen;
    return $this;
  }

    /**
     * Get id.
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }
}
