<%@ Control Language="C#" CodeBehind="headerAndIncludes.ascx.cs" Inherits="SMTONLINE.DynamicData.FieldTemplates.headerAndIncludes" %>

<asp:Literal runat="server" ID="Literal1" />

<!-- This is for Jquery-->

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- This is for Bootstrap-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link runat="server" type="text/css" rel="stylesheet" href="/css/myStyle1.css" />

<script async defer data-website-id="59a18e58-f446-4938-bf7f-15e6cb74908f" src="https://umami.eniworks.net/umami.js"></script>
<div id="header">
    <div id="banner">

    </div>
    <nav class="navbar navbar-dark navbar-expand-lg">

        <a class="navbar-brand" href="Default.aspx">SMT Online</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapseNavBar" aria-controls="collapseNavBar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
            <div class="collapse navbar-collapse" id="collapseNavBar">
                <ul class="mr-auto navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="demonBestiary.aspx">Demon Bestiary</a></li>
                    <li class="nav-item"><a class="nav-link" href="skillCatalog.aspx">Skill Catalog</a></li>
                    <% if (HttpContext.Current.Session["loggedIn"] != null && (bool) HttpContext.Current.Session["loggedIn"] == true){%>
                    <li class="nav-item"><a class="nav-link" href="playerCard.aspx">Player Card</a></li>
                    <li id="playerDemonLink" class="nav-item"><a class="nav-link" href="#">Player Demon's</a></li>
                    <li class="nav-item"><asp:LinkButton CssClass="nav-link" ID="logOutButton" Text="LogOut" PostBackUrl="~/loggedOut.aspx" runat="server"></asp:LinkButton></li>
                    <%} else { %>
                    <li class="nav-item dropdown" id="LogInItem">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown" role="button" aria-expanded="false">Log In<span class="caret"></span></a>
                        <ul class="dropdown-menu" style="width:250px;" role="menu">
                            <li class="dropdown-item">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input id="usernameField" runat="server" type="text" class="form-control" name="username" value="" placeholder="User Name">
                                </div>

                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input id="passwordField" runat="server" type="password" class="form-control" name="password" value="" placeholder="Password">
                                </div>

                                <asp:button type="submit" runat="server" OnClick="verifyLogin" Text="Sign In" CssClass="btn btn-primary" />
                                <asp:button type="button"  runat="server"  CssClass="btn btn-primary" Text="Sign Up" PostBackUrl="~/signUp.aspx" />
                            </li>
                        </ul>
                    </li>
                    <%} %>
                    <li class="nav-item"><a  class="nav-link" href="aboutUs.aspx">About Us</a></li>
                </ul>
            </div>
</nav>
    

</div>
