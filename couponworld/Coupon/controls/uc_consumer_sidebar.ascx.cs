using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using System.Data;

namespace Coupon.controls
{
    public partial class uc_consumer_sidebar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindData();
        }

        private void bindData()
        {
            try
            {
                int totalcount = 0;
                string query = " where int_user_id = " + Session["cid"].ToString();
                tbl_member_bal objbal = new tbl_member_bal();

                DataSet ds = objbal.member_Select(query, 1, 10, out totalcount, "asc", "str_first_name");

                if (ds != null)
                {
                    img_retailer_pic.Src = ResolveUrl("~/Admin/member_logo/" + ds.Tables[0].Rows[0]["str_logo_img"].ToString());
                }
            }
            catch (Exception ex)
            {


            }

        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            if (fup_img.HasFile)
            {
                tbl_member_bal objbal = new tbl_member_bal();
                int _uid = Convert.ToInt32(Session["cid"].ToString());
                int _lResult = objbal.member_Update_profile_pic(_uid, fup_img.FileName);

                if (_lResult > 0)
                {
                    string _path = Server.MapPath("~/Admin/member_logo/");
                    fup_img.SaveAs(_path + fup_img.FileName);
                    bindData();
                }
            }
        }
    }
}