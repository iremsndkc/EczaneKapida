<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Recete.aspx.cs" Inherits="EczaneKapida.Recete" %>
<%@ Reference Page="~/Default.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- ADETE SAYI HARİÇİNDE KLAVYEDEN TUŞ BASILMIYOR --%>
    <script type="text/javascript">
           function numbersonly(myfield, e, dec) {
               var key;
               var keychar;

               if (window.event)
                   key = window.event.keyCode;
               else if (e)
                   key = e.which;
               else
                   return true;
               keychar = String.fromCharCode(key);

               // control keys
               if ((key == null) || (key == 0) || (key == 8) ||
       (key == 9) || (key == 13) || (key == 27))
                   return true;

                   // numbers
               else if ((("0123456789").indexOf(keychar) > -1))
                   return true;

                   // decimal point jump
               else if (dec && (keychar == ".")) {
                   myfield.form.elements[dec].focus();
                   return false;
               }
               else
                   return false;
           }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrap">
        <div class="where">
            <table>
                <tr>
                    <td><a href="Default.aspx"><span class="glyphicon glyphicon-home"></span></a></td>
                    <td>Reçetem</td>
                </tr>
            </table>

        </div>
    </div>
    
    <div class="wrap" style="width:980px">
        <div class="alert alert-warning" id="divErrorInformation" runat="server" visible="false" style="text-align: center;"></div>
        <div class="urun-detay">
            <p class="alt-bas">Reçetem</p>
            <hr />
            <div class="container sepet">
                <table>
                    <thead>
                        <tr>
                            <td colspan="6">Ürünler</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="tablo-alt">
                            <td>Ürün Adı</td>
                            <td>Fiyatı</td>
                            <td>Kargo</td>  
                            <td>Adet</td>                         
                            <td>Toplam</td>
                            <td>Sepete Ekle</td>
                        </tr>
                        <asp:Repeater ID="dtRecete" runat="server" >
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <table class="urun-adi">
                                            <tr>
                                                <td>
                                                    <img src="/IlacResimleri/<%#Eval("UrunResim") %>" />
                                                </td>
                                                <td>
                                                  <%#Eval("UrunAd") %>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <%# Eval("UrunFiyat", "{0:N}") %> TL
                                    </td>
                                     <td>
                                        <%# Eval("UrunKargo", "{0:N}") %> TL
                                    </td>
                                    <td>
                                        <table class="urun-adi">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("ReceteId") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblAdet" runat="server" Text="" Visible="false"></asp:Label>
                                                   <asp:TextBox ID="txtAdet" runat="server" Enabled="false" CssClass="form-control" Text='<%# Eval("UrunAdet") %>' style="width:50px !important;" MaxLength="2" ></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td> <%# Eval("UrunToplam", "{0:N}") %> TL</td>
                                    <td><asp:Button ID="btnSepeteEkle" runat="server" CssClass="add-icon" Text="" OnClick="btnSepeteEkle_Click" Height="55px" Width="55px" /></td>
                                    
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Label ID="lblHata" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </tbody>
                </table><br /><br />
                <asp:Button ID="btnSepeteGit" CssClass="btn btn-danger" runat="server" Text="Sepete Git" OnClick="btnSepeteGit_Click" />
            </div>
            
            </div>
        </div>
    
</asp:Content>
