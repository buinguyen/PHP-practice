<?php
	require_once("mdl_connection.php");
	
	class Nganh extends Connection {
		private $manganh;
		private $makhoa;
		private $tennganh;
		private $sonamdt;
		
		public function __construct() {
			parent::__construct();
		}
		public function __destruct() {
			parent::__destruct();
		}
		
		// lay danh sach cac nganh tu MaKhoa
		public function getListMajor($idkhoa) {
			if ($idkhoa != null){
				$query = "SELECT * FROM dbo_nganh WHERE MaKhoa ='".$idkhoa."'";
				$rs = mysql_query($query);
				if (mysql_num_rows($rs) > 0) {
					return $rs;
				} else {
					return "401";
				}
			} else {
				echo "Khong the truy van tren bang Nganh";
			}
		}
	}

?>