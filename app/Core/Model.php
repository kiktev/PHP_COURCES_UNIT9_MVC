<?php
namespace Core;

/**
 * Class Model
 */
class Model implements DbModelInterface
{
    /**
     * @var
     */
    protected $table_name;
    /**
     * @var
     */
    protected $id_column;
    /**
     * @var array
     */
    protected $columns = [];
    /**
     * @var
     */
    protected $collection;
    /**
     * @var
     */
    protected $sql;
    /**
     * @var array
     */
    protected $params = [];

    /**
     * @return $this
     */
    public function initCollection()
    {
        $columns = implode(',',$this->getColumns());
        $this->sql = "select $columns from " . $this->table_name ;
        return $this;
    }

    /**
     * @return array
     */
    public function getColumns()
    {
        $db = new DB();
        $sql = "show columns from  $this->table_name;";
        $results = $db->query($sql);
        foreach($results as $result) {
            array_push($this->columns,$result['Field']);
        }
        return $this->columns;
    }


    /**
     * @param $params
     * @return $this
     */
    public function sort($params)
    {
		
		$sortBy = '';
		$sortType = '';
		
		foreach($params as $key=>$value){
			
			$sortBy = $key;
			$sortType = $value;
			
		}
		
		$this->sql = "SELECT * FROM $this->table_name ORDER BY $sortBy $sortType;";
		
        return $this;
    }

    /**
     * @param $params
     */
    public function filter($params)
    {
       /*
              TODO
              return $this;
        */
        
    }

    /**
     * @return $this
     */
    public function getCollection()
    {
        $db = new DB();
        $this->sql .= ";";
        $this->collection = $db->query($this->sql, $this->params);
        return $this;
    }

    /**
     * @return mixed
     */
    public function select()
    {
        return $this->collection;
    }

    /**
     * @return null
     */
    public function selectFirst()
    {
        return isset($this->collection[0]) ? $this->collection[0] : null;
    }

    /**
     * @param $id
     * @return mixed
     */
    public function getItem($id)
    {
        $sql = "select * from $this->table_name where $this->id_column = ?;";
        $db = new DB();
        $params = array($id);
        return $db->query($sql, $params)[0];
    }
	
	public function addItem($values){
		
		
		$colums = null;
		$value = null; 
		foreach($values as $key=>$val){
			$colums .= "`$key`,";
			$value .= "'".$val."',";
		}
		$colums = rtrim($colums,',');
		$value = rtrim($value,',');
		
		$sql = "INSERT INTO `$this->table_name` ($colums) VALUES ($value)";
		$db = new DB();
		return $db->query($sql);
		
	}
	
	public function saveItem($id,$values){
		
		$item = '';
		
		foreach($values as $key=>$val){
			
			$item .= "$key = '$val',";
		}
		$item = rtrim($item,",");
		
		$sql = "UPDATE `$this->table_name` SET $item WHERE `id` = '$id';";
		$db = new DB();
		return $db->query($sql);
	}
	
	public function deleteItem($id){
		$sql = "DELETE FROM $this->table_name WHERE id = '$id'";
		$db = new DB();
		return $db->query($sql);
	}

    /**
     * @return array
     */
    public function getPostValues()
    {
        $values = [];
        $columns = $this->getColumns();
		
        foreach ($columns as $column) {
            
            if ( isset($_POST[$column]) && $column !== $this->id_column ) {
                $values[$column] = $_POST[$column];
            }
            
            $column_value = filter_input(INPUT_POST, $column);
            if ($column_value && $column !== $this->id_column ) {
                $values[$column] = $column_value;
            }

        }
		
        return $values;
		
    }

    public function getTableName(): string
    {
        return $this->table_name;
    }

    public function getPrimaryKeyName(): string
    {
        return $this->id_column;
    }

    public function getId()
    {
        return 1;
    }
}
