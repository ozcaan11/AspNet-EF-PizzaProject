<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Master.Master" AutoEventWireup="true" CodeBehind="yorum.aspx.cs" Inherits="Pizza_Bootstarp.admin.yorum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpBody" runat="server">
    <div class="col-md-6" style="margin: 10px 0 20px 5px">
    </div>
    <div class="clearfix"></div>
    <h3>Onaylanmış Yorumlar</h3>
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>#</th>
                    <th>İçerik</th>
                    <th>Eklenme Tarihi</th>
                    <th>Uye Adı</th>
                    <th>Menü</th>
                    <th>Onay durumu</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpOnayliYorumlar" OnItemDataBound="rpOnayliYorumlar_OnItemDataBound" runat="server">
                    <ItemTemplate>
                        <tr>
                            <th scope="row">
                                <asp:Label ID="lblCount" runat="server" Text="+"></asp:Label></th>

                            <td><%# Eval("y_icerik").ToString().Length >=30 ? Eval("y_icerik").ToString().Substring(0,30)+" ..." : Eval("y_icerik") %></td>
                            <td><%# Eval("y_yapma_tarihi") %></td>
                            <td>
                                <asp:Button ID="btn_uye" runat="server" Text="Button" Visible="False" CommandArgument='<%# Eval("u_id") %>' />
                                <asp:Label ID="lbl_uye" runat="server" Text=""></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="btn_menu" runat="server" Text="Button" Visible="False" CommandArgument='<%# Eval("m_id") %>' />
                                <asp:Label ID="lbl_menu" runat="server" Text=""></asp:Label>
                            </td>
                            <td>
                                <img src="image/ok.png" />
                            </td>
                            <td>
                                <asp:Button ID="btnSil" runat="server" OnClick="btnSil_OnClick" CommandArgument='<%# Eval("y_id") %>' CssClass="btn btn-danger" Text="Sil" Width="50" />
                                <asp:Button ID="btnOnayKaldir" runat="server" OnClick="btnOnayKaldir_OnClick" CommandArgument='<%# Eval("y_id") %>' CssClass="btn btn-warning" Text="Onay kaldır" Width="90" />
                                <asp:Button ID="btnGoruntule" runat="server" OnClick="btnGoruntule_OnClick" CommandArgument='<%# Eval("y_id") %>' CssClass="btn btn-info" Text="Görüntüle" Width="90" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
    <hr />
    <div class="clearfix"></div>
    <h3>Onaylanmamış Yorumlar</h3>
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>#</th>
                    <th>İçerik</th>
                    <th>Eklenme Tarihi</th>
                    <th>Uye Adı</th>
                    <th>Menü</th>
                    <th>Onay Durumu</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpOnaysizYorumlar" OnItemDataBound="rpOnaysizYorumlar_OnItemDataBound" runat="server">
                    <ItemTemplate>
                        <tr>
                            <th scope="row">
                                <asp:Label ID="lblCount" runat="server" Text="+"></asp:Label></th>

                            <td><%# Eval("y_icerik").ToString().Length >=30 ? Eval("y_icerik").ToString().Substring(0,30)+" ..." : Eval("y_icerik") %></td>
                            <td><%# Eval("y_yapma_tarihi") %></td>
                            <td>
                                <asp:Button ID="btn_uye" runat="server" Text="Button" Visible="False" CommandArgument='<%# Eval("u_id") %>' />
                                <asp:Label ID="lbl_uye" runat="server" Text=""></asp:Label></td>
                            <td>
                                <asp:Button ID="btn_menu" runat="server" Text="Button" Visible="False" CommandArgument='<%# Eval("m_id") %>' />
                                <asp:Label ID="lbl_menu" runat="server" Text=""></asp:Label></td>
                            <td>
                                <img src="image/no.png" />
                            </td>
                            <td>
                                <asp:Button ID="btnSil" runat="server" OnClick="btnSil_OnClick" CommandArgument='<%# Eval("y_id") %>' CssClass="btn btn-danger" Text="Sil" Width="50" />
                                <asp:Button ID="btnYorumOnayla" runat="server" CommandArgument='<%# Eval("y_id") %>' CssClass="btn btn-success" Text="Onayla" OnClick="btnYorumOnayla_OnClick" Width="90" />
                                <asp:Button ID="btnGoruntule" runat="server" OnClick="btnGoruntule_OnClick" CommandArgument='<%# Eval("y_id") %>' CssClass="btn btn-info" Text="Görüntüle" Width="90" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
</asp:Content>
