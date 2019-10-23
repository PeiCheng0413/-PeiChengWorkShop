using System;
using System.IO;
using System.Web.UI;
using System.Data;
using System.Drawing;
public partial class InsertProduct : System.Web.UI.Page
{
    GoodStuffDB db = new GoodStuffDB();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            if (!Page.IsPostBack)
            {
                IdentityUser();
                GetTypeList();
                int x = Convert.ToInt32(Request["ms"]);
                if (Session["ProductId"] != null&& x==1)
                    UpdateOneProd();
                else
                    SendData.Visible = true;
            }
        }
        else
        {
            Response.Redirect("~/Account/Login");
        }
        
	}
    void IdentityUser()
    {
        if (Session["UserShopId"].ToString() == "0")
        {
            Response.Redirect("ShopManage?ms=1");
        }
    }
    protected void UploadPic_Click(object sender, EventArgs e)
    {
        if (PicPath.HasFile)
        {
			DateTime dt = DateTime.Now;
            String TempSavePath = Server.MapPath("~/pic/temp/");
            String SavePath = Server.MapPath("~/pic/");
            dt.Ticks.ToString();
			string picexten = Path.GetExtension(PicPath.FileName);
			string NewPicFileName = dt.GetHashCode().ToString()+picexten;
            string tempName = TempSavePath + NewPicFileName;
            string imageName = SavePath + NewPicFileName;

			PicPath.SaveAs(tempName);
            System.Drawing.Image.GetThumbnailImageAbort callBack = new System.Drawing.Image.GetThumbnailImageAbort(db.ThumbnailCallback);
            Bitmap image = new Bitmap(tempName);

            int[] thumbnailScale = db.getThumbnailImageScale(48, 48, image.Width, image.Height);

            System.Drawing.Image smallImage =
            image.GetThumbnailImage(thumbnailScale[0], thumbnailScale[1], callBack, IntPtr.Zero);

            smallImage.Save(imageName);

            image.Dispose();
            System.IO.File.Delete(tempName);
            picture.ImageUrl = @"~\pic\" +NewPicFileName;
            picturename.Text = NewPicFileName;
			if (Session["ProductId"] == null)
				SendData.Visible = true;
		}
    }
	
	  
    protected void SendData_Click(object sender, EventArgs e)
    {
        string sqlstr = "insert into Product(ProductName, ProductInfo, ProductPrice, ProductImage, ProductPCS, ProductDate,ProductTypeId,ProductShopId ) values(";
        sqlstr += db.nqo(ProdName.Text) + ",";
        sqlstr += db.nqo(ProdIntroduction.Text) + ",";
        sqlstr += db.qo(ProdPrice.Text) + ",";
        sqlstr += db.qo(picturename.Text) + ",";
        sqlstr += db.nqo(ProdPCS.Text) + ",";
        sqlstr += db.qo(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff")) + ",";
		sqlstr += db.qo(ProdTypeList.Text) + ",";
        sqlstr += db.qo(Session["UserShopId"].ToString()) + ")";
        db.runSQL(sqlstr);
		Response.Redirect("UpdateProduct.aspx?datames=2");
    }
   
    void GetTypeList()
    {
        
        DataTable myTable = new DataTable();
        myTable = db.SqlGetDataTable("SELECT * FROM PType");
        ProdTypeList.DataSource = myTable;
        ProdTypeList.DataTextField = "PTypeName";
        ProdTypeList.DataValueField = "PTypeId";
        ProdTypeList.DataBind();
    }
   

    void UpdateOneProd()
    {
        H1Show.Text = "<h1>更新您的商品<h1>";
        string[] ProductInfo;
        ProductInfo = db.UpdateOneProduct(Session["ProductId"].ToString());
        ProdName.Text = ProductInfo[0].ToString();
        ProdIntroduction.Text = ProductInfo[1];
        ProdPrice.Text = ProductInfo[5];
        ProdPCS.Text = ProductInfo[3];
		ProdTypeList.SelectedIndex = ProdTypeList.Items.IndexOf(ProdTypeList.Items.FindByValue(ProductInfo[4]));
        picture.ImageUrl = "~/pic/" + ProductInfo[2];
		picturename.Text = ProductInfo[2];
		GetTypeList();
        UpdateProd.Visible = true;
    }
    protected void UpdateProd_Click(object sender, EventArgs e)
    {
        string sqlstr;
        sqlstr = "update Product set ";
        sqlstr += " ProductName = " + db.nqo(ProdName.Text);
        sqlstr += " ,ProductInfo = " + db.nqo(ProdIntroduction.Text);
        sqlstr += " ,ProductPrice = " + db.qo(ProdPrice.Text);
        sqlstr += " ,ProductPCS = " + db.nqo(ProdPCS.Text);
        sqlstr += " ,ProductImage = " + db.qo(picturename.Text);
        sqlstr += " ,ProductTypeId = " + db.qo(ProdTypeList.Text);
        sqlstr += " ,ProductCheck = '0'";
        sqlstr += " where ProductId = " + db.qo(Session["ProductId"].ToString());
        db.runSQL(sqlstr);
        Session["ProductId"] = null;
		Response.Redirect("UpdateProduct.aspx?datames=1");
    }
}