<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Master.Master" AutoEventWireup="true" CodeBehind="yorum.aspx.cs" Inherits="Pizza_Bootstarp.admin.yorum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpBody" runat="server">
    <div class="col-md-6" style="margin: 10px 0 20px 5px">
    </div>
    <div class="clearfix"></div>
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>#</th>
                    <th>İçerik</th>
                    <th>Eklenme Tarihi</th>
                    <th>Uye Adı</th>
                    <th>Menü</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpYorumlar" runat="server">
                    <ItemTemplate>
                        <tr>
                            <th scope="row">
                                <asp:Label ID="lblCount" runat="server" Text="+"></asp:Label></th>

                            <td><%# Eval("y_icerik") %></td>
                            <td><%# Eval("y_yapma_tarihi") %></td>
                            <td>
                                <asp:Label ID="lbl_uye" runat="server" Text='<%# Eval("u_id") %>'></asp:Label></td>
                            <td>
                                <asp:Label ID="lbl_menu" runat="server" Text='<%# Eval("m_id") %>'></asp:Label></td>
                            <td>
                                <asp:Button ID="btnSil" runat="server" OnClick="btnSil_OnClick" CommandArgument='<%# Eval("y_id") %>' CssClass="btn btn-danger" Text="Sil" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
</asp:Content>
