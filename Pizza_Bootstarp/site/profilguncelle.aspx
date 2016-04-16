<%@ Page Title="" Language="C#" MasterPageFile="~/site/Master.Master" AutoEventWireup="true" CodeBehind="profilguncelle.aspx.cs" Inherits="Pizza_Bootstarp.site.profilguncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpBody" runat="server">
    <div class="row">
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
            <br />
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
            <div style="margin: 15px 0 30px 0; text-align: left">
                <asp:Button ID="btnGuncelle" runat="server" Text="Güncelle" Height="40" Width="100%" CssClass="btn btn-success" OnClick="btnGuncelle_OnClick" />
            </div>
            <hr />
        </div>
    </div>
</asp:Content>
