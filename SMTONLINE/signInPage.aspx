<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signInPage.aspx.cs" Inherits="SMTONLINE.signInPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign in to SMT Card Simulator</title>
</head>
<body>
    <% Response.WriteFile("./headerAndIncludes.html"); %>
    <form id="form1" runat="server">
    <div>
        <label runat="server">Sign In: </label>&nbsp;<br />
        Username&nbsp;&nbsp;&nbsp; :<input runat="server" type="text" /><br />
        Password:&nbsp;&nbsp;&nbsp;
        <input runat="server" type="text" /></div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
