<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Master.Master" AutoEventWireup="true" CodeBehind="aparat.aspx.cs" Inherits="Pizza_Bootstarp.admin.aparat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpBody" runat="server">
    <div class="col-md-6" style="margin: 10px 0 20px 5px">
        <asp:Button ID="btnYeniAparat" CssClass="btn btn-primary" runat="server" Text="Yeni Aparat Ekle" OnClick="btnYeniAparat_OnClick" />
    </div>
    <div class="clearfix"></div>
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Ad</th>
                    <th>Fiyat</th>
                    <th>Eklenme Tarihi</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpAparatlar" runat="server">
                    <ItemTemplate>
                        <tr>
                            <th scope="row">
                                <asp:Label ID="lblCount" runat="server" Text="+"></asp:Label></th>

                            <td><%# Eval("a_ad") %></td>
                            <td><%# Eval("a_fiyat") %></td>
                            <td><%# Eval("a_eklenme_tarihi") %></td>
                            <td>
                                <asp:Button ID="btnSil" runat="server" CommandArgument='<%# Eval("a_id") %>' CssClass="btn btn-danger" OnClick="btnSil_OnClick" Text="Sil" />
                                <asp:Button ID="btnDuzenle" runat="server" CssClass="btn btn-success" CommandArgument='<%# Eval("a_id") %>' Text="Düzenle" OnClick="btnDuzenle_OnClick" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>

    <!-- Modal Aparat Ekleme -->
<%--    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Yeni Aparat Ekleme</h4>
                </div>
                <div class="modal-body">
                    <div class="input-group">
                        <span class="input-group-addon">

                        </span>
                        <asp:TextBox ID="txtAd" CssClass="form-control" placeholder="Aparat adı" runat="server"></asp:TextBox>
                    </div>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon"></span>
                        <asp:TextBox ID="txtFiyat" CssClass="form-control" placeholder="Fiyat" runat="server"></asp:TextBox>
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
