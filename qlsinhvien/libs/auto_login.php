<?php
	require "model/mdl_sinhvien.php";
	require "model/mdl_giangvien.php";
	
function auto_login(){
		//$db = $GLOBALS["db"];
	if (isset($_COOKIE["User"]) && isset($_COOKIE["Password"]) && isset($_COOKIE["Type"])){
		$user = $_COOKIE["User"];
		$pass = $_COOKIE["Password"];
		$type = $_COOKIE["Type"];
		
		$acc = null;
		$result = null;
		if ($type == "sv"){
			$acc = new Sinhvien();
		}else{
			$acc = new Giangvien();
		}
		$result = $acc -> getAccount($user, $pass);
		
		// nếu xác thực thành công
		if ($result != "401"){
			$result = json_decode($result, true);
			
			if (count($result) > 0){
				//if ($row = $result->fetch_array()){
				foreach($result as $k => $row) {
					// tạo lại session
					$_SESSION["loggedin"]= true;
					$_SESSION["User"] = $row["User"];
					$_SESSION["HoTen"] = $row["HoTen"];
					$_SESSION["Type"] = $type;
						
					// đặt lại cookie với thời gian mới
					setcookie("User",$row["User"],time()+3600*24 );
					setcookie("Password",$row["MatKhau"],time()+3600*24);
					setcookie("Type",$type,time()+3600*24);
						
					header("location: index.php");
					break;
				}
			}else{
				// xác thực không thành công, xóa cookie đã lưu
				setcookie("User","",time()-3600);
				setcookie("Password","",time()-3600);
				setcookie("Type","",time()-3600);
				header("location: ". $_SERVER["PHP_SELF"]);
			}
		}
		echo "Dang nhap";
	}
}
?>