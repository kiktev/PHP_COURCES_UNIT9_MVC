<?php
namespace Controllers;

use Core\Controller;
use Core\View;

/**
 * Class ProductController
 */
class ProductController extends Controller
{
    public function indexAction()
    {
        $this->forward('product/list');
    }

    /**
     *
     */
    public function listAction()
    {
        $this->set('title', "Товари");

        $products = $this->getModel('Product')
            ->initCollection()
            ->sort($this->getSortParams())
            ->getCollection()
            ->select();
        $this->set('products', $products);

        $this->renderLayout();
    }
	

    /**
     *
     */
    public function viewAction()
    {
        $this->set('title', "Карточка товара");

        $product = $this->getModel('Product')
            ->initCollection()
            ->filter(['id',$this->getId()])
            ->getCollection()
            ->selectFirst();
        $this->set('products', $product);

        $this->renderLayout();
    }

    /**
     *
     */
    public function editAction()
    {
        $model = $this->getModel('Product');
        $this->set('saved', 'не внесено');
        $this->set("title", "Редагування товару");
        
        $this->set('product', $model->getItem($this->getId()));
		
		$id = $this->get('product')['id'];
		
	
		if(isset($_POST['form_action'])){
			
			$form_action = $_POST['form_action'];
			
			switch($form_action){
				
				case 'del':
				if ($id) {
					
					$model->deleteItem($id);
					header('Location: /product/list');
					
				}
				break;
				
				case 'edit':
				
				if ($id) {
					
					$values = $model->getPostValues();
					$model->saveItem($id,$values);
					$this->set('saved', 'внесено');
					
				}
				
				break;
			}
		}	
		
        $this->renderLayout();
    }

    /**
     *
     */
    public function addAction()
    {

        $model = $this->getModel('Product');
		
        $this->set("title","Додавання товару");
		
        if ($values = $model->getPostValues()) {
            $model->addItem($values);
        }
		
        $this->renderLayout();
    }

    /**
     * @return array
     */
    public function getSortParams()
    {
        $params = [];
			
			$sort= filter_input(INPUT_POST, 'sort');
			
			switch ($sort) {
				
				case 'price_DESC':
				$params['price'] = 'DESC';
				break;
				
				case 'price_ASC':
				$params['price'] = 'ASC';
				break;
				
				case 'qty_DESC':
				$params['qty'] = 'DESC';
				break;
				
				case 'qty_ASC':
				$params['qty'] = 'ASC';
				break;
				
				default:
				$params['price'] = 'ASC';
			}
       
        return $params;

    }

    /**
     * @return array
     */
    public function getSortParams_old()
    {
        /*
        if (isset($_GET['sort'])) {
            $sort = $_GET['sort'];
        } else 
        { 
            $sort = "name";
        }
         * 
         */
        $sort = filter_input(INPUT_GET, 'sort');
        if (!isset($sort)) {
            $sort = "name";
        }
        /*
        if (isset($_GET['order']) && $_GET['order'] == 1) {
            $order = "ASC";
        } else {
            $order = "DESC";
        }
         * 
         */
        if (filter_input(INPUT_GET, 'order') == 1) {
            $order = "DESC";
        } else {
            $order = "ASC";
        }
        
        return array($sort, $order);
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        /*
        if (isset($_GET['id'])) {
         
            return $_GET['id'];
        } else {
            return NULL;
        }
        */
        return filter_input(INPUT_GET, 'id');
    }
    
    
}