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
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi feugiat molestie lorem sed blandit. Suspendisse nec eros nec urna placerat varius. Sed sed diam consectetur, maximus ligula suscipit, tincidunt ipsum. </p>
                        <p><a class="btn btn-lg btn-primary" href="kaydol.aspx" role="button">Sign up today</a></p>
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="second-slide" src="image/2.jpg" alt="Second slide" />
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Another example headline.</h1>
                        <p>Etiam et leo imperdiet, egestas risus a, fermentum massa. Nunc sit amet erat quis lorem cursus faucibus. Proin nisl erat, hendrerit mollis neque vitae, tempus malesuada ante</p>
                        <p><a class="btn btn-lg btn-primary" href="menuler.aspx" role="button">Learn more</a></p>
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="third-slide" src="image/3.jpg" alt="Third slide" />
                <div class="container">
                    <div class="carousel-caption">
                        <h1>One more for good measure.</h1>
                        <p>Vestibulum pharetra vulputate ante, placerat luctus metus venenatis ut. Integer vitae tellus pellentesque, fringilla tellus vitae, tristique orci. Nullam non elit in felis faucibus vulputate</p>
                        <p><a class="btn btn-lg btn-primary" href="giris.aspx" role="button">Sign In</a></p>
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
