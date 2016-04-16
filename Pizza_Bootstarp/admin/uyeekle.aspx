<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Master.Master" AutoEventWireup="true" CodeBehind="uyeekle.aspx.cs" Inherits="Pizza_Bootstarp.admin.uyeekle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpBody" runat="server">
    <div class="container" role="main">
        <div class="row">
            <hr />
            <div class="col-sm-6">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="ViewFail" runat="server">
                        <div class="alert alert-danger" role="alert">
                            <p>
                                Kullanıcı adı zaten kullanılmaktadır. Farklı bir kullanıcı adı deneyin.
                            </p>
                        </div>
                    </asp:View>
                </asp:MultiView>
                <div class="input-group">
                    <span class="input-group-addon">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator0" ControlToValidate="txtKullaniciAdi" runat="server" BackColor="red" ErrorMessage="&nbsp;&nbsp;&nbsp;&nbsp;"></asp:RequiredFieldValidator>
                    </span>
                    <asp:TextBox ID="txtKullaniciAdi" CssClass="form-control" placeholder="Kullanıcı adı ( min: 3 karakter)" runat="server"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtSifre" runat="server" BackColor="red" ErrorMessage="&nbsp;&nbsp;&nbsp;&nbsp;"></asp:RequiredFieldValidator>
                    </span>
                    <asp:TextBox ID="txtSifre" CssClass="form-control" placeholder="Şifre" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtAd" runat="server" BackColor="red" ErrorMessage="&nbsp;&nbsp;&nbsp;&nbsp;"></asp:RequiredFieldValidator>
                    </span>
                    <asp:TextBox ID="txtAd" CssClass="form-control" placeholder="Ad" runat="server"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtSoyad" runat="server" BackColor="red" ErrorMessage="&nbsp;&nbsp;&nbsp;&nbsp;"></asp:RequiredFieldValidator>
                    </span>
                    <asp:TextBox ID="txtSoyad" CssClass="form-control" placeholder="Soyad" runat="server"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtEmail" runat="server" BackColor="red" ErrorMessage="&nbsp;&nbsp;&nbsp;&nbsp;"></asp:RequiredFieldValidator>
                    </span>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="E-mail" runat="server" TextMode="Email"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtDt" runat="server" BackColor="red" ErrorMessage="&nbsp;&nbsp;&nbsp;&nbsp;"></asp:RequiredFieldValidator>
                    </span>
                    <asp:TextBox ID="txtDt" CssClass="form-control" placeholder="Doğum Tarihi" runat="server" TextMode="DateTime"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <asp:TextBox ID="txtTelefon" CssClass="form-control" placeholder="Telefon" runat="server" TextMode="Phone"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <asp:FileUpload ID="fuResim" CssClass="form-control" runat="server" />
                </div>
                <div class="input-group">
                    <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <asp:TextBox ID="txtAdres" CssClass="form-control" placeholder="Adres" Height="75" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <br />
                <div>
                    <asp:Button ID="btnEkle" runat="server" Text="Ekle" Height="40" Width="100%" CssClass="btn btn-success" OnClick="btnEkle_OnClick" />
                </div>
                <hr />
            </div>
        </div>
    </div>
</asp:Content>
