<%@ Page Title="" Language="C#" MasterPageFile="~/site/Master.Master" AutoEventWireup="true" CodeBehind="kaydol.aspx.cs" Inherits="Pizza_Bootstarp.site.kaydol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpBody" runat="server">
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
                    <span class="input-group-addon"></span>
                    <asp:TextBox ID="txtKullaniciAdi" CssClass="form-control" placeholder="Kullanıcı adı" runat="server"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon"></span>
                    <asp:TextBox ID="txtSifre" CssClass="form-control" placeholder="Şifre" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon"></span>
                    <asp:TextBox ID="txtAd" CssClass="form-control" placeholder="Ad" runat="server"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon"></span>
                    <asp:TextBox ID="txtSoyad" CssClass="form-control" placeholder="Soyad" runat="server"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon"></span>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="E-mail" runat="server" TextMode="Email"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon"></span>
                    <asp:TextBox ID="txtDt" CssClass="form-control" placeholder="Doğum Tarihi" runat="server" TextMode="DateTime"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon"></span>
                    <asp:TextBox ID="txtTelefon" CssClass="form-control" placeholder="Telefon" runat="server" TextMode="Phone"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon"></span>
                    <asp:FileUpload ID="fuResim" CssClass="form-control" runat="server" />
                </div>
                <div class="input-group">
                    <span class="input-group-addon"></span>
                    <asp:TextBox ID="txtAdres" CssClass="form-control" placeholder="Adres" Height="75" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <br />
                <div>
                    <asp:Button ID="btnKaydol" runat="server" Text="Kaydol" Height="40" Width="100%" CssClass="btn btn-success" OnClick="btnKaydol_OnClick" />
                </div>
                <hr />
            </div>
        </div>
    </div>
</asp:Content>
