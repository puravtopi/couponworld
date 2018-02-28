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
    public class tbl_small_business_social_bal : Connection_Bal
    {
        public SqlCommand gComm;

        public int sb_social_insert(tbl_small_business_social_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_tbl_small_business_social", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_small_business_id", objentity.int_small_business_id);
                gComm.Parameters.AddWithValue("@str_fb_link", objentity.str_fb_link);
                gComm.Parameters.AddWithValue("@str_twitter_link", objentity.str_twitter_link);
                gComm.Parameters.AddWithValue("@str_linkin_link", objentity.str_linkin_link);
                gComm.Parameters.AddWithValue("@str_google_plus_link", objentity.str_google_plus_link);
                gComm.Parameters.AddWithValue("@str_other_link", objentity.str_other_link);
                gComm.Parameters.AddWithValue("@date_create_date", objentity.date_create_date);
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

        public int sb_social_delete(tbl_small_business_social_entity objentity)
        {
            int dbval = 0;
            try
            {
                gComm = new SqlCommand("usp_delete_tbl_small_business_social", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_sb_social_id", objentity.int_sb_social_id);

                gConn.Open();
                dbval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return dbval;
        }

        public int sb_social_Update(tbl_small_business_social_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_small_business_social", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_sb_social_id", objentity.int_sb_social_id);
                gComm.Parameters.AddWithValue("@int_small_business_id", objentity.int_small_business_id);
                gComm.Parameters.AddWithValue("@str_fb_link", objentity.str_fb_link);
                gComm.Parameters.AddWithValue("@str_twitter_link", objentity.str_twitter_link);
                gComm.Parameters.AddWithValue("@str_linkin_link", objentity.str_linkin_link);
                gComm.Parameters.AddWithValue("@str_google_plus_link", objentity.str_google_plus_link);
                gComm.Parameters.AddWithValue("@str_other_link", objentity.str_other_link);


                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }


            return bval;
        }

        public DataSet sb_social_Select(string query, int pageindex, int pagesize, out int totalrecords, string sortorder = "asc", string columnname = "str_name")
        {

            DataSet lds = null;
            totalrecords = 0;
            try
            {
                gComm = new SqlCommand("usp_select_tbl_small_business_social", gConn);
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
