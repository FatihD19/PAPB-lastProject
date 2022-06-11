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
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-header">
                        <h2>Add New Data</h2>
                    </div>
                    <p>Please fill this form and submit to add student record to the database.</p>
                    <form action="insertBarangDo.php" method="post">
                        <div class="form-group">
                            <label>item_code</label>
                            <input type="text" name="item_code" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>item_name</label>
                            <input type="mobile" name="item_name" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>price</label>
                            <input type="mobile" name="price" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>stock</label>
                            <input type="mobile" name="stock" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>gambar</label>
                            <input type="mobile" name="gambar" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="status">Status</label>
                        <label><input type="radio" name="status" value="terkirim" >terkirim</label>
                        <label><input type="radio" name="status" value="belum">belum</label>
                        </div>
                        
                        <input type="submit" class="btn btn-primary" name="submit" value="Submit">
                    </form>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>