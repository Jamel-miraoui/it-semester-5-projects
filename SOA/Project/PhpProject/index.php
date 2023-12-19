<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
  <link rel="stylesheet" href="index.css" />
</head>

<body>
  <div class="main">
    <input type="checkbox" id="chk" aria-hidden="true" />
    <div class="signup">
      <form method="post" action="adduser.php">
        <label for="chk" aria-hidden="true">Sign up</label>
        <input type="text" name="user" placeholder="User name" required="true" />
        <input type="password" name="psw" placeholder="Password" required="" />
        <div class="notif"><?php
                            if (isset($_GET['msg']) && $_GET['msg'] == 1) {
                              echo "<p>User Added With success</p>";
                            }
                            ?>
        </div>
        <button value="submit">Sign up</button>
      </form>
    </div>
    <div class="login">
      <form method="post" action="login.php">
        <label for="chk" aria-hidden="true">Login</label>
        <input type="text" name="username" placeholder="Email" required="" />
        <input type="password" name="password" placeholder="Password" required="" />
        <button type="submit" name="loginForm">Login</button>
        <div class="notif" style="color: red;">
          <?php
          if (isset($_GET['msg1']) && $_GET['msg1'] == 1) {
            echo "<p>Login failed!</p>";
          }
          ?>
        </div>
      </form>
    </div>
  </div>
</body>

</html>