<?php session_start();?>
<!doctype html>
<html>
<head>
	<?php require_once("libs/config.php");?>
	<?php 
		if (!isset($_SESSION["loggedin"])){
			auto_login();
		}
	?>
	
	<title><?php echo $page_title; ?></title>
	<meta charset="utf-8"> 
	<meta name="keywords" content="<?php echo $page_keywords; ?>" />
	<meta name="description" content="<?php echo $page_description; ?>" />
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" type="text/css" href="css/leftbar.css" />
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.10.2.custom.js"></script>

	<link rel="stylesheet" 	href="css/ui-lightness/jquery-ui-1.10.2.custom.css" />
<!-- 	<link rel="stylesheet" 	href="css/jmetro/jquery-ui-1.10.2.custom.css" /> -->
    
</head>
<body>
	<div id="pageWrapper">
		<div id="header">
			<img id="logo" src="<?php echo IMAGES_DIR;?>/logo.jpg" alt="Cao đẳng Ngô Gia Tự Bắc Giang" />
			<h1 id="siteTitle"> Hệ Thống Quản Lý Sinh Viên </h1>
			<!--<img id="logo2" src="<?php echo IMAGES_DIR;?>/logo2.png" /> -->
		</div> <!-- End of header -->
		
		<div id="nav"> 
			<div  id="menu" > 
				<a href="index.php">Trang chủ</a>
				<a> &nbsp &nbsp|&nbsp &nbsp</a>
				<a href="gioithieu.php">Giới thiệu</a>
				<a> &nbsp &nbsp|&nbsp &nbsp</a>
				<a href="tradiem.php">Tra cứu điểm</a>
				<a> &nbsp &nbsp|&nbsp &nbsp</a>
				<a href="gioithieu.php">Thời khóa biểu</a>
				
				<div  id="login" > 
					<?php 
						// lấy cookie đăng nhập tự động
						if (isset($_SESSION["loggedin"])){
							//echo "Xin chào, "."<a>".$_SESSION["HoTen"]."</a>";
							echo "Xin chào, &nbsp"."<a style='color: #00CCFF;'>".$_SESSION["HoTen"]."</a>";
							echo " &nbsp | &nbsp <a href='login.php?logut' id='aLogout'>Thoát</a>";	
						}else {
							echo "<a href='login.php'>Đăng nhập</a>";
						}
					?>
				</div>
			</div>

			
		</div> <!-- End of Navigation menu --> 
		
		<div id="contentWrapper" > 
			<div id="leftSide" >
				<div class="group-box" id="danhmuc">
					<div class="title">DANH MỤC</div>  
					<div class="menu_div">
						<ul>								
							<li> <a href="khoa.php">Khoa</a> </li>
							<li> <a href="daotao.php">Chương trình đào tạo</a> </li>
							<li> <a href="lop.php">Lớp chuyên ngành</a> </li>
							<li> <a href="sinhvien.php">Sinh viên</a> </li>
							<li> <a href="hocphi.php">Học phí</a> </li>
							<li> <a href="maubieu.php">Mẫu biểu</a> </li>
						</ul>						
					</div>
				</div>
				
				<div class="group-box"> 
					<div class="title">MENU
					</div> 
					<div class="menu_div">
						<ul>							
							<li> <a href="index.php">Link 1</a> </li>
							<li> <a href="index.php">Link 2</a> </li>
							<li> <a href="index.php">Link 3</a> </li> 
						</ul>						
					</div>						
				</div>
			</div> <!-- End of Left Side -->
	
		<div id="mainContent">
	