<?php
	$host = 'localhost';
	$port = '3306';
	$user = 'root';
	$pass = '';
	$database = 'qldaotao';

	$page_title = 'Hệ thống Quản lý đào tạo - Trường Cao đẳng Ngô Gia Tự Bắc Giang';
	$page_keywords = 'hệ thống, đào tạo, quản lý, quả lý đào tạo';
	$page_description = 'Hệ thống Quản lý đào tạo - Trường Cao đẳng Ngô Gia Tự Bắc Giang';

	 require_once("libs/db.php"); 
	 require_once("libs/auto_login.php"); 

	define('ROOT_DIR', "");
	 
	define ("IMAGES_DIR", ROOT_DIR."images" );
	define ("LIBS_DIR", ROOT_DIR."libs");
?>
