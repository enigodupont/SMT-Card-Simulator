<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="skillCatalog.aspx.cs" Inherits="SMTONLINE.skillCatalog" %>

<%@ Register TagPrefix="MYNAV" TagName="NAVBAR" Src="DynamicData/FieldTemplates/headerAndIncludes.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server" lang="en">
    <title>Skill Catalog</title>
</head>
<body class="formbody">
    <form id="form1" runat="server">
        <MYNAV:NAVBAR runat="server"></MYNAV:NAVBAR>
        <h1 style="color: #A20000;" class="text-center"><u>Skill Catalog</u></h1>

        <asp:Label ForeColor="#A20000" runat="server">Filter Name: </asp:Label>
        <asp:TextBox ID="searchQuery" AutoPostBack="false" runat="server"></asp:TextBox>
        <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="adjustSearch" />

        <hr />

        <asp:GridView AllowPaging="true" PageSize="50" runat="server" CssClass="table" Width="100%" ViewStateMode="Enabled" AutoGenerateColumns="false" DataSourceID="skillSource1" ID="skillView">

            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" BackColor="Black" ForeColor="White" />
            <RowStyle VerticalAlign="Middle" HorizontalAlign="Center" BackColor="#A20000" BorderColor="Black" ForeColor="White" />

            <Columns>
                <asp:BoundField HeaderText="Skill Name" DataField="name" />
                <asp:ImageField HeaderText="Skill Icon" DataImageUrlField="first_icon" DataImageUrlFormatString="~\pictures\SkillIcons\{0}" AlternateText=""></asp:ImageField>
                <asp:ImageField HeaderText="Skill Icon 2" DataImageUrlField="second_icon" DataImageUrlFormatString="~\pictures\SkillIcons\{0}" AlternateText=""></asp:ImageField>
                <asp:BoundField HeaderText="Skill Hits" DataField="hits" />
                <asp:BoundField HeaderText="Skill MP Cost" DataField="mp_cost" />
                <asp:BoundField HeaderText="Skill Power Level" DataField="power_lvl" />
                <asp:BoundField HeaderText="Skill Rank" DataField="skill_rank" />
                <asp:BoundField HeaderText="Smirk Effect" DataField="smirk_effect" />
                <asp:BoundField HeaderText="Skill Target" DataField="target" />
                <asp:BoundField HeaderText="Skill Unique Cost" DataField="uni_cost" />
                <asp:BoundField HeaderText="Skill Comment" DataField="comments" />
            </Columns>

            <EmptyDataTemplate>
                No Demons In The Bestiary...
            </EmptyDataTemplate>
        </asp:GridView>
    </form>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:SMTDATABASE %>"
        ProviderName="Npgsql"
        SelectCommand="SELECT * FROM Skills where name like @filterSkillName;"
        ID="skillSource1">

        <SelectParameters>
            <asp:Parameter Name="filterSkillName" DefaultValue="%" />
        </SelectParameters>
    </asp:SqlDataSource>

</body>
</html>
