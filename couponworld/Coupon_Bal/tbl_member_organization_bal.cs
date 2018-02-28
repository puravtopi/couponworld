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
    public class tbl_member_organization_bal : Connection_Bal
    {
        public SqlCommand gComm;

        public int member_organization_insert(tbl_member_organization_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_tbl_member_organization", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_user_id", objentity.int_user_id);
                gComm.Parameters.AddWithValue("@int_organization_id", objentity.int_organization_id);
                gComm.Parameters.AddWithValue("@date_create_date", objentity.date_create_date);
                gComm.Parameters.AddWithValue("@date_update_date", DBNull.Value);
                gComm.Parameters.AddWithValue("@int_user_id", objentity.bit_is_delete);

                gConn.Open();
                val = Convert.ToInt16(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return val;
        }

        public int member_organization_delete(tbl_member_organization_entity objentity)
        {
            int dbval = 0;
            try
            {
                gComm = new SqlCommand("usp_delete_tbl_member_organization", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_member_organization_id", objentity.int_member_organization_id);

                gConn.Open();
                dbval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return dbval;
        }

        public int member_organization_Update(tbl_member_organization_entity objentity)
        {
            int bval = 0;

            try
            {
                gComm = new SqlCommand("usp_update_tbl_member_organization", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_member_organization_id", objentity.int_member_organization_id);
                gComm.Parameters.AddWithValue("@int_user_id", objentity.int_user_id);
                gComm.Parameters.AddWithValue("@int_organization_id", objentity.int_organization_id);

                gConn.Open();
                bval = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return bval;
        }

        public DataSet member_organization_Select(string query, int pageindex, int pagesize, out int totalrecords, string sortorder = "asc", string columnname = "str_first_name")
        {

            DataSet lds = null;
            totalrecords = 0;
            try
            {
                gComm = new SqlCommand("usp_select_tbl_member_organization", gConn);
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
