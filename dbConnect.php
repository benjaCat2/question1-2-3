<?php

//using mysqli
//creating connection to the database

class dbConnect{
	private $conn;
	
	public function __construct($HOSTNAME, $DBUSER, $PASSWORD, $DBNAME){
		$this->host = $HOSTNAME;
		$this->user = $DBUSER;
		$this->password = $PASSWORD;
		$this->dbName = $DBNAME;
		$this->conn($HOSTNAME, $DBUSER, $PASSWORD, $DBNAME);
	}
	
	//function to create a connection
	public function connect ($HOSTNAME, $DBUSER, $PASSWORD, $DBNAME){
		$this->conn = new mysqli($HOSTNAME, $DBUSER, $PASSWORD, $DBNAME);
		
		//checking for errors
		if($this->conn->connect_error){
			return "Connection failed: ".$this->conn->connect_error;
		}
	}
	
	//function to insert records
	public function insert($table, $data){
		ksort($data);
		$fieldDetails = null;
		$fieldNames = implode ('`, `', array_keys($data));
		$fieldValues = "" . implode("`, `", array_values($data));
		
		$query = "INSERT INTO $table (`$fieldNames`) VALUES (`$fieldValues`)";
		
		if($this->conn->query($query) === TRUE){
			return true;
		}
		else{
			return false; 
		}
	}
	
	//function to select records
	public function select($sql){
		$result = $this->conn->query($sql);
		$count = $result->num_rows;
		$res = $result->fetch_assoc();
		return $res;
	}
	
	//function to select records with a while loop
	public function select_while($sql){
		$result = $this->conn->query($sql);
		$count = $result->num_rows;
				
		for($res = array(); $row = $result->fetch_assoc(); $res[] = $row);
		return $res;
	}
	
	//function to update records
	public function update($table, $data, $where){
		$wer = '';
		if(is_array($where)){
			foreach ($where as $a => $b){
				$wer.= $a."='".$b."' AND ";
			}
			$wer = substr($wer, 0, -4);
			$where = $wer;
		}
		ksort($data);
		$fieldDetails = NULL;
		foreach ($data AS $key =>$values){
			$fieldDetails .="$key='$values',";
		}
		$fieldDetails = rtrim($fieldDetails,',');
		
		if($where == NULL OR $where ===''){
			$query ="UPDATE $table SET $fieldDetails";
		}
		else{
			$query = "UPDATE $table SET $fieldDetails WHERE $where";
		}
		
		if($this->conn->query($query)=== TRUE){
			return true;
		}
		else{
			return false;
		}
	}
	
	//function to delete records
	public function delete($table, $where){
		$wer = '';
		if(is_array($where)){
			foreach ($where as $a => $b){
				$wer.= $a."='".$b."' AND ";
			}
			$wer = substr($wer, 0, -4);
			$where = $wer;
		}
				
		if($where == NULL OR $where ===''){
			$query ="DELETE FROM $table";
		}
		else{
			$query = "DELETE FROM $table WHERE $where";
		}
		
		if($this->conn->query($query)=== TRUE){
			return true;
		}
		else{
			return false;
		}
	}
	
}

?>