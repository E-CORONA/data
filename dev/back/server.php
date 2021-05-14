<?php
session_start();

// initializing variables
$user_id = "";
$first_name  = "";
$last_name = "";
$city = "";
$contact_number = "";
$email = "";
$errors = array(); 

// connect to the database
$db =  oci_connect("ecoron", "qwerty123", "//localhost/orcl");

// REGISTER USER
if (isset($_POST['reg_user'])) {
  // receive all input values from the form
  $first_name = $_POST['first_name'];
  $last_name = $_POST['last_name'];
  $city = $_POST['city'];
  $contact_number = $_POST['contact_number'];
  $email = $_POST['email'];
  $password_1 = $_POST['password_1'];
  $password_2 = $_POST['password_2'];

  // form validation: ensure that the form is correctly filled ...
  // by adding (array_push()) corresponding error unto $errors array
  if (empty($email)) { array_push($errors, "Email is required"); }
  if (empty($city)) { array_push($city, "City is required"); }
  if (empty($password_1)) { array_push($errors, "Password is required"); }
  if ($password_1 != $password_2) {
	array_push($errors, "The two passwords do not match");
  }

  // first check the database to make sure 
  // a user does not already exist with the same username and/or email
  $user_check_query = "SELECT DISTINCT email FROM users WHERE user_id='$user_id'";
  //echo $user_check_query;
  $result = oci_parse($db, $user_check_query);
  oci_execute($result);
  oci_fetch_all($result, $user);

  var_dump($user);

  if ($user) { // if user exists
    if ($user['email'][0] === $email) {
      array_push($errors, "User already exists");
    }
  }

  echo 'hi';
  // Finally, register user if there are no errors in the form
  if (count($errors) == 0) {
    $password = md5($password_1);//encrypt the password before saving in the database
    $nextValue = oci_parse("select user_seq.nextval from dual");
    echo 'inserting for you a';
  	$query = oci_parse($db, "call insertUser($nextValue, $first_name, $last_name, $city, $contact_number,$email, $password)");

    $result = oci_parse($db, $query);
    oci_execute($result, OCI_DEFAULT);

    $cquery = "SELECT * FROM users";
    echo $cquery;
    $result = oci_parse($db, $cquery);
    oci_execute($result);
    oci_fetch_all($result, $cq);

    //var_dump($cq);

  	$_SESSION['email'] = $email;
  	$_SESSION['success'] = "Congratulations! You have registered";
  	header('location: index.php'); //here we go to the main page
  }
  else{
    echo 'There is an error! sorry(';
  }
}

// ... 
if (isset($_POST['login_user'])) {
    $email =  $_POST['email'];
    $password =  $_POST['password'];
  
    if (empty($email)) {
        array_push($errors, "Username is required");
    }
    if (empty($password)) {
        array_push($errors, "Password is required");
    }

    if (count($errors) == 0) {
        $new_password = md5($password);
        $query = "SELECT COUNT(*) FROM users WHERE email='$email'";
        
        $results = oci_parse($db, $query);
        oci_execute($results);
        oci_fetch_all($results, $results);

        //var_dump($results);
        echo $results['COUNT(*)'][0];

        if ($results['COUNT(*)'][0] == 1) {
          $_SESSION['email'] = $email;
          $_SESSION['success'] = "You are now logged in";
          header('location: index.php');
        }else {
            array_push($errors, "Wrong username/password combination");
        }
    }
  }
  oci_close($db);
  ?>