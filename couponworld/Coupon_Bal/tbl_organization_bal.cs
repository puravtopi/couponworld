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
    public class tbl_organization_bal : Connection_Bal
    {
        public SqlCommand gComm;

        public int organization_insert(tbl_organization_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_tbl_organization", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@str_organization_name", objentity.str_organization_name);
                gComm.Parameters.AddWithValue("@str_corporate_name", objentity.str_corporate_name);
                gComm.Parameters.AddWithValue("@str_email_id_p", objentity.str_email_id_p);
                gComm.Parameters.AddWithValue("@str_street_address", objentity.str_street_address);
                gComm.Parameters.AddWithValue("@str_password", objentity.str_password);
                gComm.Parameters.AddWithValue("@str_apt_suite", objentity.str_apt_suite);
                gComm.Parameters.AddWithValue("@int_city_id", objentity.int_city_id);
                gComm.Parameters.AddWithValue("@int_state_id", objentity.int_state_id);
                gComm.Parameters.AddWithValue("@int_zip_code", objentity.int_zip_code);
                gComm.Parameters.AddWithValue("@int_organization_share", objentity.int_organization_share);
                gComm.Parameters.AddWithValue("@date_created_date", objentity.date_created_date);
                gComm.Parameters.AddWithValue("@bit_isactive", objentity.bit_isactive);
                gComm.Parameters.AddWithValue("@int_organization_type_id", objentity.int_organization_type_id);
                gComm.Parameters.AddWithValue("@int_share_type_id", objentity.int_share_type_id);
                gComm.Parameters.AddWithValue("@str_telephone_p", objentity.str_telephone_p);
                gComm.Parameters.AddWithValue("@str_contact_1_p", objentity.str_contact_1_p);
                gComm.Parameters.AddWithValue("@str_contact_2_s", objentity.str_contact_2_s);
                gComm.Parameters.AddWithValue("@str_telephone_s", objentity.str_telephone_s);
                gComm.Parameters.AddWithValue("@str_email_id_s", objentity.str_email_id_s);
                gComm.Parameters.AddWithValue("@str_web_address", objentity.str_web_address);
                gComm.Parameters.AddWithValue("@str_logo_img", objentity.str_logo_img);
                gComm.Parameters.AddWithValue("@bit_spotlight", objentity.bit_spotlight);
                gComm.Parameters.AddWithValue("@date_update_date", DBNull.Value);
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

        public int organization_delete(tbl_organization_entity objentity)
        {
            int dbval = 0;
            try
            {
                gComm = new SqlCommand("usp_delete_tbl_organization", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_organization_id", objentity.int_organization_id);

                gConn.Open();
                dbval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return dbval;
        }

        public int organization_Update(tbl_organization_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_organization", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_organization_id", objentity.int_organization_id);
                gComm.Parameters.AddWithValue("@str_organization_name", objentity.str_organization_name);
                gComm.Parameters.AddWithValue("@str_corporate_name", objentity.str_corporate_name);
                gComm.Parameters.AddWithValue("@str_email_id_p", objentity.str_email_id_p);
                gComm.Parameters.AddWithValue("@str_street_address", objentity.str_street_address);
                gComm.Parameters.AddWithValue("@str_password", objentity.str_password);
                gComm.Parameters.AddWithValue("@str_apt_suite", objentity.str_apt_suite);
                gComm.Parameters.AddWithValue("@int_city_id", objentity.int_city_id);
                gComm.Parameters.AddWithValue("@int_state_id", objentity.int_state_id);
                gComm.Parameters.AddWithValue("@int_zip_code", objentity.int_zip_code);
                gComm.Parameters.AddWithValue("@int_organization_share", objentity.int_organization_share);
                gComm.Parameters.AddWithValue("@int_organization_type_id", objentity.int_organization_type_id);
                gComm.Parameters.AddWithValue("@int_share_type_id", objentity.int_share_type_id);
                gComm.Parameters.AddWithValue("@str_telephone_p", objentity.str_telephone_p);
                gComm.Parameters.AddWithValue("@str_contact_1_p", objentity.str_contact_1_p);
                gComm.Parameters.AddWithValue("@str_contact_2_s", objentity.str_contact_2_s);
                gComm.Parameters.AddWithValue("@str_telephone_s", objentity.str_telephone_s);
                gComm.Parameters.AddWithValue("@str_email_id_s", objentity.str_email_id_s);
                gComm.Parameters.AddWithValue("@str_web_address", objentity.str_web_address);
                gComm.Parameters.AddWithValue("@str_logo_img", objentity.str_logo_img);
                gComm.Parameters.AddWithValue("@bit_spotlight", objentity.bit_spotlight);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }

        public DataSet organization_Select(string query, int pageindex, int pagesize, out int totalrecords, string sortorder = "asc", string columnname = "str_organization_name")
        {

            DataSet lds = null;
            totalrecords = 0;
            try
            {
                gComm = new SqlCommand("usp_select_tbl_organization", gConn);
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

        public DataSet organization_count()
        {
            DataSet lds = null;
            try
            {
                gComm = new SqlCommand("count_organization", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

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
                gConn.Dispose();
            }
            return lds;
        }

        public int org_insert(tbl_organization_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_org", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@str_organization_name", objentity.str_organization_name);
                gComm.Parameters.AddWithValue("@str_corporate_name", objentity.str_corporate_name);
                gComm.Parameters.AddWithValue("@str_email_id_p", objentity.str_email_id_p);
                gComm.Parameters.AddWithValue("@str_street_address", objentity.str_street_address);
                gComm.Parameters.AddWithValue("@str_password", objentity.str_password);
                gComm.Parameters.AddWithValue("@int_city_id", objentity.int_city_id);
                gComm.Parameters.AddWithValue("@int_state_id", objentity.int_state_id);
                gComm.Parameters.AddWithValue("@int_zip_code", objentity.int_zip_code);
                gComm.Parameters.AddWithValue("@date_created_date", objentity.date_created_date);
                gComm.Parameters.AddWithValue("@bit_isactive", objentity.bit_isactive);
                gComm.Parameters.AddWithValue("@str_telephone_p", objentity.str_telephone_p);
                gComm.Parameters.AddWithValue("@str_contact_1_p", objentity.str_contact_1_p);
                gComm.Parameters.AddWithValue("@str_contact_2_s", objentity.str_contact_2_s);
                gComm.Parameters.AddWithValue("@str_telephone_s", objentity.str_telephone_s);
                gComm.Parameters.AddWithValue("@str_email_id_s", objentity.str_email_id_s);
                gComm.Parameters.AddWithValue("@str_web_address", objentity.str_web_address);
                gComm.Parameters.AddWithValue("@str_logo_img", objentity.str_logo_img);
                gComm.Parameters.AddWithValue("@bit_spotlight", objentity.bit_spotlight);
                gComm.Parameters.AddWithValue("@bit_is_delete", objentity.bit_is_delete);

                gConn.Open();
                val = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {
                gConn.Close();
            }
            return val;
        }

        public int org_Update_profile(tbl_organization_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_organization_profile", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_organization_id", objentity.int_organization_id);
                gComm.Parameters.AddWithValue("@str_organization_name", objentity.str_organization_name);
                gComm.Parameters.AddWithValue("@str_corporate_name", objentity.str_corporate_name);
                gComm.Parameters.AddWithValue("@str_email_id_p", objentity.str_email_id_p);
                gComm.Parameters.AddWithValue("@str_street_address", objentity.str_street_address);

                gComm.Parameters.AddWithValue("@int_city_id", objentity.int_city_id);
                gComm.Parameters.AddWithValue("@int_state_id", objentity.int_state_id);
                gComm.Parameters.AddWithValue("@int_zip_code", objentity.int_zip_code);
                gComm.Parameters.AddWithValue("@int_organization_type_id", objentity.int_organization_type_id);

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
        public int organization_spotlight_Update(tbl_organization_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_org_spotlight", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_organization_id", objentity.int_organization_id);
                gComm.Parameters.AddWithValue("@bit_spotlight", objentity.bit_spotlight);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }
        public int organization_spotlight_deactive(tbl_organization_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_org_spot_deactive", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_organization_id", objentity.int_organization_id);
                gComm.Parameters.AddWithValue("@bit_spotlight", objentity.bit_spotlight);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }
        public int org_active(string int_share_type_id, string int_organization_type_id, string int_organization_id)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_activate_tbl_organization", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_share_type_id", int_share_type_id);
                gComm.Parameters.AddWithValue("@int_organization_type_id", int_organization_type_id);
                gComm.Parameters.AddWithValue("@int_organization_id", int_organization_id);

                gConn.Open();
                val = Convert.ToInt16(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return val;
        }
    }
}
//