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
    public class tbl_auditmaster_bal : Connection_Bal
    {
        public SqlCommand gComm;

        public int auditmaster_insert(tbl_auditmaster_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_tbl_auditmaster", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@date_log_date", objentity.date_log_date);
                gComm.Parameters.AddWithValue("@time_log_time", objentity.time_log_time);
                gComm.Parameters.AddWithValue("@int_user_id", objentity.int_user_id);
                gComm.Parameters.AddWithValue("@str_activity_details", objentity.str_activity_details);
                gComm.Parameters.AddWithValue("@str_os", objentity.str_os);
                gComm.Parameters.AddWithValue("@str_ip", objentity.str_ip);
                gComm.Parameters.AddWithValue("@str_device", objentity.str_device);

                gConn.Open();
                val = Convert.ToInt16(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return val;
        }

        public int auditmaster_delete(tbl_auditmaster_entity objentity)
        {
            int dbval = 0;
            try
            {
                gComm = new SqlCommand("usp_delete_tbl_auditmaster", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_log_id", objentity.int_log_id);

                gConn.Open();
                dbval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return dbval;
        }

        public int auditmaster_Update(tbl_auditmaster_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_auditmaster", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_log_id", objentity.int_log_id);
                gComm.Parameters.AddWithValue("@date_log_date", objentity.date_log_date);
                gComm.Parameters.AddWithValue("@time_log_time", objentity.time_log_time);
                gComm.Parameters.AddWithValue("@int_user_id", objentity.int_user_id);
                gComm.Parameters.AddWithValue("@str_activity_details", objentity.str_activity_details);
                gComm.Parameters.AddWithValue("@str_os", objentity.str_os);
                gComm.Parameters.AddWithValue("@str_ip", objentity.str_ip);
                gComm.Parameters.AddWithValue("@str_device", objentity.str_device);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }


            return bval;
        }

        public DataSet auditmaster_Select(string query, int pageindex, int pagesize, out int totalrecords, string sortorder = "asc", string columnname = "str_first_name")
        {

            DataSet lds = null;
            totalrecords = 0;
            try
            {
                gComm = new SqlCommand("usp_select_tbl_auditmaster", gConn);
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
    }
}
