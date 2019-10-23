<%@Page Language="C#" MasterPageFile="~/GoodStuffSite/site.Master" AutoEventWireup="true" CodeFile="InsertProduct.aspx.cs" Inherits="InsertProduct" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="InserProductContent" runat="server">
    <div class="jumbotron">
       
        <asp:Label ID="H1Show" runat="server" Text="<h2>新增商品<h2>"></asp:Label>
        <h4>您可以在這裡新增或更新一項商品</h4>
    </div>
    <div class="container">
        <div class ="row">
            <div class ="col-sm-6">
        <asp:ImageButton ID="picture" runat="server" ImageUrl="~/pic/nopic.png" />
        <br>
        <asp:Label ID="picturename" runat="server" Text="..."></asp:Label>
        <br>
        <asp:FileUpload ID="PicPath" runat="server"/>
        <asp:Button ID="UploadPic" runat="server" Text="上傳照片"  OnClick="UploadPic_Click"/>

            </div>
            <div class="col-sm-6">
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <fieldset>
                        <table  class="table table-striped">
                            <tr>
                                <td>產品名稱
                                </td>
                                <td>
                                    <asp:TextBox ID="ProdName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>產品介紹
                                </td>
                                <td>
                                    <asp:TextBox ID="ProdIntroduction" runat="server"  TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>產品價格與單位
                                </td>
                                <td>單價<asp:TextBox ID="ProdPrice" runat="server" TextMode="Number"></asp:TextBox></br>
                                    單位<asp:TextBox ID="ProdPCS" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>產品類別
                                </td>
                                <td>
                                    <asp:DropDownList ID="ProdTypeList" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br>
            <asp:Button ID="SendData" runat="server" Text="新增" OnClick="SendData_Click" Visible ="False" /><asp:Button ID="UpdateProd" runat="server" Text="更新" Visible ="False" OnClick="UpdateProd_Click"/>
                </div>
            </div>
    </div>
</asp:Content>
