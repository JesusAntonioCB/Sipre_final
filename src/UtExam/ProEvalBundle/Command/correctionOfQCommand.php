<?php
namespace UtExam\ProEvalBundle\Command;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Input\InputArgument;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Bundle\DoctrineBundle\Registry;
use UtExam\ProEvalBundle\Entity\Maestros;
use UtExam\ProEvalBundle\Entity\Materias;

class correctionOfQCommand extends ContainerAwareCommand
{

    protected function configure()
    {
      $this
        // the name of the command (the part after "bin/console")
        ->setName('corr-Question')

        // the short description shown while running "php bin/console list"
        ->setDescription('Agrega los Maestros Encargados de las materias.')

        // the full command description shown when running the command with
        // the "--help" option
        ->setHelp('Solo sirve para agregar la informacion base...')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
      $em = $this->getContainer()->get('doctrine')->getManager();
      $query = $em->createQuery('
        SELECT p
        FROM UtExam\ProEvalBundle\Entity\Pregunta p
        WHERE p.tipoPregunta IS NULL');
      $QuestionRes=$query->getArrayResult();
      foreach ($QuestionRes as $key => $value) {
        $output->writeln($key.".-".$value["escrito"]);
        $output->writeln("---------------------------------------");
      }
      $updateCali = $em->createQuery('
        UPDATE UtExam\ProEvalBundle\Entity\Pregunta p
        SET p.tipoPregunta = 5
        WHERE p.tipoPregunta IS NULL');
      $updateCali->execute();
      $output->writeln("Listo se hicieron las correcciones");
  }
}
?>
