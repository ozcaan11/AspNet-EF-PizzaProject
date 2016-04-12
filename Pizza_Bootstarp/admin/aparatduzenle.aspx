<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Master.Master" AutoEventWireup="true" CodeBehind="aparatduzenle.aspx.cs" Inherits="Pizza_Bootstarp.admin.aparatduzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpBody" runat="server">
    <div class="col-sm-6">
        <br />
        <br />
        <br />
        <div class="input-group">
            <span class="input-group-addon"></span>
            <asp:TextBox ID="txtAd" class="form-control" placeholder="Aparat adı" runat="server"></asp:TextBox>
        </div>
        <div class="input-group">
            <span class="input-group-addon"></span>
            <asp:TextBox ID="txtFiyat" class="form-control" placeholder="Fiyat" runat="server"></asp:TextBox>
        </div>
        <hr />
        <div>
            <asp:Button runat="server" Text="Kaydet" CssClass="btn btn-success" Width="100%" ID="btnKaydet" OnClick="btnKaydet_OnClick" />
        </div>
    </div>
</asp:Content>
