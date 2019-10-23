using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.AspNet.Identity;
public partial class _Default : Page
{
    GoodStuffDB db = new GoodStuffDB();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            GetProdData();
        if (User.Identity.IsAuthenticated)
            UserSessionSet();
    }
    void GetProdData()
    {
        DataTable dt = new DataTable();
        dt = db.SqlGetDataTable("SELECT * FROM Product WHERE ProductCheck = '1' AND ProductShortage = '0' AND ProductShopId IN (SELECT ShopId FROM Shop WHERE ShopCheck = '1')");
        ProdGrid.DataSource = dt;
        ProdGrid.DataBind();
    }
    void UserSessionSet()
    {
        string UserShopId;
        UserShopId = db.UserIdentity(Context.User.Identity.GetUserName());
        Session["UserName"] = Context.User.Identity.GetUserName();
        Session["UserShopId"] = UserShopId;
    }

     protected void ProdGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ProdGrid.PageIndex = e.NewPageIndex;
        GetProdData();
    }
}