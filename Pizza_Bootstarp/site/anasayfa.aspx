<%@ Page Title="" Language="C#" MasterPageFile="~/site/Master.Master" AutoEventWireup="true" CodeBehind="anasayfa.aspx.cs" Inherits="Pizza_Bootstarp.site.anasayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpSlider" runat="server">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img class="first-slide" src="image/1.jpg" />
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Example headline.</h1>
                        <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
                        <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="second-slide" src="image/2.jpg" alt="Second slide" />
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Another example headline.</h1>
                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="third-slide" src="image/3.jpg" alt="Third slide" />
                <div class="container">
                    <div class="carousel-caption">
                        <h1>One more for good measure.</h1>
                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
                    </div>
                </div>
            </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpBody" runat="server">

    <!-- Three columns of text below the carousel -->
    <div class="row">
        <asp:Repeater ID="rpSliderAlti" runat="server">
            <ItemTemplate>
                <div class="col-lg-4">
                    <asp:Image ID="img" class="img-circle" src='<%# Eval("m_resim") %>' alt="Generic placeholder image" Width="140" Height="140" runat="server" />
                    <%--<img class="img-circle" src="<%# Eval("m_resim") %>" alt="Generic placeholder image" width="140" height="140" />--%>
                    <h2><%# Eval("m_baslik").ToString().Length >= 30 ? Eval("m_baslik").ToString().Substring(0,30) : Eval("m_baslik") %></h2>
                    <p><%# Eval("m_aciklama").ToString().Length >= 300 ? Eval("m_aciklama").ToString().Substring(0,300) + " ..." : Eval("m_aciklama") %></p>
                    <p>
                        <asp:Button ID="btnIncele" CssClass="btn btn-success" runat="server" Text="İncele" CommandArgument='<%# Eval("m_id") %>' OnClick="btnIncele_OnClick" />
                        <asp:Button ID="btnYorum" CssClass="btn btn-info" runat="server" Text="Yorum Yap" CommandArgument='<%# Eval("m_id") %>' OnClick="btnYorum_OnClick" />
                    </p>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <!-- /.col-lg-4 -->
    </div>
    <!-- /.row -->

</asp:Content>
