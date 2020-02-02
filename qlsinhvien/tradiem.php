<?php 
	require "common/header.php";
?>

<div class="group-box">
	<div align="center">
	<div class="title">TRA CỨU ĐIỂM</div>
	<div class="group-box-content">
	
		<!-- form tim kiem -->
		<form action="m_ketqua.php" method="post" class="white-pink">
			<h1>Tra cứu sinh viên theo mã sinh viên </h1>
			<label>
				<span> Mã sinh viên: </span>
				<input id="masinhvien" type="text" name="masinhvien" placeholder="Mã sinh viên..." />
				<div class="suggestionsBox" id="suggestions" style="display: none;">
				<div class="suggestionList" id="autoSuggestionsList">
				</div>
				</div> 
			</label>
				 
			<label>
				<input id="btntimkiem1" type="submit" class="btn" name="btntimkiem1" value="Tìm kiếm" /> 
			</label> 
				
			<br></br>
			<br></br> 
				
			<h1>Tra cứu sinh viên theo tên 
			</h1>
			<label>
				<span> Tên sinh viên: </span>
				<input id="tensinhvien" type="text" name="tensinhvien" placeholder="Tên sinh viên..." />
				<div class="suggestionsBox" id="suggestions" style="display: none;">
				<div class="suggestionList" id="autoSuggestionsList">
				</div>
				</div> 
			</label>
			
			<label>
				<span> Lớp: </span>
				<select name="chonlop" id="chonlop"> <option value="">--Toàn bộ--</option>
					<?php
						// IN danh sách lớp
						$sql ="SELECT * FROM dbo_lopchuyennganh ORDER BY MaCN";
						$result = $db->query($sql);
						if ($result){
							while($row = $result->fetch_array()){
								echo "<option value='".$row["MaLop"]."' >".$row["TenLop"]."</option>";
							}
						}
						$result->free();
					?> 
				</select>
			</label>  
				
			<label>
				<input type="submit" class="btn" name="btntimkiem2" value="Tìm kiếm" /> 
			</label>   
				   
		</form>
	</div>
	</div>	
</div>
	
<?php require "common/footer.php"; ?>