<?php
namespace UtExam\ProEvalBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Route\RouteCollection;
use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\Style\Font;

class AdminCreateExamArchive extends AbstractAdmin
{
    protected $baseRoutePattern = 'word';
    protected $baseRouteName = 'document';

    protected function configureRoutes(RouteCollection $collection)
    {
        $collection->clearExcept(['list']);
    }
}
