<?php

if(isset($_POST['submit']))
{    
$item_code = $_POST['item_code'];
$item_name = $_POST['item_name'];
$price = $_POST['price'];
$stock = $_POST['stock'];
$gambar = $_POST['gambar'];
$status = $_POST['status'];

//Pastikan sesuai dengan item_name endpoint dari REST API di ubuntu
$url='http://localhost/my_store/getApi.php';
$ch = curl_init($url);
// data yang akan dikirim ke REST api, dengan format json
$jsonData = array(
    'item_code' =>  $item_code,
    'item_name' =>  $item_name,
    'price' =>  $price,
    'stock' =>  $stock,
    'gambar' =>  $gambar,
    'status' =>  $status,
);

//Encode the array into JSON.
$jsonDataEncoded = json_encode($jsonData);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

//pastikan mengirim dengan method POST
curl_setopt($ch, CURLOPT_POST, true);

//Attach our encoded JSON string to the POST fields.
curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonDataEncoded);

//Set the content type to application/json
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json')); 

//Execute the request
$result = curl_exec($ch);
$result = json_decode($result, true);

curl_close($ch);

//var_dump($result);
// tampilkan return statusnya, apakah sukses atau tidak
print("<center><br>status :  {$result["status"]} "); 
print("<br>");
print("message :  {$result["message"]} "); 
echo "<br>Sukses terkirim ke ubuntu server !";
echo "<br><a href=Barang.php> OK </a>";
}
?>