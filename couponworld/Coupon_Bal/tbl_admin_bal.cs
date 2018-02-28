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
    public class tbl_admin_bal : Connection_Bal
    {
        public SqlCommand gComm;

        public int admin_insert(tbl_admin_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_sub_admin", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@str_email_id", objentity.str_email_id);
                gComm.Parameters.AddWithValue("@str_password", objentity.str_password);
                gComm.Parameters.AddWithValue("@str_user_name", objentity.str_user_name);
                gComm.Parameters.AddWithValue("@bit_is_sub_admin", objentity.bit_is_sub_admin);
                gComm.Parameters.AddWithValue("@bit_isactive", objentity.bit_isactive);

                gConn.Open();
                val = Convert.ToInt16(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {
                gConn.Close();
            }
            return val;
        }

        public int admin_delete(tbl_admin_entity objentity)
        {
            int dbval = 0;
            try
            {
                gComm = new SqlCommand("usp_delete_sub_admin", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_admin_id", objentity.int_admin_id);

                gConn.Open();
                dbval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return dbval;
        }


        public int admin_update(tbl_admin_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_update_sub_admin", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_admin_id", objentity.int_admin_id);
                gComm.Parameters.AddWithValue("@str_email_id", objentity.str_email_id);
                gComm.Parameters.AddWithValue("@str_password", objentity.str_password);
                gComm.Parameters.AddWithValue("@str_user_name", objentity.str_user_name);
                gComm.Parameters.AddWithValue("@bit_is_sub_admin", objentity.bit_is_sub_admin);
                gComm.Parameters.AddWithValue("@bit_isactive", objentity.bit_isactive);

                gConn.Open();
                val = Convert.ToInt16(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {
                gConn.Close();
            }
            return val;
        }

        public DataSet admin_Select(string query, int pageindex, int pagesize, out int totalrecords, string sortorder = "asc", string columnname = "str_user_name")
        {

            DataSet lds = null;
            totalrecords = 0;
            try
            {
                gComm = new SqlCommand("usp_select_tbl_admin", gConn);
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

        public DataSet admin_Select_connect_categorywise(string query)
        {

            DataSet lds = null;
          
            try
            {
                gComm = new SqlCommand("usp_select_tbl_connect_categorywise", gConn);
                gComm.CommandType = CommandType.StoredProcedure;


                gComm.Parameters.AddWithValue("@cnd", query);



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
