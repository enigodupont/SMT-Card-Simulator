<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demonInfo.aspx.cs" Inherits="SMTONLINE.demonInfo" %>
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
        <asp:ListView ItemPlaceholderID="itemContainer" DataSourceID="detailSource1" runat="server" >
            <LayoutTemplate >
                    <asp:PlaceHolder id="itemContainer" runat="server" />
            </LayoutTemplate>
            <ItemTemplate>         
                <div style="background-color: transparent;" class="jumbotron">
                        <h1 style="color:#A20000;" class="text-center"><u id="demonName"><%# Eval("name") %></u></h1>
                </div>
                <ul runat="server" style="color:#A20000;" class="list-group pull-left">
                    <li class="list-group-item"> Level: <%# Eval("lvl") %></li>
                    <li class="list-group-item"> Race: <%# Eval("race") %></li>
                    <li class="list-group-item"> HP: <%# Eval("hp") %></li>
                    <li class="list-group-item"> MP: <%# Eval("mp") %></li>
                    <li class="list-group-item"> STRENGTH: <%# Eval("st") %></li>
                    <li class="list-group-item"> DEXTERITY: <%# Eval("dx") %></li>
                    <li class="list-group-item"> MAGIC: <%# Eval("ma") %></li>
                    <li class="list-group-item"> AGILITY: <%# Eval("ag") %></li>
                    <li class="list-group-item"> LUCK: <%# Eval("lu") %></li>
                </ul>

                <asp:Image runat="server" ImageUrl="<%# curDemonPicURL %>" />


                <div style="color:#A20000;" class="pull-right">
                    <table class="table table-bordered table-responsive" style="background-color:#fff">
                        <thead>
                            <th colspan="3" class="text-center"><u>Affinities</u></th>
                        </thead>
                        <tr>
                            <td>Ailments: <%# Eval("ailment") %></td>
                            <td>Almighty: <%# Eval("almighty") %></td>
                            <td>Auxilary: <%# Eval("auxilary") %></td>
                        </tr>
                        <tr>
                            <td>Dark: <%# Eval("dark") %></td>
                            <td>Electricity: <%# Eval("elec") %></td>
                            <td>Fire: <%# Eval("fire") %></td>
                        </tr>
                        <tr>
                            <td>Force: <%# Eval("theforce") %></td>
                            <td>Gun: <%# Eval("gun") %></td>
                            <td>Ice: <%# Eval("ice") %></td>
                        </tr>
                        <tr>
                            <td>Light: <%# Eval("light") %></td>
                            <td>Physical: <%# Eval("phys") %></td>
                            <td>Recovery: <%# Eval("recovery") %></td>
                        </tr>
                    </table>

                    <table class="table table-bordered table-responsive" style="background-color:#fff">
                        <thead>
                            <th colspan="4" class="text-center"><u>Resistances</u></th>
                        </thead>
                        <tr>
                            <td>Dark: <%# Eval("dark1") %></td>
                            <td>Electricity: <%# Eval("elec1") %></td>
                            <td>Fire: <%# Eval("fire1") %></td>
                            <td>Force: <%# Eval("theforce1") %></td>
                        </tr>
                        <tr>
                            <td>Gun: <%# Eval("gun1") %></td>
                            <td>Ice: <%# Eval("ice1") %></td>
                            <td>Light: <%# Eval("light1") %></td>
                            <td>Physical: <%# Eval("phys1") %></td>
                        </tr>
                    </table>
                </div>  
             
            </ItemTemplate>
        </asp:ListView>

    </div>
        <h1 style="color:#A20000;" class="text-center">Demon Skills</h1>

        <asp:GridView runat="server" CssClass="table" Width="100%" ViewStateMode="Enabled" DataSourceID="demonSkillsSource1" AutoGenerateColumns="false">

            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" BackColor="Black" ForeColor="White" />
            <RowStyle VerticalAlign="Middle" HorizontalAlign="Center" BackColor="#A20000" BorderColor="Black" ForeColor="White" />
            
            <Columns>
                <asp:BoundField HeaderText="Skill Level" DataField="skill_lvl" />
                <asp:BoundField HeaderText="Skill Name" DataField="name" />
                <asp:ImageField HeaderText="Skill Icon" DataImageUrlField="first_icon" DataImageUrlFormatString="~\pictures\SkillIcons\{0}" AlternateText=""></asp:ImageField>
                <asp:ImageField HeaderText="Skill Icon 2" DataImageUrlField="second_icon"  DataImageUrlFormatString="~\pictures\SkillIcons\{0}" AlternateText=""></asp:ImageField>
                <asp:BoundField HeaderText="Skill Hits" DataField="hits" />
                <asp:BoundField HeaderText="Skill MP Cost" DataField="mp_cost" />
                <asp:BoundField HeaderText="Skill Power Level" DataField="power_lvl" />
                <asp:BoundField HeaderText="Skill Rank" DataField="skill_rank" />
                <asp:BoundField HeaderText="Smirk Effect" DataField="smirk_effect" />
                <asp:BoundField HeaderText="Skill Target" DataField="target" />
                <asp:BoundField HeaderText="Skill Unique Cost" DataField="uni_cost" />
                <asp:BoundField HeaderText="Skill Comment" DataField="comments" />
            </Columns>
        </asp:GridView>
    </form>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:SMTDATABASE %>" 
        ProviderName="Npgsql"
        SelectCommand="SELECT * FROM (Demons NATURAL JOIN Affinities) JOIN Resistances using (demon_id) WHERE Demons.name like @filterDemon;"
        ID="detailSource1">
        
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="demon" DefaultValue="Black Frost" Name="filterDemon"  />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:SMTDATABASE %>" 
        ProviderName="Npgsql"
        SelectCommand="select * from Demon_Skills join Skills using (skill_id) where demon_id = (select demon_id from Demons where name = @filterDemon) order by skill_lvl asc;"
        ID="demonSkillsSource1">
        
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="demon" DefaultValue="Black Frost" Name="filterDemon"  />
        </SelectParameters>
    </asp:SqlDataSource>
</body>
</html>

<script>
/*
    var demonName = document.getElementById("demonName");

    function setPicture(imgSrc) {
        if(imgSrc != "") document.getElementById("demonPic").src = imgSrc;
        console.log(imgSrc);
    }

    var request = new XMLHttpRequest();



    request.open('GET', "http://megamitensei.wikia.com/wiki/" + demonName, true);

    request.onload = function (e) {

        var htmlToParse = request.response;
        var imgSrc = htmlToParse.match("<img src=\"(https://.*)\".*alt.*class=\".*thumbimage.*\"");
        setPicture(imgSrc[1]);
    };

    request.send(null);
*/
</script>
