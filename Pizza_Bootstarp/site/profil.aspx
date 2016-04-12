<%@ Page Title="" Language="C#" MasterPageFile="~/site/Master.Master" AutoEventWireup="true" CodeBehind="profil.aspx.cs" Inherits="Pizza_Bootstarp.site.profil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpBody" runat="server">
    <div class="row">
        <div class="col-sm-6">
            <table class="table">
                <caption style="color: #FF0000">Sadece kullanıcı adı ve şifrenizi değiştirebilirsiniz.</caption>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Üye Bilgileri</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="rpUye">
                        <ItemTemplate>
                            <tr>
                                <th scope="row">Kullanıcı Adı</th>
                                <td><%# Eval("u_kullanici_adi") %></td>
                            </tr>
                            <tr>
                                <th scope="row">Şifre</th>
                                <td><%# Eval("u_sifre") %></td>
                            </tr>
                            <tr>
                                <th scope="row">Ad</th>
                                <td><%# Eval("u_ad") %></td>
                            </tr>
                            <tr>
                                <th scope="row">Soyad</th>
                                <td><%# Eval("u_soyad") %></td>
                            </tr>
                            <tr>
                                <th scope="row">E-mail</th>
                                <td><%# Eval("u_email") %></td>
                            </tr>
                            <tr>
                                <th scope="row">Telefon</th>
                                <td><%# Eval("u_telefon") %></td>
                            </tr>
                            <tr>
                                <th scope="row">Doğum Tarihi</th>
                                <td><%# Eval("u_dogum_tarihi") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
            <div style="margin-bottom: 25px">
                <asp:Button ID="btnGuncelle" CssClass="btn btn-primary" Width="100%" runat="server" Text="Güncelle" OnClick="btnGuncelle_OnClick" />
            </div>
            <hr />
        </div>
    </div>
</asp:Content>
