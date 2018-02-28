﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Coupon_Entity;


namespace Coupon_Bal
{
    public class tbl_country_bal : Connection_Bal
    {
        public SqlCommand gComm;

        public int country_insert(tbl_country_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_tbl_country", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@str_country_name", objentity.str_country_name);
                gComm.Parameters.AddWithValue("@str_region", objentity.str_region);
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

        public int country_delete(tbl_country_entity objentity)
        {
            int dbval = 0;
            try
            {
                gComm = new SqlCommand("usp_delete_tbl_country", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_country_id", objentity.int_country_id);

                gConn.Open();
                dbval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return dbval;
        }

        public int country_Update(tbl_country_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_country", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_country_id", objentity.int_country_id);
                gComm.Parameters.AddWithValue("@str_country_name", objentity.str_country_name);
                gComm.Parameters.AddWithValue("@str_region", objentity.str_region);


                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }


            return bval;
        }

        public DataSet country_Select(string query, int pageindex, int pagesize, out int totalrecords, string sortorder = "asc", string columnname = "str_country_name")
        {

            DataSet lds = null;
            totalrecords = 0;
            try
            {
                gComm = new SqlCommand("usp_select_tbl_country", gConn);
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
