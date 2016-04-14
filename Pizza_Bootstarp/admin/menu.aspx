<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Master.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="Pizza_Bootstarp.admin.menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpBody" runat="server">
    <div class="col-md-6" style="margin: 10px 0 20px 5px">
        <asp:Button ID="btnYeniMenu" CssClass="btn btn-primary" runat="server" Text="Yeni Menü Ekle" data-toggle="modal" data-target="#myModal" OnClientClick="javascript:return false;" />
    </div>
    <div class="clearfix"></div>
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Başlık</th>
                    <th>Açıklama</th>
                    <th>Fiyat</th>
                    <th>EklenmeTarihi</th>
                    <th>Kategori</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpMenuler" OnItemDataBound="rpMenuler_OnItemDataBound" runat="server">
                    <ItemTemplate>
                        <tr>
                            <th scope="row">
                                <asp:Label ID="lblCount" runat="server" Text="+"></asp:Label></th>

                            <td><%# Eval("m_baslik") %></td>
                            <td><%# Eval("m_aciklama").ToString().Length >= 30 ? Eval("m_aciklama").ToString().Substring(0,30)+" ..." : Eval("m_aciklama") %></td>
                            <td><%# Eval("m_fiyat") %></td>
                            <td><%# Eval("m_eklenme_tarihi") %></td>
                            <td>
                                <asp:Button ID="btn_kat" runat="server" Visible="False" CommandArgument='<%# Eval("k_id") %>' Text="Button" />
                                <asp:Label ID="lbl_kat" runat="server" Text=""></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="btnSil" runat="server" OnClick="btnSil_OnClick" CommandArgument='<%# Eval("m_id") %>' CssClass="btn btn-danger" Text="Sil" />
                                <asp:Button ID="btnDuzenle" runat="server" CssClass="btn btn-success" CommandArgument='<%# Eval("m_id") %>' Text="Düzenle" OnClick="btnDuzenle_OnClick" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>

    <!-- Modal Menu Ekleme -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Yeni Kategori Ekle</h4>
                </div>
                <div class="modal-body">
                    <div class="input-group">
                        <span class="input-group-addon"></span>
                        <asp:TextBox ID="txtBaslik" class="form-control" placeholder="Başlık" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"></span>
                        <asp:TextBox ID="txtAciklama" class="form-control" placeholder="Açıklama" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"></span>
                        <asp:TextBox ID="txtFiyat" class="form-control" placeholder="Fiyat" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"></span>
                        <asp:FileUpload ID="fuResim" CssClass="form-control" runat="server" />
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">Kategori</span>
                        <asp:DropDownList ID="DropDownListKategori" CssClass="btn btn-info dropdown-toggle" runat="server"></asp:DropDownList>
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
