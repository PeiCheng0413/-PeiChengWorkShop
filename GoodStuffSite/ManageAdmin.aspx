<%@  Page Language="C#" MasterPageFile="~/GoodStuffSite/site.Master" AutoEventWireup="true" CodeFile="ManageAdmin.aspx.cs" Inherits="ProductAdmin" %>
    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
         
        <div class ="jumbotron">
            <h2>攤位及商品審核</h2>
            <h4>如果您有管理權限可以在這裡審核要刊登的商品(目前沒設定權限限制)</h4>
            <h5>手機板畫面會跑掉-處理中</h5>
        </div>
         <div>
              <h1>審核產品</h1>
         <asp:GridView ID="ProdGrid" runat="server" AllowPaging="true" AutoGenerateColumns="False" BackColor="white" BorderColor="Black" BorderStyle="Solid"
                    BorderWidth="1px" CaptionAlign="Top" CellPadding="4" CellSpacing="5" ForeColor="Black" GridLines="Vertical" HeaderStyle-Font-Bold="false"  
                   PagerSettings-Mode="Numeric" PageSize="5" Width="100%" OnPageIndexChanging="ProdGrid_PageIndexChanging"  >
                   <Columns>
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="審核">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle BackColor="white" HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:RadioButton ID="ProdCheckX" runat="server" groupname="op" Text="拒絕刊登" /><p>
                               <asp:RadioButton ID="ProdCheckO" runat="server" groupname="op" Text="允許刊登" />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="產品代碼">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:Label ID="ProdID" runat="server" Text='<%# Eval("ProductId") %>'/>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="產品名稱">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:Label ID="ProdName" runat="server" Text='<%# Eval("ProductName") %>' />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="產品介紹">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:Label ID="ProdIntrodu" runat="server"  Text='<%# Eval("ProductInfo") %>' />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="商品圖片">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:ImageButton ID="ProdPicture" runat="server" Height="150px" ImageUrl='<%# "~/pic/" + Eval("ProductImage") %>' Width="150px" />
                           </ItemTemplate>
                       </asp:TemplateField> 
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="商品類別">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:Label ID="ProdType" runat="server"  Text='<%# Eval("PTypeName") %>' />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="商品價格/單位">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:Label ID="ProdPrice" runat="server"  Text='<%# Eval("ProductPrice") %>' />
                               <asp:Label ID="ProdPCS" runat="server"  Text='<%# Eval("ProductPCS") %>' />
                           </ItemTemplate>
                       </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="更新時間">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:Label ID="ProdUpDateTime" runat="server"  Text='<%# Eval("ProductDate") %>' />
                           </ItemTemplate>
                       </asp:TemplateField>
                   </Columns>
                   <FooterStyle BackColor="#CCCC99" />
                   <HeaderStyle BackColor="#669999" Font-Bold="True" Font-Size="12pt" ForeColor="White" />
                   <PagerSettings PageButtonCount="5" Position="Top" />
                   <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                   <RowStyle BackColor="#ffffff" />
                   <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                   <SortedAscendingCellStyle BackColor="#FBFBF2" />
                   <SortedAscendingHeaderStyle BackColor="#848384" />
                   <SortedDescendingCellStyle BackColor="#EAEAD3" />
                   <SortedDescendingHeaderStyle BackColor="#575357" />
               </asp:GridView>
               <asp:Button ID="ProdUpdate" runat="server" Text="商品更新" OnClick="ProdUpdate_Click" />
          </div>
         <div>
             <h1>審核攤位</h1>
            <asp:GridView ID="ShopGrid" runat="server" AllowPaging="true" AutoGenerateColumns="False" BackColor="white" BorderColor="Black" BorderStyle="Solid"
                    BorderWidth="1px" CaptionAlign="Top" CellPadding="4" CellSpacing="5" ForeColor="Black" GridLines="Vertical" HeaderStyle-Font-Bold="false"  
                   PagerSettings-Mode="Numeric" PageSize="5" Width="100%" OnPageIndexChanging="ProdGrid_PageIndexChanging"  >
                   <Columns>
                      
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="修改">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle BackColor="white" HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:RadioButton ID="ShopCheckX" runat="server" groupname="op" Text="拒絕擺攤" /><p>
                               <asp:RadioButton ID="ShopCheckO" runat="server" groupname="op" Text="允許擺攤" />
                           </ItemTemplate>
                       </asp:TemplateField> 
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="攤位代碼">
                           <HeaderStyle Font-Bold="False"/>
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:Label ID="ShopID" runat="server" Text='<%# Eval("ShopId") %>'/>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="攤位資訊">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               攤位名稱：
                               <asp:Label ID="ShopName" runat="server" Text='<%# Eval("ShopName") %>' /><p>
                                   電話：
                               <asp:Label ID="ShopPhone" runat="server" Text='<%# Eval("ShopPhone") %>' /><p>
                                   地址：
                               <asp:Label ID="ShopAddress" runat="server" Text='<%# Eval("ShopAddress") %>' />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="攤位介紹">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:Label ID="ShopIntrodu" runat="server"  Text='<%# Eval("ShopInfo") %>' />
                           </ItemTemplate>
                       </asp:TemplateField>
					    <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="攤位類別">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:Label ID="ShopType" runat="server"  Text='<%# Eval("STypeName") %>' />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="攤位圖片">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:ImageButton ID="ShopPicture" runat="server" Height="150px" ImageUrl='<%# "~/shoppic/" + Eval("ShopImage") %>' Width="150px" />
                           </ItemTemplate>
                       </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="更新時間">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:Label ID="ShopUpDateTime" runat="server"  Text='<%# Eval("ShopDate") %>' />
                           </ItemTemplate>
                       </asp:TemplateField>
                   </Columns>
                   <FooterStyle BackColor="#CCCC99" />
                   <HeaderStyle BackColor="#669999" Font-Bold="True" Font-Size="12pt" ForeColor="White" />
                   <PagerSettings PageButtonCount="5" Position="Top" />
                   <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                   <RowStyle BackColor="#ffffff" />
                   <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                   <SortedAscendingCellStyle BackColor="#FBFBF2" />
                   <SortedAscendingHeaderStyle BackColor="#848384" />
                   <SortedDescendingCellStyle BackColor="#EAEAD3" />
                   <SortedDescendingHeaderStyle BackColor="#575357" />
               </asp:GridView>
               <asp:Button ID="ShopUpdate" runat="server" Text="攤位更新" OnClick="ShopUpdate_Click"/>
        </div>
</asp:Content>
 

