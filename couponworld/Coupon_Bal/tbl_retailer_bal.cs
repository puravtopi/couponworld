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
    public class tbl_retailer_bal : Connection_Bal
    {
        public SqlCommand gComm;

        public int retailer_insert(tbl_retailer_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_tbl_retailer", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@str_retailer_name", objentity.str_retailer_name);
                gComm.Parameters.AddWithValue("@str_corporate_name", objentity.str_corporate_name);
                gComm.Parameters.AddWithValue("@str_email_id_p", objentity.str_email_id_p);
                gComm.Parameters.AddWithValue("@str_street_address", objentity.str_street_address);
                gComm.Parameters.AddWithValue("@str_password", objentity.str_password);
                gComm.Parameters.AddWithValue("@str_apt_suite", objentity.str_apt_suite);
                gComm.Parameters.AddWithValue("@int_city_id", objentity.int_city_id);
                gComm.Parameters.AddWithValue("@int_state_id", objentity.int_state_id);
                gComm.Parameters.AddWithValue("@int_zip_code", objentity.int_zip_code);
                gComm.Parameters.AddWithValue("@int_connect_cat", objentity.int_connect_cat);
                gComm.Parameters.AddWithValue("@int_connect_sub", objentity.int_connect_sub);
                gComm.Parameters.AddWithValue("@date_created_date", objentity.date_created_date);
                gComm.Parameters.AddWithValue("@bit_isactive", objentity.bit_isactive);
                gComm.Parameters.AddWithValue("@str_logo_img", objentity.str_logo_img);
                gComm.Parameters.AddWithValue("@str_telephone_p", objentity.str_telephone_p);
                gComm.Parameters.AddWithValue("@str_contact_1_p", objentity.str_contact_1_p);
                gComm.Parameters.AddWithValue("@str_contact_2_s", objentity.str_contact_2_s);
                gComm.Parameters.AddWithValue("@str_telephone_s", objentity.str_telephone_s);
                gComm.Parameters.AddWithValue("@str_email_id_s", objentity.str_email_id_s);
                //gComm.Parameters.AddWithValue("@int_share_type_id", objentity.int_share_type_id);
                gComm.Parameters.AddWithValue("@str_web_address", objentity.str_web_address);
                gComm.Parameters.AddWithValue("@str_report_op", objentity.str_report_op);
                gComm.Parameters.AddWithValue("@str_bio", objentity.str_bio);
                gComm.Parameters.AddWithValue("@bit_is_delete", objentity.bit_is_delete);
                gComm.Parameters.AddWithValue("@str_langitude", objentity.str_langitude);
                gComm.Parameters.AddWithValue("@str_latitude", objentity.str_latitude);
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

        public int retailer_delete(tbl_retailer_entity objentity)
        {
            int dbval = 0;
            try
            {
                gComm = new SqlCommand("usp_delete_tbl_retailer", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_retailer_id", objentity.int_retailer_id);

                gConn.Open();
                dbval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return dbval;
        }

        public int retailer_Update(tbl_retailer_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_retailer", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_retailer_id", objentity.int_retailer_id);
                gComm.Parameters.AddWithValue("@str_retailer_name", objentity.str_retailer_name);
                gComm.Parameters.AddWithValue("@str_corporate_name", objentity.str_corporate_name);
                gComm.Parameters.AddWithValue("@str_email_id_p", objentity.str_email_id_p);
                gComm.Parameters.AddWithValue("@str_street_address", objentity.str_street_address);
                gComm.Parameters.AddWithValue("@str_password", objentity.str_password);
                gComm.Parameters.AddWithValue("@str_apt_suite", objentity.str_apt_suite);
                gComm.Parameters.AddWithValue("@int_city_id", objentity.int_city_id);
                gComm.Parameters.AddWithValue("@int_state_id", objentity.int_state_id);
                gComm.Parameters.AddWithValue("@int_zip_code", objentity.int_zip_code);
                gComm.Parameters.AddWithValue("@str_bio", objentity.str_bio);
                gComm.Parameters.AddWithValue("@int_organization_share", objentity.int_organization_share);
                gComm.Parameters.AddWithValue("@str_logo_img", objentity.str_logo_img);
                gComm.Parameters.AddWithValue("@str_telephone_p", objentity.str_telephone_p);
                gComm.Parameters.AddWithValue("@str_contact_1_p", objentity.str_contact_1_p);
                gComm.Parameters.AddWithValue("@str_contact_2_s", objentity.str_contact_2_s);
                gComm.Parameters.AddWithValue("@str_telephone_s", objentity.str_telephone_s);
                gComm.Parameters.AddWithValue("@str_email_id_s", objentity.str_email_id_s);
                gComm.Parameters.AddWithValue("@int_share_type_id", objentity.int_share_type_id);
                gComm.Parameters.AddWithValue("@str_web_address", objentity.str_web_address);
                gComm.Parameters.AddWithValue("@dec_share_amount", objentity.dec_share_amount);
                gComm.Parameters.AddWithValue("@str_latitude", objentity.str_latitude);
                gComm.Parameters.AddWithValue("@str_langitude", objentity.str_langitude);
                gComm.Parameters.AddWithValue("@int_marketing_type_id", objentity.int_marketing_type_id);
                gComm.Parameters.AddWithValue("@int_connect_sub", objentity.int_connect_sub);
                gComm.Parameters.AddWithValue("@int_connect_cat", objentity.int_connect_cat);
                gComm.Parameters.AddWithValue("@dec_connect_fee", objentity.dec_connect_fee);
                gComm.Parameters.AddWithValue("@int_connect_fee_type", objentity.int_connect_fee_type);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }

        public int retailer_Update_profile(tbl_retailer_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_retailer_profile", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_retailer_id", objentity.int_retailer_id);
                gComm.Parameters.AddWithValue("@str_retailer_name", objentity.str_retailer_name);
                gComm.Parameters.AddWithValue("@str_corporate_name", objentity.str_corporate_name);
                gComm.Parameters.AddWithValue("@str_email_id_p", objentity.str_email_id_p);
                gComm.Parameters.AddWithValue("@str_street_address", objentity.str_street_address);

                gComm.Parameters.AddWithValue("@int_city_id", objentity.int_city_id);
                gComm.Parameters.AddWithValue("@int_state_id", objentity.int_state_id);
                gComm.Parameters.AddWithValue("@int_zip_code", objentity.int_zip_code);
              

                gComm.Parameters.AddWithValue("@str_telephone_p", objentity.str_telephone_p);
                gComm.Parameters.AddWithValue("@str_contact_1_p", objentity.str_contact_1_p);
                gComm.Parameters.AddWithValue("@str_contact_2_s", objentity.str_contact_2_s);
                gComm.Parameters.AddWithValue("@str_web_address", objentity.str_web_address);
                //gComm.Parameters.AddWithValue("@str_report_op", objentity.str_report_op);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }

        public DataSet retailer_Select(string query, int pageindex, int pagesize, out int totalrecords, string sortorder = "asc", string columnname = "str_retailer_name")
        {

            DataSet lds = null;
            totalrecords = 0;
            try
            {
                gComm = new SqlCommand("usp_select_tbl_retailer", gConn);
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

            return lds;

        }

        public int retailersign_up_insert(tbl_retailer_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_retailer", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@str_retailer_name", objentity.str_retailer_name);
                gComm.Parameters.AddWithValue("@str_email_id_p", objentity.str_email_id_p);
                gComm.Parameters.AddWithValue("@str_street_address", objentity.str_street_address);
                gComm.Parameters.AddWithValue("@str_password", objentity.str_password);
                gComm.Parameters.AddWithValue("@int_city_id", objentity.int_city_id);
                gComm.Parameters.AddWithValue("@int_state_id", objentity.int_state_id);
                gComm.Parameters.AddWithValue("@int_zip_code", objentity.int_zip_code);
                gComm.Parameters.AddWithValue("@date_created_date", objentity.date_created_date);

                gConn.Open();
                val = Convert.ToInt16(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return val;
        }

        public int retailer_status_Update(tbl_retailer_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_retailer_status", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_retailer_id", objentity.int_retailer_id);
                gComm.Parameters.AddWithValue("@bit_isactive", objentity.bit_isactive);
                gComm.Parameters.AddWithValue("@int_share_type_id", objentity.int_share_type_id);
                gComm.Parameters.AddWithValue("@dec_share_amount", objentity.dec_share_amount);
                gComm.Parameters.AddWithValue("@int_organization_share", objentity.int_organization_share);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }
        //
        public int retailer_bio_Update(tbl_retailer_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_tbl_retailer_bio_update", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_retailer_id", objentity.int_retailer_id);
                gComm.Parameters.AddWithValue("@str_bio", objentity.str_bio);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }
        public int retailer_active(string int_share_type_id, string int_organization_share, 
            string dec_share_amount, string int_retailer_id, string int_marketing_type_id,
             string int_connect_fee_type, string dec_connect_fee)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_activate_retailer", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_share_type_id", int_share_type_id);
                gComm.Parameters.AddWithValue("@int_organization_share", int_organization_share);
                gComm.Parameters.AddWithValue("@dec_share_amount", dec_share_amount);
                gComm.Parameters.AddWithValue("@int_retailer_id", int_retailer_id);
                gComm.Parameters.AddWithValue("@int_marketing_type_id", int_marketing_type_id);
                gComm.Parameters.AddWithValue("@int_connect_fee_type", int_connect_fee_type);
                gComm.Parameters.AddWithValue("@dec_connect_fee", dec_connect_fee);

                gConn.Open();
                val = Convert.ToInt16(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return val;
        }


        public DataSet retailer_connect_categorywise(string sub_cat_id)
        {

            DataSet lds = null;

            try
            {
                gComm = new SqlCommand("usp_retailer_categorywise_connect", gConn);
                gComm.CommandType = CommandType.StoredProcedure;


                gComm.Parameters.AddWithValue("@int_sub_cat_id", sub_cat_id); 


                gConn.Open();
                SqlDataAdapter lda = new SqlDataAdapter(gComm);
                lds = new DataSet();
                lda.Fill(lds);

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

        public int member_insert_sub_connect(string int_retailer_id, string int_cat_id, string str_sub_cat)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_insert_tbl_retailer_sub_connect", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_retailer_id", int_retailer_id);
                gComm.Parameters.AddWithValue("@int_cat_id", int_cat_id);
                gComm.Parameters.AddWithValue("@str_sub_cat", str_sub_cat);


                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }

        public DataSet retailer_select_connect_sub(string int_retailer_id)
        {

            DataSet lds = null;

            try
            {
                gComm = new SqlCommand("usp_select_retailer_connect_sub", gConn);
                gComm.CommandType = CommandType.StoredProcedure;


                gComm.Parameters.AddWithValue("@int_retailer_id", int_retailer_id);


                gConn.Open();
                SqlDataAdapter lda = new SqlDataAdapter(gComm);
                lds = new DataSet();
                lda.Fill(lds);

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
    }
}
