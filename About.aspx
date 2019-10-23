<%@ Page Title="關於我" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class ="col-sm-4">
            <img src="img/PeiCheng0413.jpg"class="img-responsive" />
            </div>
        <div class="col-sm-4">
            <div>
                <h1>關於我</h1>
                <p>姓名：劉沛承</p>
                <p>生日：1994/04/13</p>
                Email:<a href="emailto:peicheng0413@gmail.com">peicheng0413@gmail.com</a>
            </div>
            <div>
                <h1>學歷</h1>
                <p>世新大學資訊管理學系資訊科技組</p>
                <p>2012年09月入學~2017年06月畢業</p>
            </div>
            <div>
                <h1>工作經驗</h1>
                <p>
                    世新大學電算中心&nbsp;擔任電腦維修工讀生&nbsp;2.5年
            </div>
        </div>

        <div class="col-sm-4">
            <div>
                <h1>專長</h1>
                <h4>網頁程式設計</h4>
                ASP.NET(C#),CSS,JavaScript
                <h4>程式語言</h4>
                C#,Java
                <h4>多媒體,圖像</h4>
                PhotoShop,premiere
                <h4>文書軟體</h4>
                Word,PowerPoint,Excel
                <h4>其他</h4>
                電腦維修,小型手排車駕照
            </div>
        </div>
    </div>
    <div>
        <h1>自傳</h1>
        <p>
            我有著強烈的學習欲望，畢業後一邊找工作一邊進修，
我為人正直、待人以誠、有責任感、講求辦事效率並且善於解決問題，
是執行力佳的行動派，我在2017-06-19畢業於世新大學資訊管理學系資訊科技組。在校期間，
我對於ASP.NET以及資料庫程式設計的相關課程特別感興趣，所以就花了不少功夫用心研讀，
也學以致用完成了學校的畢業專題並得到了高分。除了課業以外，我利用時間在校工讀及健身，
因為有學校電算中心擔任維修工讀生的經歷，所以在維修電腦與使用狀況排除有豐富的經驗。
雖然我的社會歷練並不是很多，但我擁有良好的程式設計邏輯基礎，以及無論碰到任何困難都不會退縮的韌性，
所以我可以在未來不斷提升自己。
        </p>
    </div>
</asp:Content>
