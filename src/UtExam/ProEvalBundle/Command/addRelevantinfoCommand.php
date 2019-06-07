<?php
namespace UtExam\ProEvalBundle\Command;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Input\InputArgument;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Bundle\DoctrineBundle\Registry;
use  UtExam\ProEvalBundle\Entity\Materias;
use  UtExam\ProEvalBundle\Entity\TipoPregunta;

class addRelevantinfoCommand extends ContainerAwareCommand
{

    protected function configure()
    {
      $this
        // the name of the command (the part after "bin/console")
        ->setName('add-relevantinfo')

        // the short description shown while running "php bin/console list"
        ->setDescription('Agrega las materias, tipos de preguntas y demas automaticamente a la base de datos.')

        // the full command description shown when running the command with
        // the "--help" option
        ->setHelp('Solo sirve para agregar la informacion base...')

    ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
      $em = $this->getContainer()->get('doctrine')->getManager();
      $jsondata = file_get_contents(__DIR__.'../../json/Country.json');
      $data = json_decode($jsondata, true);
      foreach ($data as $id=> $value) {
        $materias = new Materias();
        $materias->setNombre($value['nombre']);
        $em ->persist($materias);
      }$em->flush();

      $jsondata = file_get_contents(__DIR__.'../../json/State.json');
      $data = json_decode($jsondata, true);
      foreach($data as $id=>$value){
        $tipoPregunta = new TipoPregunta();
        $tipoPregunta->setNombre($value['nombre']);
        $em ->persist($tipoPregunta);
      }$em->flush();

    $output->writeln([
      'Ya se van para S3',
      '.................',
      'Se están yendo',
      '..............',
      'Ya se fueron'
    ]);
  }
}
?>
