<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Siparislerim.aspx.cs" Inherits="EczaneKapida.Siparislerim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .tablee td {
            padding: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrap">
        <div class="where">
            <table>
                <tr>
                    <td><a href="Default.aspx"><span class="glyphicon glyphicon-home"></span></a></td>
                    <td>Siparişlerim</td>
                </tr>
            </table>

        </div>

        <div class="wrap">
            <div class="alert alert-warning" id="divErrorInformation" runat="server" visible="false" style="text-align: center;"></div>
            <div class="urun-detay">
                <div class="pull-left">
                    <p class="alt-bas">
                        <asp:Label ID="lblOrderTime" runat="server" Text="Tüm Siparişler"></asp:Label>
                    </p>
                </div>
                <div class="clearfix"></div>
                <hr />
                <div class="container sepet">
                   <table>
                    <thead>
                        <tr>
                            <td colspan="4">Siparişler</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="tablo-alt">
                            <td>Sipariş Numarası</td>
                            <td>Sipariş Tarihi</td>
                            <td>Sipariş Durumu</td>  
                            <td>İşlem</td>                         
                        </tr>
                        <asp:Repeater ID="dtSiparis" runat="server" >
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false"></asp:Label>
                                      <%# Eval("SiparisNo") %>
                                    </td>
                                    <td>
                                         <%# Eval("OlusturmaTarihi") %>
                                    </td>
                                     <td>
                                        <%# Eval("SiparisDurumu") %>
                                    </td>
                                    <td><asp:LinkButton ID="btnSiparisDetay" runat="server" Text="Sipariş Detayı" OnClick="btnSiparisDetay_Click" /></td>
                                    
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        
                        <asp:Label ID="lblHata" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </tbody>
                </table><br /><br />      
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>

