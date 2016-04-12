<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Master.Master" AutoEventWireup="true" CodeBehind="uye.aspx.cs" Inherits="Pizza_Bootstarp.admin.uye" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpBody" runat="server">

    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="ViewFail" runat="server">
            <div class="alert alert-danger" role="alert">
                <p>
                    Kullanıcı adı zaten kullanılmaktadır. Farklı bir kullanıcı adı deneyin.
                </p>
            </div>
        </asp:View>
    </asp:MultiView>
    <div class="col-md-6" style="margin: 10px 0 20px 5px">
        <asp:Button ID="btnYeniUye" data-toggle="modal" data-target="#myModal" OnClientClick="javascript:return false;" CssClass="btn btn-primary" runat="server" Text="Yeni Üye Ekle" />
    </div>
    <div class="clearfix"></div>
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Kullanıcı Adı</th>
                    <th>Ad Soyad</th>
                    <th>Email</th>
                    <th>Telefon</th>
                    <th>Kayıt Tarihi</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpUyeler" runat="server">
                    <ItemTemplate>
                        <tr>
                            <th scope="row">
                                <asp:Label ID="lblCount" runat="server" Text=""></asp:Label></th>
                            <td><%# Eval("u_kullanici_adi") %></td>
                            <td><%# Eval("u_ad") %> <%# Eval("u_soyad") %></td>
                            <td><%# Eval("u_email") %></td>
                            <td><%# Eval("u_telefon") %></td>
                            <td><%# Eval("u_kayit_tarihi") %></td>
                            <td>
                                <asp:Button ID="btnSil" runat="server" CommandArgument='<%# Eval("u_kullanici_adi") %>' OnClick="btnSil_OnClick" CssClass="btn btn-danger" Text="Sil" />
                                <%--<asp:Button ID="btnDuzenle" runat="server" CommandArgument='<%# Eval("u_kullanici_adi") %>' OnClick="btnDuzenle_OnClick" CssClass="btn btn-success" Text="Düzenle" />--%></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>

    <!-- Modal Ekleme -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Yeni Üye Ekle</h4>
                </div>
                <div class="modal-body">
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
                        <asp:TextBox ID="txtResim" CssClass="form-control" placeholder="Resim" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"></span>
                        <asp:TextBox ID="txtAdres" CssClass="form-control" placeholder="Adres" Height="75" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
                    <asp:Button ID="btnEkle" CssClass="btn btn-primary" runat="server" Text="Ekle" OnClick="btnEkle_OnClick" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
