<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Master.Master" AutoEventWireup="true" CodeBehind="anasayfa.aspx.cs" Inherits="Pizza_Bootstarp.admin.anasayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpBody" runat="server">
    <hr />
    <div class="row">
        <a href="menu.aspx"><div class="col-sm-4 ">
            <div class="btn btn-primary btn-lg btn-block" style="height: 75px; text-align: center; padding-top: 25px;">
                <span class="glyphicon glyphicon-cutlery"></span>
                MENÜLER (<asp:Label ID="lblMenu" runat="server" Text="0"></asp:Label>)
            </div><br />
        </div></a>
        <a href="kategori.aspx"><div class="col-sm-4 ">
            <div class="btn btn-success btn-lg btn-block" style="height: 75px; text-align: center; padding-top: 25px;">
                <span class="glyphicon glyphicon-th-list"></span>
                KATEGORİLER (<asp:Label ID="lblKat" runat="server" Text="0"></asp:Label>)
            </div><br />
        </div></a>
        <a href="aparat.aspx"><div class="col-sm-4 ">
            <div class="btn btn-info btn-lg btn-block" style="height: 75px; text-align: center; padding-top: 25px;">
                <span class="glyphicon glyphicon-road"></span>
                APARATLAR (<asp:Label ID="lblApa" runat="server" Text="0"></asp:Label>)
            </div><br />
        </div></a>
        <a href="uye.aspx"><div class="col-sm-4 ">
            <div class="btn btn-warning btn-lg btn-block" style="height: 75px; text-align: center; padding-top: 25px;">
                <span class="glyphicon glyphicon-user"></span>
                ÜYELER (<asp:Label ID="lblUye" runat="server" Text="0"></asp:Label>)
            </div><br />
        </div></a>
        <a href="yorum.aspx"><div class="col-sm-4 ">
            <div class="btn btn-danger btn-lg btn-block" style="height: 75px; text-align: center; padding-top: 25px;">
                <span class="glyphicon glyphicon-thumbs-up"></span>
                YORUMLAR (<asp:Label ID="lblYor" runat="server" Text="0"></asp:Label>)
            </div><br />
        </div></a>
        <a href="../site/anasayfa.aspx" target="_blank"><div class="col-sm-4 ">
            <div class="btn btn-default btn-lg btn-block" style="height: 75px; text-align: center; padding-top: 25px;">
                <span class="glyphicon glyphicon-share"></span>
                SİTEYİ GÖRÜNTÜLE
            </div><br />
        </div></a>
    </div>
    <br />
    <br />
</asp:Content>
