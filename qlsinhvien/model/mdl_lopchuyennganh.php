<?php
	require_once("mdl_connection.php");
	
	class Lopchuyennganh extends Connection {
		private $malop;
		private $khoa;
		private $macn;
		private $tenlop;
		
		public function __construct() {
			parent::__construct();
		}
		public function __destruct() {
			parent::__destruct();
		}
		
		// lay danh sach tat ca Lop
		public function getListClass() {
			$query = "select * from dbo_lopchuyennganh order by MaCN";
			$rs = mysql_query($query) or die ("Khong the thuc hien truy van tren bang Lop chuyen nganh");
			if (mysql_num_rows($rs) == 0) { 
				return "401";
			} else {
				$row = array();
				while($r = mysql_fetch_assoc($rs)) {
					$row[] = $r;
				}
				return json_encode($row);
			}
		}
		 
	}

?>