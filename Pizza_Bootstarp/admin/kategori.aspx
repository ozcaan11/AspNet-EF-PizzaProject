<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Master.Master" AutoEventWireup="true" CodeBehind="kategori.aspx.cs" Inherits="Pizza_Bootstarp.admin.kategori" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpBody" runat="server">
    <div class="col-md-6" style="margin: 10px 0 20px 5px">
        <asp:Button ID="btnYeniKategori" CssClass="btn btn-primary" runat="server" Text="Yeni Kategori Ekle" OnClick="btnYeniKategori_OnClick" />
    </div>
    <div class="clearfix"></div>
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Ad</th>
                    <th>EklenmeTarihi</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpKategoriler" runat="server">
                    <ItemTemplate>
                        <tr>
                            <th scope="row">
                                <asp:Label ID="lblCount" runat="server" Text="+"></asp:Label></th>

                            <td><%# Eval("k_ad").ToString().Length >=30 ? Eval("k_ad").ToString().Substring(0,30)+" ..." : Eval("k_ad").ToString() %></td>
                            <td><%# Eval("k_eklenme_tarihi") %></td>
                            <td>
                                <asp:Button ID="btnSil" runat="server" OnClick="btnSil_OnClick" CommandArgument='<%# Eval("k_id") %>' CssClass="btn btn-danger" Text="Sil" />
                                <asp:Button ID="btnDuzenle" runat="server" CssClass="btn btn-success" CommandArgument='<%# Eval("k_id") %>' Text="Düzenle" OnClick="btnDuzenle_OnClick" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>

    <!-- Modal Kategori Ekleme -->
<%--    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Yeni Kategori Ekle</h4>
                </div>
                <div class="modal-body">
                    <div class="input-group">
                    <span class="input-group-addon">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator0" ControlToValidate="txtAd" runat="server" BackColor="red" ErrorMessage="&nbsp;&nbsp;&nbsp;&nbsp;"></asp:RequiredFieldValidator>
                    </span>
                        <asp:TextBox ID="txtAd" CssClass="form-control" placeholder="Kategori adı" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
                    <asp:Button ID="btnEkle" CssClass="btn btn-primary" runat="server" Text="Ekle" OnClick="btnEkle_OnClick" />
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>
