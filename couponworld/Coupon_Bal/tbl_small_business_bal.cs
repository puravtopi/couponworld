using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Coupon_Bal;
using Coupon_Entity;

namespace Coupon_Bal
{
    public class tbl_small_business_bal : Connection_Bal
    {
        public SqlCommand gComm;
        public DataSet small_business_Select(string query, int pageindex, int pagesize, out int totalrecords, string sortorder = "asc", string columnname = "str_name")
        {

            DataSet lds = null;
            totalrecords = 0;
            try
            {
                gComm = new SqlCommand("usp_select_tbl_small_business", gConn);
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
                gConn.Dispose();
            }
            return lds;

        }

        public int small_business_insert(tbl_small_business_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_tbl_small_business", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@str_name", objentity.str_name);
                gComm.Parameters.AddWithValue("@str_corporate_name", objentity.str_corporate_name);
                gComm.Parameters.AddWithValue("@str_email_id_p", objentity.str_email_id_p);
                gComm.Parameters.AddWithValue("@str_street_address", objentity.str_street_address);
                gComm.Parameters.AddWithValue("@str_password", objentity.str_password);
                gComm.Parameters.AddWithValue("@str_apt_suite", objentity.str_apt_suite);
                gComm.Parameters.AddWithValue("@int_city_id", objentity.int_city_id);
                gComm.Parameters.AddWithValue("@int_state_id", objentity.int_state_id);
                gComm.Parameters.AddWithValue("@int_zip_code", objentity.int_zip_code);
                //gComm.Parameters.AddWithValue("@int_organization_share", objentity.int_organization_share);
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

                gConn.Open();
                val = Convert.ToInt16(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return val;
        }

        public int small_business_delete(tbl_small_business_entity objentity)
        {
            int dbval = 0;
            try
            {
                gComm = new SqlCommand("usp_delete_tbl_small_business", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_small_business_id", objentity.int_small_business_id);

                gConn.Open();
                dbval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return dbval;
        }

        public int small_business_Update(tbl_small_business_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_small_business", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_small_business_id", objentity.int_small_business_id);
                gComm.Parameters.AddWithValue("@str_name", objentity.str_name);
                gComm.Parameters.AddWithValue("@str_corporate_name", objentity.str_corporate_name);
                gComm.Parameters.AddWithValue("@str_email_id_p", objentity.str_email_id_p);
                gComm.Parameters.AddWithValue("@str_street_address", objentity.str_street_address);
                gComm.Parameters.AddWithValue("@str_password", objentity.str_password);
                gComm.Parameters.AddWithValue("@str_apt_suite", objentity.str_apt_suite);
                gComm.Parameters.AddWithValue("@int_city_id", objentity.int_city_id);
                gComm.Parameters.AddWithValue("@int_state_id", objentity.int_state_id);
                gComm.Parameters.AddWithValue("@int_zip_code", objentity.int_zip_code);
                gComm.Parameters.AddWithValue("@int_small_business_type_id", objentity.int_small_business_type_id);
                gComm.Parameters.AddWithValue("@int_organization_share", objentity.int_organization_share);
                gComm.Parameters.AddWithValue("@str_logo_img", objentity.str_logo_img);
                gComm.Parameters.AddWithValue("@str_telephone_p", objentity.str_telephone_p);
                gComm.Parameters.AddWithValue("@str_contact_1_p", objentity.str_contact_1_p);
                gComm.Parameters.AddWithValue("@str_contact_2_s", objentity.str_contact_2_s);
                gComm.Parameters.AddWithValue("@str_telephone_s", objentity.str_telephone_s);
                gComm.Parameters.AddWithValue("@str_email_id_s", objentity.str_email_id_s);
                gComm.Parameters.AddWithValue("@int_share_type_id", objentity.int_share_type_id);
                gComm.Parameters.AddWithValue("@str_web_address", objentity.str_web_address);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }

        public int small_business_status_Update(tbl_small_business_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_small_business_status", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_small_business_id", objentity.int_small_business_id);
                gComm.Parameters.AddWithValue("@bit_isactive", objentity.bit_isactive);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }

        public int sb_active(string int_share_type_id, string int_small_business_type_id, string dec_share_amount, string int_small_business_id)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_activate_small_business", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_share_type_id", int_share_type_id);
                gComm.Parameters.AddWithValue("@int_small_business_type_id", int_small_business_type_id);
                gComm.Parameters.AddWithValue("@dec_share_amount", dec_share_amount);
                gComm.Parameters.AddWithValue("@int_small_business_id", int_small_business_id);

                gConn.Open();
                val = Convert.ToInt16(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return val;
        }

        public int sb_Update_profile(tbl_small_business_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_small_business_profile", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_small_business_id", objentity.int_small_business_id);
                gComm.Parameters.AddWithValue("@str_name", objentity.str_name);
                gComm.Parameters.AddWithValue("@str_corporate_name", objentity.str_corporate_name);
                gComm.Parameters.AddWithValue("@str_email_id_p", objentity.str_email_id_p);
                gComm.Parameters.AddWithValue("@str_street_address", objentity.str_street_address);

                gComm.Parameters.AddWithValue("@int_city_id", objentity.int_city_id);
                gComm.Parameters.AddWithValue("@int_state_id", objentity.int_state_id);
                gComm.Parameters.AddWithValue("@int_zip_code", objentity.int_zip_code);
                gComm.Parameters.AddWithValue("@int_small_business_type_id", objentity.int_small_business_type_id);

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

        public int sb_bio_Update(tbl_small_business_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_small_business_bio", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_small_business_id", objentity.int_small_business_id);
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
    }
}
//