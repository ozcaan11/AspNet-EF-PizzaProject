<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Master.Master" AutoEventWireup="true" CodeBehind="kategoriduzenle.aspx.cs" Inherits="Pizza_Bootstarp.admin.kategoriduzenle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpBody" runat="server">
    <div class="col-sm-6">
        <br />
        <br />
        <br />
        <div class="input-group">
                    <span class="input-group-addon">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator0" ControlToValidate="txtAd" runat="server" BackColor="red" ErrorMessage="&nbsp;&nbsp;&nbsp;&nbsp;"></asp:RequiredFieldValidator>
                    </span>
            <asp:TextBox ID="txtAd" class="form-control" placeholder="Kategori adı" runat="server"></asp:TextBox>
        </div>
        <hr />
        <div>
            <asp:Button runat="server" Text="Kaydet" CssClass="btn btn-success" Width="100%" ID="btnKaydet" OnClick="btnKaydet_OnClick"/>
        </div>
    </div>
</asp:Content>
