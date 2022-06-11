<?php
//file api untuk website
require_once "config.php";
$request_method=$_SERVER["REQUEST_METHOD"];
switch ($request_method) {
   case 'GET':
         if(!empty($_GET["id"]))
         {
            $id=intval($_GET["id"]);
            get_brg($id);
         }
         else
         {
            get_brgs();
         }
         break;
   case 'POST':
         if(!empty($_GET["id"]))
         {
            $id=intval($_GET["id"]);
            update_brg($id);
         }
         else
         {
            insert_brg();
         }     
         break; 
   case 'DELETE':
          $id=intval($_GET["id"]);
            delete_brg($id);
            break;
   default:
      // Invalid Request Method
         header("HTTP/1.0 405 Method Not Allowed");
         break;
      break;
 }



   function get_brgs()
   {
      global $mysqli;
      $query="SELECT * FROM tb_item";
      $data=array();
      $result=$mysqli->query($query);
      while($row=mysqli_fetch_object($result))
      {
         $data[]=$row;
      }
      $response=array(
                     'status' => 1,
                     'message' =>'Get List tb_item Successfully.',
                     'data' => $data
                  );
      header('Content-Type: application/json');
      echo json_encode($response);
   }
 
   function get_brg($id=0)
   {
      global $mysqli;
      $query="SELECT * FROM tb_item";
      if($id != 0)
      {
         $query.=" WHERE id=".$id." LIMIT 1";
      }
      $data=array();
      $result=$mysqli->query($query);
      while($row=mysqli_fetch_object($result))
      {
         $data[]=$row;
      }
      $response=array(
                     'status' => 1,
                     'message' =>'Get tb_item Successfully.',
                     'data' => $data
                  );
      header('Content-Type: application/json');
      echo json_encode($response);
        
   }
 
   function insert_brg()
      {
         global $mysqli;
         if(!empty($_POST["item_code"])){
            $data=$_POST;
         }else{
            $data = json_decode(file_get_contents('php://input'), true);
         }

         $arrcheckpost = array('item_code' => '','item_name' => '','price' => '','stock' => '','status' => '','gambar' => '');
         $hitung = count(array_intersect_key($data, $arrcheckpost));
         if($hitung == count($arrcheckpost)){
          
               $result = mysqli_query($mysqli, "INSERT INTO tb_item SET
               item_code = '$data[item_code]',
               item_name = '$data[item_name]',
               price = '$data[price]',
               stock = '$data[stock]',
               status = '$data[status]',
               gambar = '$data[gambar]'
               ");                
               if($result)
               {
                  $response=array(
                     'status' => 1,
                     'message' =>'tb_item Added Successfully.'
                  );
               }
               else
               {
                  $response=array(
                     'status' => 0,
                     'message' =>'tb_item Addition Failed.'
                  );
               }
         }else{
            $response=array(
                     'status' => 0,
                     'message' =>'Parameter Do Not Match'
                  );
         }
         header('Content-Type: application/json');
         echo json_encode($response);
      }
 
   function update_brg($id)
      {
         global $mysqli;
         if(!empty($_POST["item_code"])){
            $data=$_POST;
         }else{
            $data = json_decode(file_get_contents('php://input'), true);
         }

         $arrcheckpost = array('item_code' => '','item_name' => '','price' => '','stock' => '','status' => '','gambar' => '');
         $hitung = count(array_intersect_key($data, $arrcheckpost));
         if($hitung == count($arrcheckpost)){
          
              $result = mysqli_query($mysqli, "UPDATE tb_item SET
              item_code = '$data[item_code]',
               item_name = '$data[item_name]',
               price = '$data[price]',
               stock = '$data[stock]',
               status = '$data[status]',
               gambar = '$data[gambar]'
              WHERE id='$id'");
          
            if($result)
            {
               $response=array(
                  'status' => 1,
                  'message' =>'tb_item Updated Successfully.'
               );
            }
            else
            {
               $response=array(
                  'status' => 0,
                  'message' =>'tb_item Updation Failed.'
               );
            }
         }else{
            $response=array(
                     'status' => 0,
                     'message' =>'Parameter Do Not Match'
                  );
         }
         header('Content-Type: application/json');
         echo json_encode($response);
      }
 
   function delete_brg($id)
   {
      global $mysqli;
      $query="DELETE FROM tb_item WHERE id=".$id;
      if(mysqli_query($mysqli, $query))
      {
         $response=array(
            'status' => 1,
            'message' =>'tb_item Deleted Successfully.'
         );
      }
      else
      {
         $response=array(
            'status' => 0,
            'message' =>'tb_item Deletion Failed.'
         );
      }
      header('Content-Type: application/json');
      echo json_encode($response);
   }

 
?> 

