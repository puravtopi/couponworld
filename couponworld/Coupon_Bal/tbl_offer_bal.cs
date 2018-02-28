using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Coupon_Entity;

namespace Coupon_Bal
{
    public class tbl_offer_bal : Connection_Bal
    {
        public SqlCommand gComm;
        public int offer_insert(tbl_offer_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_tbl_offer", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@str_offer_name", objentity.str_offer_name);
                gComm.Parameters.AddWithValue("@str_offer_details", objentity.str_offer_details);
                gComm.Parameters.AddWithValue("@int_discount_type_id", objentity.int_discount_type_id);
                gComm.Parameters.AddWithValue("@int_deal_type_id", objentity.int_deal_type_id);
                gComm.Parameters.AddWithValue("@dec_original_price", objentity.dec_original_price);
                gComm.Parameters.AddWithValue("@dec_discount_amount", objentity.dec_discount_amount);
                gComm.Parameters.AddWithValue("@dec_savings", objentity.dec_savings);
                gComm.Parameters.AddWithValue("@int_retailer_id", objentity.int_retailer_id);
                gComm.Parameters.AddWithValue("@date_start_date", objentity.date_start_date);
                gComm.Parameters.AddWithValue("@date_end_date", objentity.date_end_date);
                gComm.Parameters.AddWithValue("@bit_isactive", objentity.bit_isactive);
                gComm.Parameters.AddWithValue("@str_img", objentity.str_img);
                gComm.Parameters.AddWithValue("@int_category_id", objentity.int_category_id);
                gComm.Parameters.AddWithValue("@int_sub_category_id", objentity.int_sub_category_id);
                gComm.Parameters.AddWithValue("@bit_accept", objentity.bit_accept);
                gComm.Parameters.AddWithValue("@int_small_business_id", objentity.int_small_business_id);
                gComm.Parameters.AddWithValue("@int_organization_share", objentity.int_organization_share);
                gComm.Parameters.AddWithValue("@str_sponsor", objentity.str_sponsor);
                gComm.Parameters.AddWithValue("@str_limitation", objentity.str_limitation);
                gComm.Parameters.AddWithValue("@date_created_date", objentity.date_created_date);
                gComm.Parameters.AddWithValue("@date_update_date", DBNull.Value);
                gComm.Parameters.AddWithValue("@bit_is_delete", objentity.bit_is_delete);
                gComm.Parameters.AddWithValue("@bit_is_treading", objentity.bit_is_treading);
                gComm.Parameters.AddWithValue("@bit_is_featured", objentity.bit_is_featured);
                gComm.Parameters.AddWithValue("@dec_marketing_fee", objentity.dec_marketing_fee);
                gComm.Parameters.AddWithValue("@int_marketing_type_id", objentity.int_marketing_type_id);

                gConn.Open();
                val = Convert.ToInt16(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return val;
        }

        public int offer_delete(tbl_offer_entity objentity)
        {
            int dbval = 0;
            try
            {
                gComm = new SqlCommand("usp_delete_tbl_offer", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_offer_id", objentity.int_offer_id);

                gConn.Open();
                dbval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return dbval;
        }

        public int offer_Update(tbl_offer_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_offer", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_offer_id", objentity.int_offer_id);
                gComm.Parameters.AddWithValue("@str_offer_name", objentity.str_offer_name);
                gComm.Parameters.AddWithValue("@str_offer_details", objentity.str_offer_details);
                gComm.Parameters.AddWithValue("@int_discount_type_id", objentity.int_discount_type_id);
                gComm.Parameters.AddWithValue("@int_deal_type_id", objentity.int_deal_type_id);
                gComm.Parameters.AddWithValue("@dec_original_price", objentity.dec_original_price);
                gComm.Parameters.AddWithValue("@dec_discount_amount", objentity.dec_discount_amount);
                gComm.Parameters.AddWithValue("@dec_savings", objentity.dec_savings);
                gComm.Parameters.AddWithValue("@int_retailer_id", objentity.int_retailer_id);
                gComm.Parameters.AddWithValue("@date_start_date", objentity.date_start_date);
                gComm.Parameters.AddWithValue("@date_end_date", objentity.date_end_date);
                gComm.Parameters.AddWithValue("@str_img", objentity.str_img);
                gComm.Parameters.AddWithValue("@int_category_id", objentity.int_category_id);
                gComm.Parameters.AddWithValue("@int_sub_category_id", objentity.int_sub_category_id);
                gComm.Parameters.AddWithValue("@int_small_business_id", objentity.int_small_business_id);
                gComm.Parameters.AddWithValue("@int_organization_share", objentity.int_organization_share);
                gComm.Parameters.AddWithValue("@str_sponsor", objentity.str_sponsor);
                gComm.Parameters.AddWithValue("@str_limitation", objentity.str_limitation);
                gComm.Parameters.AddWithValue("@bit_is_treading", objentity.bit_is_treading);
                gComm.Parameters.AddWithValue("@bit_is_featured", objentity.bit_is_featured);
                gComm.Parameters.AddWithValue("@dec_marketing_fee", objentity.dec_marketing_fee);
                gComm.Parameters.AddWithValue("@int_marketing_type_id", objentity.int_marketing_type_id);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }

        public DataSet offer_Select(string query, int pageindex, int pagesize, out int totalrecords, string sortorder = "asc", string columnname = "str_offer_name")
        {

            DataSet lds = null;
            totalrecords = 0;
            try
            {
                gComm = new SqlCommand("usp_select_tbl_offer", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@PageIndex", pageindex);
                gComm.Parameters.AddWithValue("@cnd", query);

                gComm.Parameters.AddWithValue("@ordercolumn", columnname);
                gComm.Parameters.AddWithValue("@sortorder", sortorder);

                gComm.Parameters.AddWithValue("@PageSize", pagesize);
                gComm.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                gComm.Parameters["@RecordCount"].Direction = ParameterDirection.Output;



                gConn.Open();
                SqlDataAdapter lda = new SqlDataAdapter(gComm);
                lds = new DataSet();
                lda.Fill(lds);


                totalrecords = Convert.ToInt32(gComm.Parameters["@RecordCount"].Value);


                gConn.Close();


            }
            catch (Exception ex)
            {
                gConn.Close();
            }
            finally
            {
                gConn.Close();
            }
            return lds;

        }

        public int retailer_status_Update(tbl_offer_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_offer_status", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_offer_id", objentity.int_offer_id);
                gComm.Parameters.AddWithValue("@bit_accept", objentity.bit_accept);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }

        public int retailer_status_Update_deactive(tbl_offer_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_offer_status_deactive", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_offer_id", objentity.int_offer_id);
                gComm.Parameters.AddWithValue("@bit_accept", objentity.bit_accept);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }
    }
}
