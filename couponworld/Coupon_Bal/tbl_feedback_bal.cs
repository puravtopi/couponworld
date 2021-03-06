﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Coupon_Bal;
using Coupon_Entity;
using System.Data;
using System.Data.SqlClient;

namespace Coupon_Bal
{
    public class tbl_feedback_bal : Connection_Bal
    {
        public SqlCommand gComm;

        public int feedback_insert(tbl_feedback_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_tbl_feedback", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_offer_id", objentity.int_offer_id);
                gComm.Parameters.AddWithValue("@str_date", objentity.str_date);
                gComm.Parameters.AddWithValue("@str_rate", objentity.str_rate);
                gComm.Parameters.AddWithValue("@str_feedback", objentity.str_feedback);
                gComm.Parameters.AddWithValue("@int_user_id", objentity.int_user_id);
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

        public int feedback_delete(tbl_feedback_entity objentity)
        {
            int dbval = 0;
            try
            {
                gComm = new SqlCommand("usp_delete_tbl_feedback", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_feedback_id", objentity.int_feedback_id);

                gConn.Open();
                dbval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return dbval;
        }

        public DataSet retailer_Select(string query, int pageindex, int pagesize, out int totalrecords, string sortorder = "asc", string columnname = "str_first_name")
        {

            DataSet lds = null;
            totalrecords = 0;
            try
            {
                gComm = new SqlCommand("usp_select_tbl_feedback", gConn);
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
