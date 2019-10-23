<%@  Language="C#" MasterPageFile="~/GoodStuffSite/site.Master" AutoEventWireup="true" CodeFile="GoodStuff.aspx.cs" Inherits="_Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="DefaultContent" runat="server">
     <div class="row jumbotron"> <div class="col-sm-2" ><img src="GoodStuffLogo.png" class="img-responsive"/></div>
    <div class="col-sm-10">
	<h2>歡迎來到小農市集擺攤系統</h2>
        <h4>因為免費伺服器容量有限，照片會進行壓縮，照片模糊為正常現象</h4>
    </div>
         </div>

    <h2>以下為合格攤位刊登的已審核通過商品</h2>
    <h5>手機板畫面會跑掉-處理中</h5>
    <div>
	 <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <fieldset>
         <asp:GridView ID="ProdGrid" runat="server" AllowPaging="true" AutoGenerateColumns="False" BackColor="white" BorderColor="Black" BorderStyle="Solid"
                    BorderWidth="1px" CaptionAlign="Top" CellPadding="4" CellSpacing="5" ForeColor="Black" GridLines="Vertical" HeaderStyle-Font-Bold="false"  
                   PagerSettings-Mode="Numeric" PageSize="5" Width="50%" style="margin-bottom: 2px" OnPageIndexChanging="ProdGrid_PageIndexChanging" >
                   <Columns>
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="名稱" ItemStyle-Width="20%">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>                               
                              <asp:Label ID="ProdName" runat="server" CssClass="fulltext" Text='<%# Eval("ProductName") %>' />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="照片" ItemStyle-Width="20%">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:ImageButton ID="ProdPicture" runat="server" ImageUrl='<%# "~/pic/" + Eval("ProductImage") %>'  />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="價格" ItemStyle-Width="20%">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:Label ID="ProdPrice" runat="server" CssClass="fulltext" Text='<%# Eval("ProductPrice") +"元/每"+ Eval("ProductPCS") %>' />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="產品資訊" ItemStyle-Width="20%">
                           <HeaderStyle Font-Bold="False" />
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                           <ItemTemplate>
                               <asp:Label ID="ProdIntrodu" runat="server" CssClass="fulltext" Text='<%#Eval("ProductInfo")%>' />
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
				 </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
    </div>
</asp:Content>
