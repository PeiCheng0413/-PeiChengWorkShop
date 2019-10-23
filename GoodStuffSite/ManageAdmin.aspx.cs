using System;
using System.Web.UI.WebControls;
using System.Data;


public partial class ProductAdmin : System.Web.UI.Page
{
    GoodStuffDB db = new GoodStuffDB();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetAllProdData();
            GetAllShopData();
        }
    }
    void GetAllProdData()
    {
        DataTable dt = new DataTable();
        dt= db.SqlGetDataTable("SELECT * FROM Product,PType WHERE ProductCheck = 'False' AND ProductTypeId = PTypeId ORDER BY ProductDate ASC");
        ProdGrid.DataSource = dt;
        ProdGrid.DataBind();
        //SELECT ProductId, ProductName, ProductInfo, ProductImage, ProductPrice, ProductPCS, PTypeName,ProductDate FROM Product,PType WHERE ProductCheck = 'False' AND ProductTypeId = PTypeId ORDER BY ProductDate ASC
    }
    void GetAllShopData()
    {
        DataTable dt = new DataTable();
        dt = db.SqlGetDataTable("SELECT * FROM Shop ,SType WHERE ShopCheck = 'False' AND ShopTypeId = STypeId ORDER BY ShopDate ASC");
        ShopGrid.DataSource = dt;
        ShopGrid.DataBind();
        //"SELECT * FROM Shop INNER JOIN SType ON Shop.ShopTypeId = SType.STypeId WHERE ShopCheck = 'False' ORDER BY ShopDate ASC"
    }
    protected void ProdUpdate_Click(object sender, EventArgs e)
    {
        string sqlstr;
        RadioButton X = new RadioButton();
        RadioButton O = new RadioButton();
        Label ID = new Label();
        GridViewRow Rowx;
        for (int i = 0; i < ProdGrid.Rows.Count; i++)
        {
            Rowx = ProdGrid.Rows[i];
            X = (RadioButton)Rowx.Cells[0].FindControl("ProdCheckX");
            O = (RadioButton)Rowx.Cells[0].FindControl("ProdCheckO");
            ID = (Label)Rowx.Cells[1].FindControl("ProdID");

            if (X.Checked)
            {
                sqlstr = "update Product set ProductImage = 'checkfail.png' where ProductId = " + db.qo(ID.Text);
                db.runSQL(sqlstr);
            }
            else if (O.Checked)
            {
                sqlstr = "update Product set ProductCheck = '1' where ProductId = " + db.qo(ID.Text);
                db.runSQL(sqlstr);
            }
        }
                GetAllProdData();
    }
    protected void ShopUpdate_Click(object sender, EventArgs e)
    {
        string sqlstr;
        RadioButton X = new RadioButton();
        RadioButton O = new RadioButton();
        Label ID = new Label();
        GridViewRow Rowx;
        for (int i = 0; i < ShopGrid.Rows.Count; i++)
        {
            Rowx = ShopGrid.Rows[i];
            X = (RadioButton)Rowx.Cells[0].FindControl("ShopCheckX");
            O = (RadioButton)Rowx.Cells[0].FindControl("ShopCheckO");
            ID = (Label)Rowx.Cells[1].FindControl("ShopID");

            if (X.Checked)
            {
                sqlstr = "update Shop set ShopImage = 'checkfail.png' where ShopId = " + db.qo(ID.Text);
                db.runSQL(sqlstr);
                
            }
            else if (O.Checked)
            {
                sqlstr = "update Shop set ShopCheck = '1' where ShopId = " + db.qo(ID.Text);
                db.runSQL(sqlstr);
            }
        }
        GetAllShopData();
    }
    protected void ProdGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ProdGrid.PageIndex = e.NewPageIndex;
        GetAllProdData();
    }
}