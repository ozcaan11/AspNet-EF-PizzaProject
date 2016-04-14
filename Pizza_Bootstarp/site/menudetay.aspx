<%@ Page Title="" Language="C#" MasterPageFile="~/site/Master.Master" AutoEventWireup="true" CodeBehind="menudetay.aspx.cs" Inherits="Pizza_Bootstarp.site.menudetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpBody" runat="server">
    <div class="col-sm-12 col-md-6">
        <asp:Image ID="resim" CssClass="img-responsive" Width="95%" Height="25%" runat="server" />
        <table class="table">
            <caption></caption>
            <thead>
                <tr>
                    <th><span class="glyphicon glyphicon-align-left"></span>  Aparatlar</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <asp:Repeater runat="server" ID="rpAparatlar">
                            <ItemTemplate>
                                <div class="btn btn-primary" style="margin: 2px 3px 1px 0">
                                    <%# Eval("a_ad").ToString().ToUpperInvariant() %>
                                    <div class="btn btn-success"><%# Eval("a_fiyat") %> TL</div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-sm-12 col-md-6">
        <table class="table">
            <caption></caption>
            <thead>
                <tr>
                    <th><span class="glyphicon glyphicon-cutlery"></span>  Menü Bilgileri</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater runat="server" ID="rpMenu" OnItemDataBound="rpMenu_OnItemDataBound">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Button ID="btnKat" Visible="False" CommandArgument='<%# Eval("k_id") %>' runat="server" Text="Button" />
                                <asp:Label ID="lblKat" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><%# Eval("m_baslik") %></td>
                        </tr>
                        <tr>
                            <td><%# Eval("m_aciklama") %></td>
                        </tr>
                        <tr>
                            <td><%# Eval("m_fiyat") %></td>
                        </tr>
                        <tr>
                            <td><%# Eval("m_eklenme_tarihi") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
    <div class="clearfix">
        <div class="col-sm-6">
            <h3>Yorum Bölümü</h3>
        </div>
    </div>
    <br />
    <br />
    <hr />
</asp:Content>
