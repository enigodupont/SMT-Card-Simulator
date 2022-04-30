<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demonBestiary.aspx.cs" Inherits="SMTONLINE.demonBestiary" %>
<%@ Register TagPrefix="MYNAV" TagName="NAVBAR" Src="./DynamicData/FieldTemplates/headerAndIncludes.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server" lang="en">
    <title>Demonic Bestiary</title>
</head>
<body class="formbody">
    <form id="form1" runat="server">
        <MYNAV:NAVBAR runat="server"></MYNAV:NAVBAR>
        <h1 style="color:#A20000;" class="text-center"><u>Demon Bestiary</u></h1>
        <asp:Label ForeColor="#A20000" runat="server">Filter Race: </asp:Label>
        <asp:DropDownList ID="raceControl" AppendDataBoundItems="true" AutoPostBack="true" DataValueField="race" runat="server" DataSourceID="raceSource1">
             <asp:ListItem Selected="true" Text="All" Enabled="true" Value="%"></asp:ListItem>
        </asp:DropDownList>
        <asp:Label ForeColor="#A20000" runat="server">Filter Min Level: </asp:Label>
        <asp:DropDownList ID="minLevelControl" AutoPostBack="true" runat="server">
            <asp:ListItem Selected="true" Text="None" Value="0" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="10" Value="10" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="20" Value="20" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="30" Value="30" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="40" Value="40" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="50" Value="50" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="60" Value="60" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="70" Value="70" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="80" Value="80" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="90" Value="90" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="100" Value="100" Enabled="true"></asp:ListItem>
        </asp:DropDownList>
        <asp:Label ForeColor="#A20000" runat="server">Filter Max Level: </asp:Label>
        <asp:DropDownList ID="maxLevelControl" AutoPostBack="true" runat="server">
            <asp:ListItem Selected="true" Text="None" Value="999" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="10" Value="10" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="20" Value="20" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="30" Value="30" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="40" Value="40" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="50" Value="50" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="60" Value="60" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="70" Value="70" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="80" Value="80" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="90" Value="90" Enabled="true"></asp:ListItem>
            <asp:ListItem Selected="false" Text="100" Value="100" Enabled="true"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ForeColor="#A20000" runat="server">Filter Name: </asp:Label>
        <asp:TextBox ID="searchQuery" AutoPostBack="false" runat="server"></asp:TextBox>
        <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="adjustSearch"/>

        <hr />

        <asp:GridView AllowPaging="true" PageSize="50" runat="server" CssClass="table" Width="100%" ViewStateMode="Enabled" AutoGenerateColumns="false" DataSourceID="bestiarySource1" ID="demonicView">
            
            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" BackColor="Black" ForeColor="White" />
            <RowStyle VerticalAlign="Middle" HorizontalAlign="Center" BackColor="#A20000" BorderColor="Black" ForeColor="White" />
            
            <Columns>
                <asp:BoundField DataField="race" HeaderText="Race"/>
                <asp:BoundField DataField="lvl" HeaderText="Level"/>
                <asp:TemplateField HeaderStyle-CssClass="center-text" HeaderText="Name">
                    <ItemTemplate>
                        <button style="color:black" class="center-text" onclick="openDemonInfo(this);"><%# Eval("name") %></button>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="hp" HeaderText="HP"/>
                <asp:BoundField DataField="mp" HeaderText="MP"/>
                <asp:BoundField DataField="st" HeaderText="ST"/>
                <asp:BoundField DataField="dx" HeaderText="DX"/>
                <asp:BoundField DataField="ma" HeaderText="MG"/>
                <asp:BoundField DataField="ag" HeaderText="AG"/>
                <asp:BoundField DataField="lu" HeaderText="LU"/>
            </Columns>
            <EmptyDataTemplate>
                No Demons In The Bestiary...
            </EmptyDataTemplate>
        </asp:GridView>
    </form>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:SMTDATABASE %>" 
        ProviderName="Npgsql"
        SelectCommand="SELECT * FROM Demons WHERE race like @filterRace and lvl >= @filterMinLevel and lvl <= @filterMaxLevel and name like @filterDemonName order by lvl asc;"
        ID="bestiarySource1">
        
        <SelectParameters>
            <asp:ControlParameter Name="filterRace" ControlID="raceControl" DefaultValue ="%" />
            <asp:ControlParameter Name="filterMinLevel" Type="Int32" ControlID="minLevelControl" DefaultValue ="%" />
            <asp:ControlParameter Name="filterMaxLevel" Type="Int32" ControlID="maxLevelControl" DefaultValue ="%" />  
            <asp:Parameter Name="filterDemonName" DefaultValue="%" />     
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:SMTDATABASE %>"
        ProviderName="Npgsql"
        SelectCommand="SELECT distinct race FROM Demons order by race asc;"
        ID="raceSource1">
    </asp:SqlDataSource>
    <script>

        function openDemonInfo(e) {
            window.open("./demonInfo.aspx?demon=" + e.innerText,"_blank");
        }
    </script>
</body>
</html>
