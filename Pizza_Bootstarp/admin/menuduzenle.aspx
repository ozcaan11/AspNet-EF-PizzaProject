<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Master.Master" AutoEventWireup="true" CodeBehind="menuduzenle.aspx.cs" Inherits="Pizza_Bootstarp.admin.menuduzenle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpBody" runat="server">
    <div class="col-sm-6">
        <div class="input-group">
            <span class="input-group-addon"></span>
            <asp:TextBox ID="txtBaslik" class="form-control" placeholder="Başlık" runat="server"></asp:TextBox>
        </div>
        <div class="input-group">
            <span class="input-group-addon"></span>
            <asp:TextBox ID="txtAciklama" class="form-control" placeholder="Açıklama" TextMode="MultiLine" runat="server"></asp:TextBox>
        </div>
        <div class="input-group">
            <span class="input-group-addon"></span>
            <asp:TextBox ID="txtFiyat" class="form-control" placeholder="Fiyat" runat="server"></asp:TextBox>
        </div>
        <div class="input-group">
            <span class="input-group-addon"></span>
            <asp:TextBox ID="txtResim" class="form-control" placeholder="Resim" runat="server"></asp:TextBox>
        </div>
        <div class="input-group">
            <span class="input-group-addon">Kategori</span>  
            <asp:DropDownList ID="DropDownListKategori" CssClass="btn btn-info dropdown-toggle" runat="server" ></asp:DropDownList>
        </div>
        <hr />
        <div>
            <asp:Button runat="server" Text="Düzenle" CssClass="btn btn-success" Width="100%" ID="btnDuzenle" OnClick="btnDuzenle_OnClick"/>
        </div>
        <br />
    </div>
</asp:Content>
