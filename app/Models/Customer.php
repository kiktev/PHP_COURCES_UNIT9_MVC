<?php
namespace Models;

use Core\Model;

/**
 * Class Product
 */
class Customer extends Model
{

    /**
     * Product constructor.
     */
    function __construct()
    {
        $this->table_name = "customer";
        $this->id_column = "id";
    }
   
}