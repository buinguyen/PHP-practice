<?php
	require_once("mdl_connection.php");
	
	class Khoa extends Connection {
		private $makhoa;
		private $tenkhoa;
		private $ngaythanhlap;
		
		public function __construct() {
			parent::__construct();
		}
		public function __destruct() {
			parent::__destruct();
		}
		
		// lay danh sach tat ca cac khoa
		public function getListFaculty() {
			$query = "SELECT * FROM dbo_khoa ORDER BY MaKhoa";
			$rs = mysql_query($query) or die ("Khong the thuc hien truy van tren bang Khoa");
			if (mysql_num_rows($rs) != 0) {
				$row = array();
				while($r = mysql_fetch_assoc($rs)) {
					$row[] = $r;
				}
				return json_encode($row);
			} else {
				return "401";
			}
		}
	}

?>