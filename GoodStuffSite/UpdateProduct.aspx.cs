using System;
using System.Web.UI.WebControls;
using System.Data;

public partial class UpdateProduct : System.Web.UI.Page
{
    GoodStuffDB DB = new GoodStuffDB();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UserShopId"].ToString() == "0")
                {
                    Response.Redirect("ShopManage?ms=1");
                }
                else
                {
                    GetAllData();
                }
            }
        }
        else
        {
            Response.Redirect("~/Account/Login");
        }
			int x = Convert.ToInt32(Request["datames"]);
				if(x==1)
					ShowMessage.Text = "更新成功";
				if(x==2)
				{
					ShowMessage.Text = "新增成功";
					HighlightRow();
				}
    }    
    protected void ProdGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)//GridView跳頁
    {
        ProdGrid.PageIndex = e.NewPageIndex;
        GetAllData();
    }
    protected void ProdGrid_RowCommand(object sender, GridViewCommandEventArgs e)//設定session並跳至單筆更新
    {
        if (e.CommandName == "myLINK")
        {
            GridViewRow Rowx;
            int i = Convert.ToInt32(e.CommandArgument);
			Rowx = ProdGrid.Rows[i];
            Label ProdID = (Label)Rowx.Cells[1].FindControl("ProdID");
			Session["ProductId"] = ProdID.Text;
            Response.Redirect("InsertProduct?ms=1");
        }
    }
    protected void BatchUpdate_Click(object sender, EventArgs e)
    {
        string sqlstr;
        RadioButton Flag_Del = new RadioButton();
        RadioButton Flag_Update = new RadioButton();
        Label ProdID = new Label();
        Label ProdName = new Label();
        TextBox ProdIntrodu = new TextBox();
        TextBox ProdPrice = new TextBox();
        TextBox ProdPCS = new TextBox();
		TextBox ProdDiscount = new TextBox();
        CheckBox ProdShortage = new CheckBox();
        GridViewRow Rowx;
        for (int i = 0; i < ProdGrid.Rows.Count; i++)//找到GridView所有RedioBox控制向項並判斷更新或刪除
        {
            Rowx = ProdGrid.Rows[i];
            Flag_Del = (RadioButton)Rowx.Cells[0].FindControl("Flag_Del");
            Flag_Update = (RadioButton)Rowx.Cells[0].FindControl("Flag_Update");
            ProdID = (Label)Rowx.Cells[1].FindControl("ProdID");
			
            if (Flag_Del.Checked)//刪除
            {
                sqlstr = "DELETE FROM Product WHERE ProductId =" + DB.qo(ProdID.Text);
                DB.runSQL(sqlstr);
            }
            else if (Flag_Update.Checked)//更新
            {
                string shortageStr;
                ProdID = (Label)Rowx.Cells[1].FindControl("ProdID");
                ProdName = (Label)Rowx.Cells[2].FindControl("ProdName");
                ProdIntrodu = (TextBox)Rowx.Cells[3].FindControl("ProdIntrodu");
                ProdPrice = (TextBox)Rowx.Cells[6].FindControl("ProdPrice");
                ProdPCS = (TextBox)Rowx.Cells[6].FindControl("ProdPCS");
                ProdShortage = (CheckBox)Rowx.Cells[7].FindControl("ProdShortage");
                if (ProdShortage.Checked)
                    shortageStr = "1";
                else
                    shortageStr = "0";
                sqlstr = "update Product set ";
                sqlstr += " ProductName = " + DB.nqo(ProdName.Text);
                sqlstr += " ,ProductInfo = " + DB.nqo(ProdIntrodu.Text);
                sqlstr += " ,ProductPrice = " + DB.qo(ProdPrice.Text);
                sqlstr += " ,ProductPCS = " + DB.nqo(ProdPCS.Text);               
                sqlstr += " ,ProductShortage = " + DB.qo(shortageStr);
                sqlstr += " ,ProductCheck = '0'";
                sqlstr += " where ProductId = " + DB.qo(ProdID.Text);
                DB.runSQL(sqlstr);
            }
        }
		
                ShowMessage.Text = "更新成功";
				
        GetAllData();
    }
    void GetAllData()
    {
        DataTable dt = new DataTable();
        dt = DB.SqlGetDataTable("SELECT DISTINCT * FROM Product,PType WHERE ProductShopId ='"+Session["UserShopId"] + "' AND ProductTypeId = PTypeId ORDER BY ProductId DESC");
        ProdGrid.DataSource = dt;
        ProdGrid.DataBind();
    }
    void HighlightRow()
	{ 
	   GridViewRow Rowx;
	   Rowx = ProdGrid.Rows[0];
	   Rowx.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFCC");;
	}

    
}