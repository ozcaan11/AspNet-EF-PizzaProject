<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Master.Master" AutoEventWireup="true" CodeBehind="menuekle.aspx.cs" Inherits="Pizza_Bootstarp.admin.menuekle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpBody" runat="server">
    <div class="col-sm-6">
        <div class="input-group">
            <span class="input-group-addon">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtBaslik" runat="server" BackColor="red" ErrorMessage="&nbsp;&nbsp;&nbsp;&nbsp;"></asp:RequiredFieldValidator>
            </span>
            <asp:TextBox ID="txtBaslik" class="form-control" placeholder="Başlık" runat="server"></asp:TextBox>
        </div>
        <br />
        <div class="input-group">
            <span class="input-group-addon">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtAciklama" runat="server" BackColor="red" ErrorMessage="&nbsp;&nbsp;&nbsp;&nbsp;"></asp:RequiredFieldValidator>
            </span>
            <asp:TextBox ID="txtAciklama" class="form-control" placeholder="Açıklama" TextMode="MultiLine" Height="150" runat="server"></asp:TextBox>
        </div>
        <br />
        <div class="input-group">
            <span class="input-group-addon">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtFiyat" runat="server" BackColor="red" ErrorMessage="&nbsp;&nbsp;&nbsp;&nbsp;"></asp:RequiredFieldValidator>
            </span>
            <asp:TextBox ID="txtFiyat" class="form-control" placeholder="Fiyat" runat="server"></asp:TextBox>
        </div>
        <br />
        <div class="input-group">
            <span class="input-group-addon">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="fuResim" runat="server" BackColor="red" ErrorMessage="&nbsp;&nbsp;&nbsp;&nbsp;"></asp:RequiredFieldValidator>
            </span><span class="input-group-addon">Resim &nbsp;&nbsp;</span>
            <asp:FileUpload ID="fuResim" CssClass="form-control" runat="server" />
        </div>
        <br />
        <div class="input-group">
            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="input-group-addon"> Kategori </span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownListKategori" CssClass="btn btn-info dropdown-toggle" runat="server"></asp:DropDownList>
        </div>
        <hr />
        <div>
            <asp:Button runat="server" Text="Ekle" CssClass="btn btn-success" Width="100%" ID="btnEkle" OnClick="btnEkle_OnClick" />
        </div>
        <br />
    </div>
</asp:Content>
