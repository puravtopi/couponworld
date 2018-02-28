using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using Coupon_Entity;
using System.Data;

namespace Coupon.Admin
{
    public partial class document_type_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddldeal_bind();
                btn_update.Visible = false;
                if (Request["docid"] != null)
                {
                    binddata(" where int_discount_type_id=" + Request.QueryString["docid"], 1);
                    btn_add.Visible = false;
                    btn_update.Visible = true;
                }
            }
        }

        protected void ddldeal_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_discount_type_bal statebal = new tbl_discount_type_bal();
                DataSet ds = statebal.deal_type_Select(" ", 1, 0, out totalrecord);

                ddl_deal.DataValueField = "int_deal_type_id";
                ddl_deal.DataTextField = "str_deal_name";

                ddl_deal.DataSource = ds;
                ddl_deal.DataBind();

                ddl_deal.Items.Insert(0, new ListItem("-- Select Deal --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void binddata(string query, int pageindex)
        {
            try
            {
                int totalcount;

                DataSet dt = new DataSet();

                tbl_discount_type_bal objbal = new tbl_discount_type_bal();

                dt = objbal.discount_type_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_doc_type.Text = dt.Tables[0].Rows[0]["str_discount_type"].ToString();
                    ddl_deal.SelectedValue = dt.Tables[0].Rows[0]["int_deal_type_id"].ToString();
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_discount_type_bal objbal = new tbl_discount_type_bal();
                tbl_discount_type_entity objentity = new tbl_discount_type_entity();

                objentity.str_discount_type = txt_doc_type.Text;
                objentity.int_deal_type_id = Convert.ToInt64(ddl_deal.SelectedItem.Value);
                objentity.date_create_date = Convert.ToDateTime(DateTime.Now.ToString("dd-MM-yyyy").ToString());
                objentity.bit_is_delete = false;

                int val = objbal.discount_type_insert(objentity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "Document Type Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_doc_type.Text = string.Empty;
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this Document Type is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_discount_type.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_discount_type_bal objbal = new tbl_discount_type_bal();
                tbl_discount_type_entity objentity = new tbl_discount_type_entity();

                objentity.int_discount_type_id = Convert.ToInt64(Request.QueryString["docid"].ToString());
                objentity.str_discount_type = txt_doc_type.Text;
                objentity.int_deal_type_id = Convert.ToInt64(ddl_deal.SelectedItem.Value);
                int val = objbal.discount_type_Update(objentity);
                if (val > 0)
                {
                    Response.Redirect("view_discount_type.aspx");
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}