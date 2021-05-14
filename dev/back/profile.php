<?php
  session_start();

  // echo $_SESSION['user_id'];

  if (!isset($_SESSION['email'])) {
    $_SESSION['msg'] = "You must log in first";
    $_SESSION['user_id'] = 'None';
  }
  if (!isset($_SESSION['user_id'])) {
    $_SESSION['user_id'] = "None";
  }
  if (isset($_GET['logout'])) {
    session_destroy();
    unset($_SESSION['email']);
    $_SESSION['user_id'] = 'None';
    header("location: login.php");
  }
?>

<?php

$conn = oci_connect("ecoron", "qwerty123", "//localhost/orcl");

$query = 'SELECT BLOBDATA FROM BTAB WHERE BLOBID = :MYBLOBID';
$stmt = oci_parse ($conn, $query);
$myblobid = 1;
oci_bind_by_name($stmt, ':MYBLOBID', $myblobid);
oci_execute($stmt);
$arr = oci_fetch_array($stmt, OCI_ASSOC);
$result = $arr['BLOBDATA']->load();

header("Content-type: image/JPEG");
echo $result;

oci_close($conn);

?>
<!DOCTYPE php>
<php>
<head>
  <title>FAQ</title>
  <link rel="stylesheet" type="text/css" href="style.css?ver=<?php echo rand(111,999)?>">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body class="back" style="background-color: #d3f0e0">
    <div class="row no-gutters profile-block">
        <div class="photo-card">
            <div class="col-md-4">
                <!--Upload image-->
                <img src="images/4.jpg" class="card-img" alt="Profile image">
            </div>
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <!--Need data from table-->
                <h1 class="card-title">Brand Name <?php echo $org_name; ?></h1>
                <div class="sp_around">
                    <h4 class="card-text">Адрес: <?php echo $address; ?></h4>
                    <!--address--><h4></h4>
                </div>
                <div class="sp_around">
                    <h4 class="card-text">Контакты: <?php echo $contacts; ?></h4>
                    <!--contacts--><h4></h4>
                </div>
                <div class="sp_around">
                    <h4 class="card-text">Материалы: <?php echo $type_of_materials; ?></h4>
                    <!--материалы--><h4></h4>
                </div>
                <div class="sp_around">
                    <h4 class="card-text">При сдаче старых вещей, вы получаете скидку: </h4>
                    <!--Инфо о скидках--><h4>%<?php echo $sale; ?></h4>
                </div>
                <div>
                    <h4 class="card-text">График работы: <?php echo $work_time; ?></h4>
                    <!--working time--><h4></h4>
                </div>

                <div style="display: flex; justify-content: center; margin-top: 3vh;">
                    <?php echo "<a href = '$url_request' class='change' style='color: white; padding: 5px; margin-top: 5vh;'> Оставить запрос </a>\n"; ?>
                </div>
                    <p style="display: flex; justify-content: center; margin-top: 3vh;" class="card-text"><small class="text-muted">Информация о организации</small></p>

            </div>
        </div>
    </div>
    
  	
</body>
</html>
