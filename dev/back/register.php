<?php include('server.php') ?>
<!DOCTYPE html>
<html>
<head>
  <title>Registration system PHP and MySQL</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
  <div class="header">
  	<h2>Register</h2>
  </div>
	
  <form method="post" action="register.php">
  	<?php include('errors.php'); ?>
	<div class="input-group">
  	  <label>First name</label>
  	  <input type="text" name="first_name" value="<?php echo $first_name; ?>">
  	</div>
	<div class="input-group">
  	  <label>Last name</label>
  	  <input type="text" name="last_name" value="<?php echo $last_name; ?>">
  	</div>
  	<div class="input-group">
  	  <label>City</label>
  	  <input type="text" name="city" value="<?php echo $city; ?>">
  	</div>
	<div class="input-group">
  	  <label>Contact number</label>
  	  <input type="text" name="contact_number" value="<?php echo $contact_number; ?>">
  	</div>
  	<div class="input-group">
  	  <label>Email</label>
  	  <input type="email" name="email" value="<?php echo $email; ?>">
  	</div>
  	<div class="input-group">
  	  <label>Password</label>
  	  <input type="password" name="password_1">
  	</div>
  	<div class="input-group">
  	  <label>Confirm password</label>
  	  <input type="password" name="password_2">
  	</div>
  	<div class="input-group">
  	  <button type="submit" class="btn" name="reg_user">Register</button>
  	</div>
  	<p>
  		Already a member? <a href="login.php">Sign in</a>
  	</p>
  </form>
</body>
</html>