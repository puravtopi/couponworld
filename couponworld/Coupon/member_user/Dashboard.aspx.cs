using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using System.Data;
using System.Text;

namespace Coupon.member_user
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        public string DataTableToJSONWithStringBuilder(DataTable table)
        {
            var JSONString = new StringBuilder();
            if (table.Rows.Count > 0)
            {
                JSONString.Append("[");
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    JSONString.Append("{");
                    for (int j = 0; j < table.Columns.Count; j++)
                    {
                        if (j < table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == table.Rows.Count - 1)
                    {
                        JSONString.Append("}");
                    }
                    else
                    {
                        JSONString.Append("},");
                    }
                }
                JSONString.Append("]");
            }
            return JSONString.ToString();
        }

        [WebMethod()]
        public static string getChartData()
        {
            tbl_member_bal objbal = new tbl_member_bal();
            int userid = Convert.ToInt32(HttpContext.Current.Session["cid"].ToString());
            DataSet ds = objbal.member_categorywise_purchase(userid);
            string str = "";

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                Dashboard obj = new Dashboard();
                str = obj.DataTableToJSONWithStringBuilder(ds.Tables[0]);
            }
            else
            {
                Dashboard obj = new Dashboard();
                str = obj.DataTableToJSONWithStringBuilder(obj.getDefaultDataset());
            }

            return str;
        }

        [WebMethod()]
        public static string getChartDataRetailer()
        {
            tbl_member_bal objbal = new tbl_member_bal();
            int userid = Convert.ToInt32(HttpContext.Current.Session["cid"].ToString());
            DataSet ds = objbal.member_retailerwise_purchase(userid);
            string str = "";

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                Dashboard obj = new Dashboard();
                str = obj.DataTableToJSONWithStringBuilder(ds.Tables[0]);


            }

            return str;
        }

        public DataTable getDefaultDataset()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[2] {
                            new DataColumn("str_category_name", typeof(string)),
                            new DataColumn("Total",typeof(decimal)) });

            int totalrecords = 0;
            tbl_category_bal objbal = new tbl_category_bal();
            DataSet ds = objbal.category_Select("", 1, 0, out totalrecords);

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dt.Rows.Add(ds.Tables[0].Rows[i]["str_category_name"].ToString(), 0.0);

            }

            return dt;
        }
    }


}