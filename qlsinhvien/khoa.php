<?php 
	require_once "common/header.php"; 
	require_once "model/mdl_khoa.php"; 
?>

<link rel="stylesheet" href="css/style2.css">
<script src="js/zjquery-1.11.1.js"></script>
<script src="js/zbootrap-3.2.0.js"></script>

<div class="group-box" align="left">
	<div class="title" style="text-align: center;"> KHOA - VIỆN </div> 
	<form method="post" name="frmKhoa" action="<?php echo $_SERVER["PHP_SELF"];?>">
        <div class="panel-group" id="accordion">
            <?php
			$khoa = new Khoa();
			$result = $khoa -> getListFaculty();
			$result = json_decode($result, true);
            //$sql ="SELECT * FROM dbo_khoa ORDER BY MaKhoa";
            //$result = $db->query($sql);
            $count = 0;
            if ($result){
				foreach($result as $k => $row) {
                //while($row = $result->fetch_array()) {
                    $count++;
                    echo '
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse'.$count.'" class="collapsed">'.$count.'. '.$row["TenKhoa"].'</a>
                                <span id="#title2" class="ui-icon ui-icon-triangle-1-s"></span>
                            </div>
                        </div>';
                    echo '
                        <div id="collapse'.$count.'" class="panel-collapse collapse" style="height:0px;">
                    ';    
                        $makhoa = $row["MaKhoa"];
						
                        $sql2 ="SELECT * FROM dbo_nganh WHERE MaKhoa = '$makhoa'";
                        $result2 = $db->query($sql2);   
                        if ($result2){
                            $count2 = 0;
                            while($row2 = $result2->fetch_array()) {
								$count2++;
                                echo '
                                <div class="panel-body">
                                    '.$count2.'. '.$row2["TenNganh"].'
                                </div>
                                ';
								//<a data-toggle="collapse" data-parent="#accordion" href="#collapse'.$count2.'" class="collapsed">'.$count2.'. '.$row2["TenNganh"].'</a>
									//<span id="#title2"></span>
                            }
                        }
                        echo '
                        </div>
                        ';
						//
						$manganh = $row2["MaNganh"];
                    echo '
                    </div>
                    ';
                }
            }
            ?>
        </div> 					
 
		<br/>			
		<hr>  
	</form>  
</div>

<?php require "common/footer.php"; ?>


