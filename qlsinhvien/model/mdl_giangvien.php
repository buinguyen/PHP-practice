<?php
	require_once("mdl_connection.php");
	
	class Giangvien extends Connection {
		private $magv;
		private $makhoa;
		private $mahh;
		private $mahv;
		private $holot;
		private $ten;
		private $ngaysinh;
		private $gioitinh;
		private $email;
		private $quequan;
		private $matkhau;
		
		public function __construct() {
			parent::__construct();
		}
		public function __destruct() {
			parent::__destruct();
		}
		
		// xac nhan tai khoan
		public function getAccount($idgv = null, $pass = null) {
			if ($idgv != null && $pass != null) {
				$query = "SELECT MaGV as User, concat(Holot,' ', Ten) as HoTen, MatKhau  ".
					" FROM dbo_giangvien WHERE MaGV='".$idgv."' ".
					" AND MatKhau ='". $pass ."'";
				$rs = mysql_query($query) or die ("Khong the thuc hien truy van tren bang Giang vien");
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
	}

?>