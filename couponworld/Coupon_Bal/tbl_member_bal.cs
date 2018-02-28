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
    public class tbl_member_bal : Connection_Bal
    {
        public SqlCommand gComm;

        public int member_insert(tbl_member_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_tbl_member", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@str_first_name", objentity.str_first_name);
                gComm.Parameters.AddWithValue("@str_middle_name", objentity.str_middle_name);
                gComm.Parameters.AddWithValue("@str_last_name", objentity.str_last_name);
                gComm.Parameters.AddWithValue("@str_password", objentity.str_password);
                gComm.Parameters.AddWithValue("@str_email_id", objentity.str_email_id);
                gComm.Parameters.AddWithValue("@str_designation", objentity.str_designation);
                gComm.Parameters.AddWithValue("@int_group_id", objentity.int_group_id);
                gComm.Parameters.AddWithValue("@str_gender", objentity.str_gender);
                gComm.Parameters.AddWithValue("@int_age_group_id", objentity.int_age_group_id);
                gComm.Parameters.AddWithValue("@str_apt_suite", objentity.str_apt_suite);
                gComm.Parameters.AddWithValue("@str_street_address", objentity.str_street_address);
                gComm.Parameters.AddWithValue("@int_city_id", objentity.int_city_id);
                gComm.Parameters.AddWithValue("@int_state_id", objentity.int_state_id);
                gComm.Parameters.AddWithValue("@int_zip_code", objentity.int_zip_code);
                gComm.Parameters.AddWithValue("@date_create_date", objentity.date_create_date);
                gComm.Parameters.AddWithValue("@bit_isactive", objentity.bit_isactive);
                gComm.Parameters.AddWithValue("@str_telephone", objentity.str_telephone);
                gComm.Parameters.AddWithValue("@str_date_of_birth", objentity.str_date_of_birth);
                gComm.Parameters.AddWithValue("@int_organization_id", objentity.int_organization_id);
                gComm.Parameters.AddWithValue("@int_company_id", objentity.int_company_id);
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

        public int member_delete(tbl_member_entity objentity)
        {
            int dbval = 0;
            try
            {
                gComm = new SqlCommand("usp_delete_tbl_member", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_user_id", objentity.int_user_id);

                gConn.Open();
                dbval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return dbval;
        }

        public int member_Update(tbl_member_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_member", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_user_id", objentity.int_user_id);
                gComm.Parameters.AddWithValue("@str_first_name", objentity.str_first_name);
                gComm.Parameters.AddWithValue("@str_last_name", objentity.str_last_name);
                gComm.Parameters.AddWithValue("@str_password", objentity.str_password);
                gComm.Parameters.AddWithValue("@str_email_id", objentity.str_email_id);
                gComm.Parameters.AddWithValue("@str_gender", objentity.str_gender);
                gComm.Parameters.AddWithValue("@str_street_address", objentity.str_street_address);
                gComm.Parameters.AddWithValue("@int_city_id", objentity.int_city_id);
                gComm.Parameters.AddWithValue("@int_state_id", objentity.int_state_id);
                gComm.Parameters.AddWithValue("@int_zip_code", objentity.int_zip_code);
                gComm.Parameters.AddWithValue("@str_telephone", objentity.str_telephone);
                gComm.Parameters.AddWithValue("@str_date_of_birth", objentity.str_date_of_birth);
                gComm.Parameters.AddWithValue("@int_organization_id", objentity.int_organization_id);
                gComm.Parameters.AddWithValue("@int_company_id", objentity.int_company_id);
                gComm.Parameters.AddWithValue("@str_logo_img", objentity.str_logo_img);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }

        public DataSet member_Select(string query, int pageindex, int pagesize, out int totalrecords, string sortorder = "asc", string columnname = "str_first_name")
        {

            DataSet lds = null;
            totalrecords = 0;
            try
            {
                gComm = new SqlCommand("usp_select_tbl_member", gConn);
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

        public int member_sign_up_insert(tbl_member_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_tbl_member_sign_up", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@str_first_name", objentity.str_first_name);
                gComm.Parameters.AddWithValue("@str_last_name", objentity.str_last_name);
                gComm.Parameters.AddWithValue("@str_password", objentity.str_password);
                gComm.Parameters.AddWithValue("@str_email_id", objentity.str_email_id);
                gComm.Parameters.AddWithValue("@str_gender", objentity.str_gender);
                gComm.Parameters.AddWithValue("@str_street_address", objentity.str_street_address);
                gComm.Parameters.AddWithValue("@int_city_id", objentity.int_city_id);
                gComm.Parameters.AddWithValue("@int_state_id", objentity.int_state_id);
                gComm.Parameters.AddWithValue("@int_zip_code", objentity.int_zip_code);
                gComm.Parameters.AddWithValue("@date_create_date", objentity.date_create_date);
                gComm.Parameters.AddWithValue("@bit_isactive", objentity.bit_isactive);
                gComm.Parameters.AddWithValue("@str_telephone", objentity.str_telephone);
                gComm.Parameters.AddWithValue("@str_date_of_birth", objentity.str_date_of_birth);
                gComm.Parameters.AddWithValue("@int_organization_id", objentity.int_organization_id);
                gComm.Parameters.AddWithValue("@int_company_id", objentity.int_company_id);
                gComm.Parameters.AddWithValue("@str_logo_img", objentity.str_logo_img);
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

        public int member_Update_profile(tbl_member_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_member_profile", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_user_id", objentity.int_user_id);
                gComm.Parameters.AddWithValue("@str_first_name", objentity.str_first_name);
                gComm.Parameters.AddWithValue("@str_last_name", objentity.str_last_name);
                gComm.Parameters.AddWithValue("@str_email_id", objentity.str_email_id);
                gComm.Parameters.AddWithValue("@str_gender", objentity.str_gender);
                gComm.Parameters.AddWithValue("@str_street_address", objentity.str_street_address);
                gComm.Parameters.AddWithValue("@int_city_id", objentity.int_city_id);
                gComm.Parameters.AddWithValue("@int_state_id", objentity.int_state_id);
                gComm.Parameters.AddWithValue("@int_zip_code", objentity.int_zip_code);
                gComm.Parameters.AddWithValue("@str_telephone", objentity.str_telephone);
                gComm.Parameters.AddWithValue("@str_date_of_birth", objentity.str_date_of_birth);
                gComm.Parameters.AddWithValue("@int_organization_id", objentity.int_organization_id);
                gComm.Parameters.AddWithValue("@int_company_id", objentity.int_company_id);


                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }

        public DataSet member_categorywise_purchase(int int_user_id)
        {

            DataSet lds = null;

            try
            {
                gComm = new SqlCommand("usp_consumer_categorywise_saving", gConn);
                gComm.CommandType = CommandType.StoredProcedure;



                gComm.Parameters.AddWithValue("@int_user_id", int_user_id);



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

        public DataSet member_retailerwise_purchase(int int_user_id)
        {

            DataSet lds = null;

            try
            {
                gComm = new SqlCommand("usp_consumer_retailerwise_saving", gConn);
                gComm.CommandType = CommandType.StoredProcedure;



                gComm.Parameters.AddWithValue("@int_user_id", int_user_id);



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

        public int member_Update_profile_pic(int int_user_id, string str_logo_img)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_change_profile_pic", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_user_id", int_user_id);
                gComm.Parameters.AddWithValue("@str_logo_img", str_logo_img);



                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }

        public DataSet member_connect_categorywise(int int_user_id)
        {

            DataSet lds = null;

            try
            {
                gComm = new SqlCommand("usp_consumer_categorywise_connect", gConn);
                gComm.CommandType = CommandType.StoredProcedure;



                gComm.Parameters.AddWithValue("@int_user_id", int_user_id);



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

        public DataSet member_connect_subcategorywise(int int_user_id, int cat_id)
        {

            DataSet lds = null;

            try
            {
                gComm = new SqlCommand("usp_consumer_subcategorywise_connect", gConn);
                gComm.CommandType = CommandType.StoredProcedure;



                gComm.Parameters.AddWithValue("@int_user_id", int_user_id);
                gComm.Parameters.AddWithValue("@int_cat_id", cat_id);



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
