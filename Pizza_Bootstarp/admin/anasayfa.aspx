<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Master.Master" AutoEventWireup="true" CodeBehind="anasayfa.aspx.cs" Inherits="Pizza_Bootstarp.admin.anasayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpBody" runat="server">
    <div class="row">
        <div class="col-sm-4 col-md-2">
            <a href="menu.aspx">
            <img src="image/Menu.png" /></a>
        </div>
        <hr />
        <div class="col-sm-4 col-md-2">
            <a href="kategori.aspx">
            <img src="image/Kategori.png" /></a>
        </div>
        <hr />
        <div class="col-sm-4 col-md-2">
            <a href="aparat.aspx">
            <img src="image/Aparat.png" /></a>
        </div>
        <hr />
        <div class="col-sm-4 col-md-2">
            <a href="uye.aspx">
            <img src="image/Uye.png" /></a>
        </div>
        <hr />
        <div class="col-sm-4 col-md-2">
            <a href="yorum.aspx">
            <img src="image/Yorum.png" /></a>
        </div>
        <hr />
    </div>
    <br />
    <br />
    <hr />
</asp:Content>
