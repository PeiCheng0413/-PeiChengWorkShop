using System;
using System.IO;
using System.Web.UI;
using System.Data;
using System.Drawing;


public partial class ShopManage : System.Web.UI.Page
{
    GoodStuffDB db = new GoodStuffDB();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if (Session["UserShopId"].ToString() == "0")
                    {
                        UpDate.Text = "註冊攤位";
                        GetTypeList();
                    }
                    else if (Session["UserShopId"] == null)
                    {
                        Response.Redirect("GoodStuff");
                    }
                    else
                    {
                        GetShopData();
                    }
                }
                catch
                {
                    Response.Redirect("GoodStuff");
                }
            }
        }
        else
        {
            Response.Redirect("~/Account/Login");
        }
        int x = Convert.ToInt32(Request["ms"]);
        if (x == 1)
            ShowMessage.Text = "您還沒有攤位，請先申請攤位";


    }
	void GetTypeList()
    {     
        DataTable Shop_Type_DT = new DataTable();
        Shop_Type_DT = db.SqlGetDataTable("SELECT * FROM SType");
        ShopTypeList.DataSource = Shop_Type_DT;
        ShopTypeList.DataTextField = "STypeName";
        ShopTypeList.DataValueField = "STypeId";
        ShopTypeList.DataBind();
    }
    void GetShopData()
    {
        GetTypeList();
        string[] UserShopData;
        UserShopData = db.GetUserShopData(Session["UserShopId"].ToString());

        ShopName.Text = UserShopData[0];
        ShopAddress.Text = UserShopData[1];
        ShopPhone.Text = UserShopData[2];
        ShopIntrodu.Text = UserShopData[3];
        ShopDetail.Text = UserShopData[4];
		ShopTypeList.SelectedIndex = ShopTypeList.Items.IndexOf(ShopTypeList.Items.FindByValue(UserShopData[5]));
        picture.ImageUrl = "~/shoppic/" + UserShopData[6];
        ShopPicName.Text = UserShopData[6];
        if (UserShopData[7] == "True")
        {
            CheckLabel.Text = "審核通過 攤位刊登中";
            CheckLabel.ForeColor = System.Drawing.Color.Green; 
        }
        else
        {
            CheckLabel.Text = "審核中 攤位尚未刊登";
            CheckLabel.ForeColor = System.Drawing.Color.Red; 
        }
    }
    protected void UpDate_Click(object sender, EventArgs e)
    {
        if (Session["UserShopId"].ToString() == "0")
            InsertNewShop();
        else
            UpdateUserShop();
    }
    void InsertNewShop()
    {
        string sqlstr = "insert into Shop(ShopName, ShopAddress, ShopPhone, ShopInfo, ShopImage, ShopDetail, ShopTypeId, ShopDate) values(";
        sqlstr += db.nqo(ShopName.Text) + ",";
        sqlstr += db.nqo(ShopAddress.Text) + ",";
        sqlstr += db.qo(ShopPhone.Text) + ",";
        sqlstr += db.nqo(ShopIntrodu.Text) + ",";
		sqlstr += db.qo(ShopPicName.Text) + ",";
        sqlstr += db.nqo(ShopDetail.Text) + ",";
		sqlstr += db.qo(ShopTypeList.Text) + ",";
		sqlstr += db.qo(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff")) + ")";
        db.runSQL(sqlstr);
        Session["UserShopId"]= db.UserNewShop(ShopName.Text, Session["UserName"].ToString());
        ShowMessage.Text="歡迎加入小農的行列 請等待管理員的審核";
    }
    void UpdateUserShop()
    {
        string sqlstr;
        sqlstr = "update Shop set ";
        sqlstr += " ShopName = " + db.nqo(ShopName.Text) + ",";
        sqlstr += " ShopAddress = " + db.nqo(ShopAddress.Text) + ",";
        sqlstr += " ShopPhone = " + db.qo(ShopPhone.Text) + ",";
        sqlstr += " ShopInfo = " + db.nqo(ShopIntrodu.Text) + ",";
        sqlstr += " ShopImage = " + db. qo(ShopPicName.Text) + ",";
        sqlstr += " ShopDetail = " + db.nqo(ShopDetail.Text) + ",";
        sqlstr += " ShopNews = " + db.nqo(ShopDetail.Text) + ",";
        sqlstr += " ShopTypeId = " + db.qo(ShopTypeList.Text) + ",";
        sqlstr += " ShopCheck = '0'";		
        sqlstr += "  where ShopId = " + db.qo(Session["UserShopId"].ToString());
        db.runSQL(sqlstr);
        GetShopData();
		ShowMessage.Text = "您的攤位資料已更新成功";
    }
    protected void UploadPic_Click(object sender, EventArgs e)
    {
		if (PicPath.HasFile)
        {
			DateTime dt = DateTime.Now;
            String TempSavePath = Server.MapPath("~/shoppic/temp/");
            String SavePath = Server.MapPath("~/shoppic/");
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
            picture.ImageUrl = @"~\shoppic\" +NewPicFileName;
            ShopPicName.Text = NewPicFileName;
			
		}
    }
}