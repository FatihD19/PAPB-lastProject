<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="mt-5 mb-3 clearfix">
                        <h2 class="pull-left">Barang</h2>
                        <a href="insertBarangView.php" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Add New</a>
                    </div>
                    <div class="scroll">
                    <?php
                    $curl= curl_init();
                    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
                    //Pastikan sesuai dengan alamat endpoint dari REST API di UBUNTU, 
                    curl_setopt($curl, CURLOPT_URL, 'http://localhost/my_store/getApi.php');
                    $res = curl_exec($curl);
                    $json = json_decode($res, true);

                    echo '<table class="table table-bordered table-striped">';
                    echo "<thead>";
                        echo "<tr>";
                            echo "<th>#</th>";
                            echo "<th>item code</th>";
                            echo "<th>Nama</th>";
                            echo "<th>price</th>";
                            echo "<th>stock</th>";
                            echo "<th>gambar</th>";
                            echo "<th>status</th>";
                            echo "<th>Action</th>";
                        echo "</tr>";
                    echo "</thead>";
                    echo "<tbody>";
                    for ($i = 0; $i < count($json["data"]); $i++){
                        echo "<tr>";
                            echo "<td> {$json["data"][$i]["id"]} </td>";
                            echo "<td> {$json["data"][$i]["item_code"]} </td>";
                            echo "<td> {$json["data"][$i]["item_name"]} </td>";
                            echo "<td> {$json["data"][$i]["price"]} </td>";
                            echo "<td> {$json["data"][$i]["stock"]} </td>";
                            echo "<td> <img src={$json["data"][$i]["gambar"]}> </td>";
                            echo "<td> {$json["data"][$i]["status"]} </td>";
                            echo "<td>";
                                echo '<a href="updateBarangView.php?id='. $json["data"][$i]["id"] .'" class="mr-3" title="Update Record" data-toggle="tooltip"><span class="fa fa-pencil"></span></a>';
                                echo '<a href="deleteBarangDo.php?id='. $json["data"][$i]["id"] .'" title="Delete Record" data-toggle="tooltip"><span class="fa fa-trash"></span></a>';
                            echo "</td>";
                        echo "</tr>";
                    }
                    echo "</tbody>";                            
                echo "</table>";

                    curl_close($curl);
                    ?>
                </div>
                </div>
            </div>        
        </div>
    </div>

   
    </tbody>
    </table>      
</body>
</html>