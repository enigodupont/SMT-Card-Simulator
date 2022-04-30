<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="playerCard.aspx.cs" Inherits="SMTONLINE.playerCard" %>

<%@ Register TagPrefix="MYNAV" TagName="NAVBAR" Src="DynamicData/FieldTemplates/headerAndIncludes.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body class="formbody">
    <form id="form1" runat="server">
        <MYNAV:NAVBAR runat="server"></MYNAV:NAVBAR>
        <div class="container">
            <asp:ListView ID="playerCardView" DataSourceID="playerSource1" ItemPlaceholderID="itemContainer" runat="server">
                <LayoutTemplate>
                    <asp:PlaceHolder ID="itemContainer" runat="server" />
                </LayoutTemplate>
                <ItemTemplate>
                    <div style="background-color: transparent;" class="jumbotron">
                        <h1 style="color: #A20000;" class="text-center"><u id="playerName">Name: <%# Eval("name") %></u></h1>
                        <h1 style="color: #A20000;" class="text-center"><u id="neutralRank">Neutral Rank: <%# Eval("NeutRank") %></u></h1>
                    </div>
                    <ul runat="server" style="color: #A20000;" class="list-group pull-left">
                        <li class="list-group-item">Level: <%# Eval("lvl") %></li>
                        <li class="list-group-item">Race: <%# Eval("race") %></li>
                        <li class="list-group-item">HP: <%# Eval("hp") %></li>
                        <li class="list-group-item">MP: <%# Eval("mp") %></li>
                        <li class="list-group-item">STRENGTH: <%# Eval("st") %></li>
                        <li class="list-group-item">DEXTERITY: <%# Eval("dx") %></li>
                        <li class="list-group-item">MAGIC: <%# Eval("ma") %></li>
                        <li class="list-group-item">AGILITY: <%# Eval("ag") %></li>
                        <li class="list-group-item">LUCK: <%# Eval("lu") %></li>
                    </ul>
                    <asp:Image Width="250px" Height="500px" runat="server" ImageUrl="~/pictures/PlayerPictures/Nanashi.png" />
                    <div class="pull-right">
                        <h2 style="color: white;">Notes:

                        
                        </h2>

                        <textarea runat="server" rows="10" cols="100" readonly="readonly">
                            <%# Eval("notes") %>
                        </textarea>
                        <br />
                        <asp:Button runat="server" OnClick="Edit_PlayerCard" CssClass="btn btn-success" Text="Edit" />
                    </div>

                </ItemTemplate>
            </asp:ListView>
        </div>
        <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:SMTDATABASE %>"
            ProviderName="Npgsql"
            SelectCommand="SELECT * FROM Players where user_id= @ID;"
            ID="playerSource1">

            <SelectParameters>
                <asp:Parameter Name="@ID" DbType="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
