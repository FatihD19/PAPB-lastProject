<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Record</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        .wrapper{
            width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>

<?php
 $id = $_GET['id'];
 $curl= curl_init();
 curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
 //Pastikan sesuai dengan item_name endpoint dari REST API di ubuntu
 curl_setopt($curl, CURLOPT_URL, 'http://localhost/my_store/getApi.php?id='.$id.'');
 $res = curl_exec($curl);
 $json = json_decode($res, true);
//var_dump($json);
?>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-header">
                        <h2>Update Data</h2>
                    </div>
                    <p>Please fill this form and submit to add student record to the database.</p>
                    <form action="updateBarangDo.php" method="post">
                        <input type = "hidden" name="id" value="<?php echo"$id";?>">
                        <div class="form-group">
                            <label>item_code</label>
                            <input type="text" name="item_code" class="form-control" value="<?php echo($json["data"][0]["item_code"]); ?>">
                        </div>
                        <div class="form-group">
                            <label>item_name</label>
                            <input type="mobile" name="item_name" class="form-control" value="<?php echo($json["data"][0]["item_name"]); ?>">
                        </div>
                        <div class="form-group">
                            <label>price</label>
                            <input type="mobile" name="price" class="form-control" value="<?php echo($json["data"][0]["price"]); ?>">
                        </div>
                        <div class="form-group">
                            <label>stock</label>
                            <input type="mobile" name="stock" class="form-control" value="<?php echo($json["data"][0]["stock"]); ?>">
                        </div>
                        <div class="form-group">
                            <label>gambar</label>
                            <input type="mobile" name="gambar" class="form-control" value="<?php echo($json["data"][0]["gambar"]); ?>">
                        </div>
                        <div class="form-group">
                            <label for="status">Status</label>
                        <label><input type="radio" name="status" value="terkirim" <?php if($json['status']=='terkirim') echo 'checked'?>>terkirim</label>
                        <label><input type="radio" name="status" value="belum" <?php if($json['status']=='belum') echo 'checked'?>>belum</label>
                        </div>
                        <input type="submit" class="btn btn-primary" name="submit" value="Submit">
                    </form>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>