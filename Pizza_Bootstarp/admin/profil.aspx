<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Master.Master" AutoEventWireup="true" CodeBehind="profil.aspx.cs" Inherits="Pizza_Bootstarp.admin.profil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpBody" runat="server">
    <div class="col-sm-6">
        <table class="table">
            <caption style="color: #FF0000">Sadece kullanıcı adı ve şifrenizi değiştirebilirsiniz.</caption>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Admin Bilgileri</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater runat="server" ID="rpAdmin">
                    <ItemTemplate>
                        <tr>
                            <th scope="row">Kullanıcı Adı</th>
                            <td><%# Eval("ad_kullanici_adi") %></td>
                        </tr>
                        <tr>
                            <th scope="row">Şifre</th>
                            <td><%# Eval("ad_sifre") %></td>
                        </tr>
                        <tr>
                            <th scope="row">Ad</th>
                            <td><%# Eval("ad_adi") %></td>
                        </tr>
                        <tr>
                            <th scope="row">Soyad</th>
                            <td><%# Eval("ad_soyad") %></td>
                        </tr>
                        <tr>
                            <th scope="row">E-mail</th>
                            <td><%# Eval("ad_email") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
        <div style="margin-bottom: 25px">
            <asp:Button ID="btnGuncelle" CssClass="btn btn-primary" Width="100%" runat="server" Text="Güncelle" OnClick="btnGuncelle_OnClick"/>
        </div>
        <hr />
    </div>
</asp:Content>
