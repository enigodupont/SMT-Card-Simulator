<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="playerCreate.aspx.cs" Inherits="SMTONLINE.playerCreate" %>
<%@ Register TagPrefix="MYNAV" TagName="NAVBAR" Src="./DynamicData/FieldTemplates/headerAndIncludes.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Player Creator</title>
</head>
<body class="formbody">
    <form id="form1" runat="server" style="color: red;">
        <MYNAV:NAVBAR runat="server"></MYNAV:NAVBAR>
        <fieldset>
            <div id="legend">
                <legend class="" style="color: red;">Player Creator</legend>
            </div>
            <div class="control-group">
                <!-- Player Name -->
                <label class="control-label" for="playerName">Your Player Name</label>
                <div class="controls">
                    <input type="text" id="playerName" runat="server" name="playerName" placeholder="Nanashi"  class="input-xlarge" required />
                    <p class="help-block">Name can contain any letters or numbers, without spaces</p>
                </div>
            </div>
            <div class="control-group">
                <!-- Button -->
                <div class="controls">
                    <asp:Button runat="server" OnClientClick="checkData();" OnClick="createPlayer" CssClass="btn btn-success" Text="Register" />
                </div>
            </div>
        </fieldset>
    </form>
</body>
</html>

<script type="text/javascript">
    function checkData() {
        return document.getElementById('playerName').value != "";
    }
</script>
