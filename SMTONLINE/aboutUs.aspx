<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aboutUs.aspx.cs" Inherits="SMTONLINE.aboutUs" %>
<%@ Register TagPrefix="MYNAV" TagName="NAVBAR" Src="./DynamicData/FieldTemplates/headerAndIncludes.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>About Us</title>
</head>
<body class="formbody">
    <form id="form1" runat="server">
        <MYNAV:NAVBAR runat="server"></MYNAV:NAVBAR>
            <div class="jumbotron">
                <h1 class="text-center">Frequently Asked Questions</h1>
                <ul class="list-group">
                    <li class="list-group-item">
                        <h2>Why we created SMTOnline - </h2>
                        We both share a love for Shin Megame Tensei and wanted to create an online tool to facilitate our D&D sessions.
                    </li>
                    <li class="list-group-item">
                        <h2>What game is the demonic bestiary based off of  </h2>
                        All game information is based off of Shin Megami Tensei IV Apocalypse
                    </li>
                </ul>
            </div>
    </form>
</body>
</html>
