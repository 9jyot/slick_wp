<?php 
include_once("connection.php");

class user_class {
	private $conn;
	
	public function __construct() {
		$this->conn = mysqli_connect(host,username,password);
		if(!$this->conn) {
			echo "could not connect to mysql server.";
			die();
		}
		if(!mysqli_select_db($this->conn,database)) {
			echo "could not connect to database.";
			die();
		}
	}

	

	public function check_ip(){
		$data = array();
		$data['ip_address'] = $_SERVER['REMOTE_ADDR'];
		$data['time'] = date("Y-m-d H:i:s");
		//print_r($data);die;
		$data['count'] = 1;
		try {
			$sql = "SELECT ip_address,time,count  FROM wp_ip_check WHERE ip_address='{$data['ip_address']}' ";
			$res = mysqli_query($this->conn,$sql);
			//print_r($this->convert_obj_to_array($res));die;
			$flag = 1;

			if(mysqli_num_rows($res) > 0){
				
				$result = mysqli_fetch_assoc($res);
				//print_r(strtotime($result['time']));die;

				$time_diff = (time() - strtotime($result['time']) )/60;
				//echo date("Y-m-d H:i:s",$result['time'])."-".date("Y-m-d H:i:s",time())."<br>";
				//echo $time_diff;die;
				

				if($time_diff <= 1 )
				{
					//echo "test die";

					if($result['count'] < 5)
					{

						$upd = "UPDATE wp_ip_check SET count=count + 1 where ip_address='{$data['ip_address']}' ";
						//$flag = 1;
						$res_upd = mysqli_query($this->conn,$upd);
					}
					else{
						$res_upd = "0";
						$flag = 0;

					}
				}
				else
				{					
					
					$upd = "UPDATE wp_ip_check SET `count`=1,`time`='".$data['time']."' where ip_address='".$data['ip_address']."' ";
					//echo $upd;die;
					//$flag = 1;
					$res_upd = mysqli_query($this->conn,$upd);

				}
				//print_r($res_upd);die;

				if($res_upd == 1 || $res_upd == "0")
				{
					//echo "updated";
					$query_output = 1;
				}
				else
				{
					$query_output = 0;
					//echo "not updated";
				}
				$data_outp['query_output'] = $query_output;
				$data_outp['url_hits_output'] = $flag;

				
			}
			else
			{
				$sql_insert = "INSERT INTO wp_ip_check VALUES('','{$data['ip_address']}','{$data['time']}', '{$data['count']}')";
				$res_insert = mysqli_query($this->conn,$sql_insert);
				if($res_insert)
				{
					//echo "Inserted";
					$query_output = 1;
				}
				else
				{
					//echo "Not inserted";
					$query_output = 0;
				}
				
				$data_outp['query_output'] = $query_output;
				$data_outp['url_hits_output'] = $flag;
			}
			// Check Url hit count
			if($data_outp['query_output'] == 1 && $data_outp['url_hits_output'] == 1)
			{
				$data_outp['status'] = "allowed";				
			}
			else
			{
				$data_outp['status'] = "not allowed";
			}
		return $data_outp;

		}
		catch(Exception $e) {
			//echo "message:" .$e->getMessage();
			$data_outp['status'] = "not allowed";
			$data_outp['error_message'] = $e->getMessage();
		}

	}

	public function update_data($table_name,$data)
	{
		try{
			$sql_upd = "Update ".$table_name." set ip_address='".$data['ip_address']."',time='".$data['time']."',count='1' where ip_address='".$data['ip_address']."'";
			$res_upd = mysqli_query($this->conn,$sql_upd);
			if($res_upd)
			{
				$res['msg'] = "inserted";
			}else{
				$res['msg'] = "error";
			}

		}catch(Exception $e) {
			
			
			$res['msg'] = $e->getMessage();
		}
	}

	
	
}
?>