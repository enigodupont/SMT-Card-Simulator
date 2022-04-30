<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signUp.aspx.cs" Inherits="SMTONLINE.DynamicData.FieldTemplates.signUp" %>
<%@ Register TagPrefix="MYNAV" TagName="NAVBAR" Src="./DynamicData/FieldTemplates/headerAndIncludes.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Sign Up!</title>
</head>
<body class="formbody">
    <form id="form1" runat="server" style="color: red;">
        <MYNAV:NAVBAR runat="server"></MYNAV:NAVBAR>
        <fieldset>
            <div id="legend">
                <legend class="" style="color: red;">Register</legend>
            </div>

            <div class="control-group">
                <!-- First Name -->
                <label class="control-label" for="firstName">First Name</label>
                <div class="controls">
                    <input type="text" id="firstName" runat="server" name="firstName" placeholder="" class="input-xlarge" required />
                    <p class="help-block">Name can contain any letters or numbers, without spaces</p>
                </div>
            </div>

            <div class="control-group">
                <!-- Last Name -->
                <label class="control-label" for="lastName">Last Name</label>
                <div class="controls">
                    <input type="text" id="lastName" runat="server" name="lastName" placeholder="" class="input-xlarge" required />
                    <p class="help-block">Name can contain any letters or numbers, without spaces</p>
                </div>
            </div>

            <div class="control-group">
                <!-- Phone -->
                <label class="control-label" for="phone">Phone Number</label>
                <div class="controls">
                    <input type="text" id="phone" runat="server" name="phone" placeholder="" class="input-xlarge">
                    <p class="help-block">Phone can contain any dashes or numbers, without spaces</p>
                </div>
            </div>


            <div class="control-group">
                <!-- Username -->
                <label class="control-label" for="username">Username</label>
                <div class="controls">
                    <input type="text" id="username" runat="server" name="username" placeholder="" class="input-xlarge" required />
                    <p class="help-block">Username can contain any letters or numbers, without spaces</p>
                </div>
            </div>

            <div class="control-group">
                <!-- E-mail -->
                <label class="control-label" for="email">E-mail</label>
                <div class="controls">
                    <input type="text" runat="server" id="email" name="email" placeholder="" class="input-xlarge" required />
                    <p class="help-block">Please provide your E-mail</p>
                </div>
            </div>

            <div class="control-group">
                <!-- Password-->
                <label class="control-label" for="password">Password</label>
                <div class="controls">
                    <input type="password" runat="server" id="password" name="password" placeholder="" class="input-xlarge" required />
                    <p class="help-block">Password should be at least 4 characters</p>
                </div>
            </div>

            <div class="control-group">
                <!-- Password -->
                <label class="control-label" for="password_confirm">Password (Confirm)</label>
                <div class="controls">
                    <input type="password" id="password_confirm" name="password_confirm" placeholder="" class="input-xlarge" required />
                    <p class="help-block">Please confirm password</p>
                </div>
            </div>

            <div class="control-group">
                <!-- Button -->
                <div class="controls">
                    <asp:Button runat="server" OnClientClick="checkData();" OnClick="registerUser" class="btn btn-success" Text="Register" />
                </div>
            </div>
        </fieldset>
    </form>
</body>
</html>

<script type="text/javascript">

    function checkData() {

        var pass1 = document.getElementById("password").value;
        var pass2 = document.getElementById("password_confirm").value;

        if (pass1 == pass2) {
            return true;
        } else {
            alert("Passwords don't match!");
            return false;
        }
    }

</script>
