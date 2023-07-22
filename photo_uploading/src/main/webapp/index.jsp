<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
</head>
<body>
<div align="center">
    <h2>Registration Form</h2>
    <form action="registration" method="post" enctype="multipart/form-data">
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required><br><br>
        
        <label for="profilePic">Profile Picture:</label>
        <input type="file" name="image" id="image" required><br><br>
        
        <input type="submit" value="Register">
    </form>
    </div>
</body>
</html>