<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetici.master" AutoEventWireup="true" CodeBehind="ReceteEkle.aspx.cs" Inherits="YonetimPaneli.ReceteEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        <script type="text/javascript" src="assets/js/tiny_mce/tiny_mce.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphAdmin" Runat="Server">
            <div class="Otable" id="NewForm">
        <div class="Otable-title">
            <h4>Reçete Ekleme</h4>
        </div>
        <div class="Otable-body">
            <table style="width: 100%; border: 0px;" class="table table-bordered table-hover">
                <tr>
                    <td style="width: 10%;"><strong>Hasta TCKN</strong></td>
                    <td style="width: 35%;">
                        <asp:TextBox ID="txtTCKN" onkeypress="return numbersonly(this, event)" runat="server" MaxLength="11"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td style="width: 10%;"><strong>İlac Adı</strong></td>
                    <td style="width: 35%;">
                   <asp:DropDownList ID="ddlIlaclar" runat="server" DataTextField="IlacAdi" DataValueField="Id">
                      <asp:ListItem Text="İlaç Seçiniz." Value="0" />
                    </asp:DropDownList></td>
                 </tr> 
                   <tr>
                    <td style="width: 10%;"><strong>Adet</strong></td>
                    <td style="width: 35%;">
                        <asp:TextBox ID="txtAdet" onkeypress="return numbersonly(this, event)" runat="server" MaxLength="2"></asp:TextBox></td>
                </tr>
                      <!-- değişen yer1-->  
                <tr>
                    <td style="width: 10%;"></td>
                    <td style="width: 35%;">
                        <asp:Button ID="btnReceteEkle" runat="server" Text="Kaydet" CssClass="btn btn-primary" OnClick="btnReceteEkle_Click" /></td>
                </tr>
                <tr>
                    <td style="width: 10%;"></td>
                    <td style="width: 35%;">
                        <asp:Label ID="lblHata" runat="server"></asp:Label></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>