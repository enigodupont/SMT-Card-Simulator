<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SMTONLINE.Default" %>
<%@ Register TagPrefix="MYNAV" TagName="NAVBAR" Src="~/DynamicData/FieldTemplates/headerAndIncludes.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="defaultPage" lang="en">
<head runat="server">
    <title>Welcome to SMT Card Simulator</title>
</head>
<body class="formbody">
    <form id="form1" runat="server" >
        <MYNAV:NAVBAR runat="server"></MYNAV:NAVBAR>    
        <div style="background-color:transparent; color:#A20000;" class="jumbotron">
            <div class="container">
                <h1 class="text-center"><u>Welcome to SMTONLINE</u></h1>
                    This is a Shin Megami Tensei D&D card manager and creator. 
                    <br />
                    We currently have sign up's working along with a functional demon bestiary!
                
            </div>
        </div>
    </form>
</body>
</html>
