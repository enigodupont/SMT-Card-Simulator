<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signedUp.aspx.cs" Inherits="SMTONLINE.signedUp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="defaultPage">
<head runat="server">
    <title>Signed Up</title>
<!-- This is for Jquery-->
<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<!-- This is for Bootstrap-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />

    <link type="text/css" rel="stylesheet" href="./css/myStyle1.css" />
</head>
<body class="formbody">
    <form id="form1" runat="server" >   
        <div class="jumbotron">
            <div class="container">
                <h1>Thanks for joining SMTONLINE</h1>
                    Your account has been created, please log in from the home page :D!
            </div>
        </div>
    </form>
</body>
</html>

<script>
    setTimeout(function () { location.replace("Default.aspx")}, 2000);
</script>
