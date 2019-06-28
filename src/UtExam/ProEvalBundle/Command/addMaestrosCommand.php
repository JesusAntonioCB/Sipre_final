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

class addMaestrosCommand extends ContainerAwareCommand
{

    protected function configure()
    {
      $this
        // the name of the command (the part after "bin/console")
        ->setName('add-maestros')

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
      $jsondata = file_get_contents(__DIR__.'../../json/listMaestros.json');
      $data = json_decode($jsondata, true);

      foreach ($data as $id=> $turno) {
        $output->writeln([
          $turno["turno"],
          '------------------',
        ]);
        foreach ($turno["materias"] as $key => $materia) {
          $valueMaateria= $this->getContainer()->get('doctrine')
                         ->getRepository('UtExam\ProEvalBundle\Entity\Materias')
                         ->find((int)$materia['id']);
          $output->writeln($materia["materia"]);
          $output->writeln("...................");
          foreach ($materia["list"] as $key => $profesores) {
            $output->writeln($profesores["name"]);
            $maestro= new Maestros();
            $maestro->setTurno($turno["turno"]);
            $maestro->setMaterias($valueMaateria);
            $maestro->setNombre($profesores['name']);
            $em ->persist($maestro);
          }$em->flush();
          $output->writeln("--------------------");
        }
      }
      $output->writeln("Listo se guardaron los Maestros");
  }
}
?>
