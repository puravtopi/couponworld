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
    public class tbl_connect_subcategory_bal : Connection_Bal
    {
        public SqlCommand gComm;

        public int subcat_insert(tbl_connect_subcategory_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_tbl_connect_subcategory", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_connect_cat_id", objentity.int_connect_cat_id);
                gComm.Parameters.AddWithValue("@str_sub_cat", objentity.str_sub_cat);
              

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

        public int subcat_delete(tbl_connect_subcategory_entity objentity)
        {
            int dbval = 0;
            try
            {
                gComm = new SqlCommand("usp_delete_tbl_connect_subcategory", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_connect_sub_cat_id", objentity.int_connect_sub_cat_id);

                gConn.Open();
                dbval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {
                gConn.Close();
            }
            return dbval;
        }

        public int subcat_update(tbl_connect_subcategory_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_connect_subcategory", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_connect_cat_id", objentity.int_connect_cat_id);
                gComm.Parameters.AddWithValue("@str_sub_cat", objentity.str_sub_cat);
                gComm.Parameters.AddWithValue("@int_connect_sub_cat_id", objentity.int_connect_sub_cat_id);
                gComm.Parameters.AddWithValue("@bit_is_delete", objentity.bit_is_delete);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }

        public DataSet subcat_select(string query, int pageindex, int pagesize, out int totalrecords, string sortorder = "asc", string columnname = "str_sub_cat")
        {

            DataSet lds = null;
            totalrecords = 0;
            try
            {
                gComm = new SqlCommand("usp_select_tbl_connect_sub_category", gConn);
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

    }
}
