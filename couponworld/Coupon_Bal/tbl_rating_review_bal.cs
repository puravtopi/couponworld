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
    public class tbl_rating_review_bal : Connection_Bal
    {
        public SqlCommand gComm;

        public int rating_review_insert(tbl_rating_review_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_tbl_rating_review", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_retailer_id", objentity.int_retailer_id);
                gComm.Parameters.AddWithValue("@int_user_id", objentity.int_user_id);
                gComm.Parameters.AddWithValue("@dec_rate", objentity.dec_rate);
                gComm.Parameters.AddWithValue("@str_review", objentity.str_review);
                gComm.Parameters.AddWithValue("@date_create_date", objentity.date_create_date);
                gComm.Parameters.AddWithValue("@date_update_date",DBNull.Value);
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

        public DataSet rating_review_Select(string query, int pageindex, int pagesize, out int totalrecords, string sortorder = "asc", string columnname = "str_retailer_name")
        {
            DataSet lds = null;
            totalrecords = 0;
            try
            {
                gComm = new SqlCommand("usp_select_tbl_rating_review", gConn);
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


        public DataSet get_avg_rating(string int_retailer_id)
        {
            DataSet lds = null;
            gComm = new SqlCommand("usp_get_avg_rating", gConn);
            gComm.CommandType = CommandType.StoredProcedure;

            gComm.Parameters.AddWithValue("@int_retailer_id", int_retailer_id);

            gConn.Open();
            SqlDataAdapter lda = new SqlDataAdapter(gComm);
            lds = new DataSet();
            lda.Fill(lds);


            gConn.Close();

            return lds;



        }
    }
}
