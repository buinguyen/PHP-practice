<?php
	require_once("mdl_connection.php");
	
	class Sinhvien extends Connection {
		private $masv;
		private $malop;
		private $holot;
		private $ten;
		private $ngaysinh;
		private $gioitinh;
		private $quequan;
		private $matkhau;
		private $email;
		
		public function __construct() {
			parent::__construct();
		}
		public function __destruct() {
			parent::__destruct();
		}
		
		// xac nhan tai khoan
		public function getAccount($idsv = null, $pass = null) {
			if ($idsv != null && $pass != null) {
				$query = "SELECT MaSV as User, concat(Holot,' ', Ten) as HoTen, MatKhau ".
					" FROM dbo_sinhvien WHERE MaSV='".$idsv."' ".
					" AND MatKhau ='".$pass."'";
				$rs = mysql_query($query) or die ("Khong the thuc hien truy van tren bang Sinh vien");
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
		
		// lay danh sach Sinh vien tu MaLop
		public function getListStudent($idlop = null) {
			if ($idlop != null) {
				$query = "select * from dbo_sinhvien where MaLop = '$idlop'";
				$rs = mysql_query($query) or die ("Khong the thuc hien truy van tren bang Sinh vien");
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
		
		// lay Sinh vien tu MaSV
		public function getStudent($idsv = null) {
			if ($idsv != null) {
				$query = "select * from dbo_sinhvien where MaSV = '$idsv'";
				$rs = mysql_query($query) or die ("Khong the thuc hien truy van tren bang Sinh vien");
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