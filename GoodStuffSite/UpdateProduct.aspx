<%@  Page Language="C#" MasterPageFile="~/GoodStuffSite/site.Master" AutoEventWireup="true" CodeFile="UpdateProduct.aspx.cs" Inherits="UpdateProduct" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>商品總管</h2>
        <h4>您可以在這裡批次更新您的商品</h4>
        <h5>手機板畫面會跑掉-處理中</h5>
    </div>
    <div>
        <asp:Label ID="ShowMessage" runat="server" ForeColor="Green" Font-Size="X-Large"></asp:Label>
                    <asp:GridView ID="ProdGrid" runat="server" AllowPaging="true" AutoGenerateColumns="False" BackColor="white" BorderColor="Black" BorderStyle="Solid"
                        BorderWidth="1px" CaptionAlign="Top" CellPadding="4" CellSpacing="5" ForeColor="Black" GridLines="Vertical" HeaderStyle-Font-Bold="false"
                        PagerSettings-Mode="Numeric" PageSize="20" Width="100%" OnPageIndexChanging="ProdGrid_PageIndexChanging" OnRowCommand="ProdGrid_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="修改(請記得按)" ItemStyle-Width="15%">
                                <HeaderStyle Font-Bold="False" />
                                <ItemStyle BackColor="white" HorizontalAlign="Center" VerticalAlign="Top" />
                                <ItemTemplate>
                                    <asp:RadioButton ID="Flag_Del" runat="server" GroupName="op" Text="刪除" /><p>
                                    <asp:RadioButton ID="Flag_Update" runat="server" GroupName="op" Text="修改" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="審核狀態" ItemStyle-Width="20%">
                                <HeaderStyle Font-Bold="False" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                <ItemTemplate>
                                    <asp:Label ID="ProdID" runat="server" Text='<%# Eval("ProductId") %>' Visible="False" />
                                    
                                    <asp:Label ID="ProdCheck" runat="server" Text='<%# Eval("ProductCheck") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="產品名稱" ItemStyle-Width="20%">
                                <HeaderStyle Font-Bold="False" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                <ItemTemplate>
                                    <asp:Label ID="ProdName" runat="server" CssClass="fulltext" Text='<%# Eval("ProductName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="產品介紹" ItemStyle-Width="20%">
                                <HeaderStyle Font-Bold="False" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                <ItemTemplate>
                                    <asp:TextBox ID="ProdIntrodu" runat="server" CssClass="fulltext" Text='<%# Eval("ProductInfo") %>' TextMode="MultiLine" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="商品圖片" ItemStyle-Width="20%">
                                <HeaderStyle Font-Bold="False" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                <ItemTemplate>
                                    <asp:ImageButton ID="ShowPicture" runat="server" Height="150px" ImageUrl='<%# "~/pic/" + Eval("ProductImage") %>' Width="150px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="商品類別" ItemStyle-Width="20%">
                                <HeaderStyle Font-Bold="False" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                <ItemTemplate>
                                    <asp:Label ID="ProdType" runat="server" CssClass="fulltext" Text='<%# Eval("PTypeName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="商品價格/單位/折扣" ItemStyle-Width="20%">
                                <HeaderStyle Font-Bold="False" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                <ItemTemplate>
                                    <asp:TextBox ID="ProdPrice" runat="server" CssClass="fulltext" Text='<%# Eval("ProductPrice") %>' />價格
                                    <asp:TextBox ID="ProdPCS" runat="server" CssClass="fulltext" Text='<%# Eval("ProductPCS") %>' />單位
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="目前缺貨" ItemStyle-Width="20%">
                                <HeaderStyle Font-Bold="False" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                <ItemTemplate>
                                    是<asp:CheckBox ID="ProdShortage" runat="server" Checked='<%# Eval("ProductShortage") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
							<asp:TemplateField HeaderStyle-Font-Bold="false" HeaderText="單筆更新" ItemStyle-Width="20%">
                                <HeaderStyle Font-Bold="False" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                <ItemTemplate>
								<asp:Button ID="CrossPageUpdate" runat="server" CommandName="myLINK"
                                CommandArgument='<%# Container.DataItemIndex %>'
                                Text="圖片與產品類型單筆修改" />
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
        <asp:Button ID="BatchUpdate" runat="server" Text="批次更新" OnClick="BatchUpdate_Click" />
    </div>
</asp:Content>
