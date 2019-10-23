<%@ Page Language="C#" MasterPageFile="~/GoodStuffSite/site.Master" AutoEventWireup="true" CodeFile="ShopManage.aspx.cs" Inherits="ShopManage" %><asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>攤位資訊</h2>
		<asp:Label ID="ShowMessage" runat="server" ForeColor="Green" ></asp:Label>
        <h4>您可以在這裡更新您的攤位資訊</h4>
    </div>
   
     <div class="container">
         <div class ="row">
             <div class ="col-sm-6">
	 <asp:ImageButton ID="picture" runat="server" ImageUrl="~/pic/nopic.png" />
                <br>
                <asp:Label ID="ShopPicName" runat="server" Text="..."></asp:Label>
                <br>
                <asp:FileUpload ID="PicPath" runat="server" />
                <asp:Button ID="UploadPic" runat="server" Text="上傳照片" OnClick="UploadPic_Click"/>
                 </div>
             <div class="col-sm-6">
         <table  class="table table-striped">
              <tr>
                 <td>攤位名稱：</td>
                 <td>
                     <asp:TextBox ID="ShopName" runat="server"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td>連絡電話：</td>
                 <td>
                     <asp:TextBox ID="ShopPhone" runat="server"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td>地址：</td>
                 <td>
                     <asp:TextBox ID="ShopAddress" runat="server"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td>攤位特色：</td>
                 <td>                     
                     <asp:TextBox ID="ShopIntrodu" runat="server" ></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td>詳細資訊：</td>
                 <td>                     
                     <asp:TextBox ID="ShopDetail" runat="server" TextMode="MultiLine" ></asp:TextBox>
                 </td>
             </tr>
			 <tr>
                 <td>攤位類型：</td>
                 <td>                     
                     <asp:DropDownList ID="ShopTypeList" runat="server"></asp:DropDownList>
                 </td>
             </tr>
             <tr>
                 <td>審核通過：</td>
                 <td>                     
                     <asp:Label ID="CheckLabel" runat="server"></asp:Label>
                 </td>
             </tr>
			 
         </table>   
         <asp:Button ID="UpDate" runat="server" Text="攤位資料更新" OnClick="UpDate_Click"/>
                 </div>
             </div>
     </div>
</asp:Content>