<%@ Page Title="" Language="C#" MasterPageFile="~/site/Master.Master" AutoEventWireup="true" CodeBehind="menuler.aspx.cs" Inherits="Pizza_Bootstarp.site.menuler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpBody" runat="server">
    <div class="row">
        <br />
        <!-- START THE FEATURETTES -->
        <asp:Repeater ID="rpMenuler" runat="server">
            <ItemTemplate>
                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading"><%# Eval("m_baslik") %></h2>
                        <h6><%# Eval("m_eklenme_tarihi").ToString() %></h6>
                        <p class="lead"><%# Eval("m_aciklama").ToString().Length >= 250 ? Eval("m_aciklama").ToString().Substring(0,250) + " ..." : Eval("m_aciklama") %></p>
                        <br />
                        <asp:Button ID="btnDetay" CssClass="btn btn-info" CommandArgument='<%# Eval("m_id") %>' runat="server" Text="Detay için tıklayın ..."  OnClick="btnDetay_OnClick"/>
                    </div>
                    <div class="col-md-5">
                        <asp:Image ID="resim" class="featurette-image img-responsive center-block" ImageUrl='<%# Eval("m_resim") %>' Width="350" Height="350" AlternateText="pizza" runat="server" />
                    </div>
                </div>
                <hr class="featurette-divider" />
            </ItemTemplate>
        </asp:Repeater>


        <hr class="featurette-divider" />

        <!-- /END THE FEATURETTES -->
    </div>
</asp:Content>
