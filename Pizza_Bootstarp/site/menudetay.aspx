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
                    <th><span class="glyphicon glyphicon-align-left"></span>Aparatlar</th>
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
                    <th><span class="glyphicon glyphicon-cutlery"></span>Menü Bilgileri</th>
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
        <div class="col-sm-12">
            <h3>Yorum Bölümü</h3>
            <hr />
            <asp:Repeater ID="rpYorumlar" runat="server" OnItemDataBound="rpYorumlar_OnItemDataBound">
                <ItemTemplate>
                    <div class="col-sm-2">
                        <asp:Image ID="image" Width="100%" Height="100%" runat="server" />
                    </div>
                    <div class="col-sm-10">
                        <h5>
                            <asp:Button ID="btn_uye" Visible="False" CommandArgument='<%# Eval("u_id") %>' runat="server" Text="Button" />
                            <strong>
                                <asp:Label ID="lbl_uye" runat="server" Text=""></asp:Label></strong>
                            <span><small><%# Eval("y_yapma_tarihi") %></small></span></h5>
                        <p><%# Eval("y_icerik") %></p>
                        <br />
                    </div>
                    <div class="clearfix"></div>
                </ItemTemplate>
            </asp:Repeater>

            <hr />
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <div class="alert alert-success alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <strong>Teşekkürler! </strong>Yorumunuzun yayınlanması için adminimiz tarafından onaylanması lazım .
                    </div>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="alert alert-danger alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <strong>Dikkat! </strong>Yorum yapabilmek için giriş yapınız .
                    </div>
                </asp:View>
            </asp:MultiView>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="red" ControlToValidate="txtYorum" runat="server" ErrorMessage="Yorumunuz boş olamaz!"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <div class="input-group">
                <span class="input-group-addon"></span>
                <asp:TextBox ID="txtYorum" CssClass="form-control" placeholder="Yorumunuz..." Height="120" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
            <br />
            <div>
                <asp:Button ID="btnGonder" runat="server" Text="Gönder" Height="40" Width="100%" CssClass="btn btn-success" OnClick="btnGonder_OnClick" />
            </div>
            <hr />
        </div>
    </div>

    <br />
    <br />
    <hr />
</asp:Content>
