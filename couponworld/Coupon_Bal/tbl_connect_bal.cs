using Coupon_Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Bal
{
    public class tbl_connect_bal : Connection_Bal
    {

        public SqlCommand gComm;

        public int connect_insert(tbl_connect_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_tbl_connect", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                //gComm.Parameters.AddWithValue("@int_company_id", objentity.int_company_id);
                gComm.Parameters.AddWithValue("@int_category_id", objentity.int_category_id);
                gComm.Parameters.AddWithValue("@int_service_id", objentity.int_service_id);
                gComm.Parameters.AddWithValue("@int_no_of_days", objentity.str_no_of_days);
                gComm.Parameters.AddWithValue("@dec_approx_budget", objentity.str_approx_budget);
                gComm.Parameters.AddWithValue("@int_user_id", objentity.int_user_id);
                gComm.Parameters.AddWithValue("@str_zip_code", objentity.str_zip_code);
                gComm.Parameters.AddWithValue("@str_title", objentity.str_title);
                gComm.Parameters.AddWithValue("@str_details", objentity.str_details);

                gConn.Open();
                val = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return val;
        }

        public DataSet connect_select(string query, int pageindex, int pagesize, out int totalrecords, string sp, string sortorder = "desc", string columnname = "date_post_date")
        {

            DataSet lds = null;
            totalrecords = 0;
            try
            {
                //gComm = new SqlCommand("usp_select_tbl_connect_post", gConn);
                gComm = new SqlCommand(sp, gConn);
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

        public int connect_reply_insert(tbl_connect_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_connect_reply", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                //gComm.Parameters.AddWithValue("@int_company_id", objentity.int_company_id);
                gComm.Parameters.AddWithValue("@int_connect_id", objentity.int_post_id);
                gComm.Parameters.AddWithValue("@int_retailer_id", objentity.int_retailer_id);
                gComm.Parameters.AddWithValue("@str_comment", objentity.str_details);
                gComm.Parameters.AddWithValue("@str_approx_days", objentity.str_no_of_days);
                gComm.Parameters.AddWithValue("@str_approx_budget", objentity.str_approx_budget);


                gConn.Open();
                val = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return val;
        }

        public DataSet connect_reply_select(string cnd)
        {

            DataSet lds = null;

            try
            {
                gComm = new SqlCommand("usp_select_tbl_connect_reply", gConn);
                gComm.CommandType = CommandType.StoredProcedure;


                gComm.Parameters.AddWithValue("@cnd", cnd);



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

        public int connect_request_reject(tbl_connect_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_reject_connect_request", gConn);
                gComm.CommandType = CommandType.StoredProcedure;


                gComm.Parameters.AddWithValue("@int_post_id", objentity.int_post_id);
                gComm.Parameters.AddWithValue("@int_sub_cat_id", objentity.int_service_id);
                gComm.Parameters.AddWithValue("@int_reject_reason", objentity.int_reject_reason);


                gConn.Open();
                val = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return val;
        }

        public int connect_request_accept(tbl_connect_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_accept_connect_request", gConn);
                gComm.CommandType = CommandType.StoredProcedure;


                gComm.Parameters.AddWithValue("@int_post_id", objentity.int_post_id);
                gComm.Parameters.AddWithValue("@int_sub_cat_id", objentity.int_service_id); 



                gConn.Open();
                val = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return val;
        }

        public DataSet connect_reject_reason_select()
        {

            DataSet lds = null;

            try
            {
                gComm = new SqlCommand("usp_select_reject_reason", gConn);
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
                gConn.Close();
            }
            return lds;

        }

        public int connect_update(tbl_connect_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_update_tbl_connect", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                //gComm.Parameters.AddWithValue("@int_company_id", objentity.int_company_id);
                gComm.Parameters.AddWithValue("@int_post_id", objentity.int_post_id);
                
                gComm.Parameters.AddWithValue("@int_no_of_days", objentity.str_no_of_days);
                gComm.Parameters.AddWithValue("@dec_approx_budget", objentity.str_approx_budget);
               
                gComm.Parameters.AddWithValue("@str_zip_code", objentity.str_zip_code);
                gComm.Parameters.AddWithValue("@str_title", objentity.str_title);
                gComm.Parameters.AddWithValue("@str_details", objentity.str_details);

                gConn.Open();
                val = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return val;
        }
    }
}
