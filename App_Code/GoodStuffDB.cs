using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
/// <summary>
/// GoodStuffDB 的摘要描述
/// </summary>
public class GoodStuffDB
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LocalConnection"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    public DataTable SqlGetDataTable(string sqlstr)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlstr);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.Connection = con;
        sda.SelectCommand = cmd;
        DataTable dt = new DataTable();
        sda.Fill(dt);
        sda.Dispose();
        con.Close();
        return dt;
    }
    public void runSQL(string sqlstr)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlstr);
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        con.Close();
    }
    public string qo(string instr)
    {
        return "'" + instr + "'";
    }
    public string nqo(string instr)
    {
        return "N'" + instr + "'";
    }
    public string[] UpdateOneProduct(string Product_id)//找出一筆要做Update的Product資料
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT DISTINCT * FROM Product WHERE ProductId ="+ qo(Product_id)+";");
        SqlDataReader sda;
        cmd.Connection = con;
        sda = cmd.ExecuteReader();
        sda.Read();
        string[] ProductInfo = { sda["ProductName"].ToString() ,
            sda["ProductInfo"].ToString() , sda["ProductImage"].ToString() ,
            sda["ProductPCS"].ToString() , sda["ProductTypeId"].ToString(),
            sda["ProductPrice"].ToString(), sda["ProductShortage"].ToString() };
        sda.Dispose();
        con.Close();
        return ProductInfo;
    }
    public string[] GetUserShopData(string UserShopId)//找出User的ShopData
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Shop WHERE ShopId = " + qo(UserShopId) + ";");
        SqlDataReader sda;
        cmd.Connection = con;
        sda = cmd.ExecuteReader();
        sda.Read();
        string[] UserShopData = { sda["ShopName"].ToString(), sda["ShopAddress"].ToString() ,
            sda["ShopPhone"].ToString() , sda["ShopInfo"].ToString(), sda["ShopDetail"].ToString(),
            sda["ShopTypeId"].ToString(),sda["ShopImage"].ToString(),sda["ShopCheck"].ToString()};
        con.Close();
        sda.Close();
        return UserShopData;
    }
    public string UserNewShop(string NewShopName,string UserName)//User建立商店 登記ShopId 到User的基本資料裡
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT ShopId FROM Shop WHERE ShopName = " + nqo(NewShopName) + ";");
        SqlDataReader sda;
        cmd.Connection = con;
        sda = cmd.ExecuteReader();
        sda.Read();
        string UserNewShopId = sda["ShopId"].ToString();
        string sqlstr = "update AspNetUsers set ";
        sqlstr += " UserShopId = " + qo(UserNewShopId);
        sqlstr += " where UserName =" + nqo(UserName);
        con.Close();
        sda.Close();
        runSQL(sqlstr);
        return UserNewShopId;
    }
    public string UserIdentity(string UserName)//建立Session辨認商店與使用者
    {
        
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT UserShopId FROM AspNetUsers WHERE UserName="+qo(UserName) + ";");
        SqlDataReader sda;
        cmd.Connection = con;
        sda = cmd.ExecuteReader();
        sda.Read();
        string UserShopId = sda["UserShopId"].ToString();
        sda.Dispose();
        con.Close();
        return UserShopId;
    }
    public int[] getThumbnailImageScale(int maxWidth, int maxHeight, int oldWidth, int oldHeight)//設定圖片大小
    {
        int[] result = new int[] { 0, 0 };
        float widthDividend, heightDividend, commonDividend;

        widthDividend = (float)oldWidth / (float)maxWidth;
        heightDividend = (float)oldHeight / (float)maxHeight;

        commonDividend = (heightDividend > widthDividend) ? heightDividend : widthDividend;
        result[0] = (int)(oldWidth / commonDividend);
        result[1] = (int)(oldHeight / commonDividend);

        return result;
    }
    public bool ThumbnailCallback()
    {
        return false;
    }
}