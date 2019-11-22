<?php
namespace UtExam\ProEvalBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Route\RouteCollection;

class AdminCreateReporte extends AbstractAdmin
{
    protected $baseRoutePattern = 'reporte';
    protected $baseRouteName = 'grupos';

    protected function configureRoutes(RouteCollection $collection)
    {
        $collection->clearExcept(['list']);
    }
}
