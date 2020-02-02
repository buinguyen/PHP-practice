<?php
	class Connection {
		private $con;
		public function __construct() {
			$con = mysql_connect('localhost', 'root', '') or die("Khong the ket noi den database");
			mysql_select_db('qldaotao', $con);
			mysql_query("SET character_set_results = 'utf8', 
			character_set_client = 'utf8', 
			character_set_connection = 'utf8', 
			character_set_database = 'utf8', 
			character_set_server = 'utf8'", $con);
		}
		public function __destruct() {
			mysql_close();
		}
	}
?>