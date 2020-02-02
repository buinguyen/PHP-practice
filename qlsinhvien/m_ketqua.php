<!-- start header -->	
<?php 
	require "common/header.php";
?>	
<!-- end header -->

<!-- body start -->
<div id="wrapper">
	<div id="content">

	<?php
		$thutuc='';
		$idlinhvuc='';
		$coquan='';
		if(isset($_POST["thutuc"]) and isset($_POST["idlinhvuc"]) and isset($_POST["coquan"])) {
			$postthutuc = $_POST["thutuc"];
			$postidlinhvuc = $_POST["idlinhvuc"];
			$postcoquan = $_POST["coquan"];
			
			$thutuc=$postthutuc;
			$idlinhvuc=$postidlinhvuc;
			$coquan=$postcoquan;
			
			$thutuc = new Thutuc();	
			$jdata = $thutuc -> timkiemthutuc($postthutuc, $postidlinhvuc, $postcoquan);
			
			// truy van ban linh vuc de lay ten linh vuc tu idlinhvuc
			
			if($jdata == "400")
				echo "Lỗi tra cứu.";
			else if($jdata == "401")
				echo '<h3>Không có thủ tục được tìm thấy.</h3>';
			else {
				$arr = json_decode($jdata, true);
				
				// return view;
				$page = 0;
				if ( isset($_GET['page']) ){
					$page = $_GET['page'];
				}
				
				$sodu_lieu = count($arr);
				$baitren_mottrang=4;
				$sotrang = $sodu_lieu/$baitren_mottrang;
				
				$batdau = $page*$baitren_mottrang;
				
				$jdata2 = $thutuc -> phantrangthutuc2( $postthutuc, $postidlinhvuc, $postcoquan, $batdau, $baitren_mottrang );
				$arr2 = json_decode($jdata2, true);	
				
				echo '<div class="box-content"><ol>';
				echo '<h3 style="text-align: center;">Các thủ tục tìm thấy</h3></br>';
				// start table thutuc
				echo '
					<table class="bangthutuc">
						<thead>
							<tr>
								<th class="border-left">Tên thủ tục</th>
								<th>Lĩnh vực</th>
								<th>Cơ quan ban hành</th>
								<th class="border-right">Tệp đính kèm</th>
							</tr>
						</thead>
						<tbody>
				';
				$thutuc = null;
				$linhvuc = new Linhvuc();
				foreach($arr2 as $k => $v) {
					if($postidlinhvuc != "")
						$data_ten = $linhvuc -> layLinhvucID($postidlinhvuc);							
					else 
						$data_ten = $linhvuc -> layLinhvucID($v["idlinhvuc"]);							
					echo '
							<tr>
								<td>'.$v["tenthutuc"].'</td>
								<td>'.$data_ten.'</td>
								<td>'.$v["cqbanhanh"].'</td>
								<td onclick="downloadFile(\''.$v["link"].'\')"><img src="http://localhost/web/share/img/word.png"/></td>
							</tr>							
					';
				}
				echo '
						</tbody>
					</table>
				';
				echo '</ol></div>';	
			

				for ( $page = 0; $page <= $sotrang; $page++ ){
					$index = $page + 1;
					echo "<a href='m_ketqua.php?page={$page}&postthutuc={$postthutuc}&postidlinhvuc={$postidlinhvuc}&postcoquan={$postcoquan}'>{$index}</a>      ";
				}

				$linhvuc = null;
			}
		
		echo '<p style="margin-top: 20px; color: #d70000; font-weight: bold;">Số kết quả tìm thấy: '.$sodu_lieu.'</p>';
		
		echo '</div>';
		// destroy object and close mysql connection
	} else {
		$postthutuc = isset($_GET["thutuc"]) ? $_GET["thutuc"] : "";
		$postidlinhvuc = isset($_GET["idlinhvuc"]) ? $_GET["idlinhvuc"] : "";
		$postcoquan = isset($_GET["coquan"]) ? $_GET["coquan"] : "";
		
		$thutuc = new Thutuc();	
		$jdata = $thutuc -> timkiemthutuc($postthutuc, $postidlinhvuc, $postcoquan);
		
		// truy van ban linh vuc de lay ten linh vuc tu idlinhvuc
		
		if($jdata == "400")
			echo "Lỗi tra cứu.";
		else if($jdata == "401")
			echo '<h3>Không có thủ tục được tìm thấy.</h3>';
		else {
			$arr = json_decode($jdata, true);
			
			// return view;
			$page = 0;
			if ( isset($_GET['page']) ){
				$page = $_GET['page'];
			}
			
			$sodu_lieu = count($arr);
			$baitren_mottrang=4;
			$sotrang = $sodu_lieu/$baitren_mottrang;
			
			$batdau = $page*$baitren_mottrang;
			
			$jdata2 = $thutuc -> phantrangthutuc2( $postthutuc, $postidlinhvuc, $postcoquan, $batdau, $baitren_mottrang );
			$arr2 = json_decode($jdata2, true);	
			
			echo '<div class="box-content"><ol>';
			echo '<h3 style="text-align: center;">Các thủ tục tìm thấy</h3></br>';
			// start table thutuc
			echo '
				<table class="bangthutuc">
					<thead>
						<tr>
							<th class="border-left">Tên thủ tục</th>
							<th>Lĩnh vực</th>
							<th>Cơ quan ban hành</th>
							<th class="border-right">Tệp đính kèm</th>
						</tr>
					</thead>
					<tbody>
			';
			$thutuc = null;
			$linhvuc = new Linhvuc();
			foreach($arr2 as $k => $v) {
				if($postidlinhvuc != "")
					$data_ten = $linhvuc -> layLinhvucID($postidlinhvuc);							
				else 
					$data_ten = $linhvuc -> layLinhvucID($v["idlinhvuc"]);							
				echo '
						<tr>
							<td>'.$v["tenthutuc"].'</td>
							<td>'.$data_ten.'</td>
							<td>'.$v["cqbanhanh"].'</td>
							<td onclick="downloadFile(\''.$v["link"].'\')"><img src="http://localhost/web/share/img/word.png"/></td>
						</tr>							
				';
			}
			echo '
					</tbody>
				</table>
			';
			echo '</ol></div>';	
		

			for ( $page = 0; $page <= $sotrang; $page++ ){
					$index = $page + 1;
					echo "<a href='m_ketqua.php?page={$page}&postthutuc={$postthutuc}&postidlinhvuc={$postidlinhvuc}&postcoquan={$postcoquan}'>{$index}</a>      ";
			}

			$linhvuc = null;
		}
	
	echo '<p style="margin-top: 20px; color: #d70000; font-weight: bold;">Số kết quả tìm thấy: '.$sodu_lieu.'</p>';
	
	echo '</div>';
	// destroy object and close mysql connection
	}
		
	?>
	</div>
</div>

<!-- body end -->

<?php require "common/footer.php"; ?>