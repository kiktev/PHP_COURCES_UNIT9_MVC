<?php
namespace Controllers;

use Core\Controller;
use Core\View;

/**
 * Class ProductController
 */
class CustomerController extends Controller
{
    public function indexAction()
    {
        $this->forward('customer/list');
    }

    /**
     *
     */
    public function listAction()
    {
        $this->set('title', "Клієнти");
		
	
		
		$customers = $this->getModel('Customer')
            ->initCollection()
            //->sort($this->getSortParams())
            ->getCollection()
            ->select();
		
        $this->set('customers', $customers);

        $this->renderLayout();
    }

    /**
     *
     */
   
    
}