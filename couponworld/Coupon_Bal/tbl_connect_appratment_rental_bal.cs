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
    public class tbl_connect_appratment_rental_bal : Connection_Bal
    {
        public SqlCommand gComm;

        public int connect_appartment_rental_insert(tbl_connect_apartment_rental_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_tbl_apartment_rental_connect", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                //gComm.Parameters.AddWithValue("@int_company_id", objentity.int_company_id);
                gComm.Parameters.AddWithValue("@str_title", objentity.str_title);
                gComm.Parameters.AddWithValue("@int_connect_cat_id", objentity.int_connect_cat_id);
                gComm.Parameters.AddWithValue("@int_service_id", objentity.int_service_id);
                gComm.Parameters.AddWithValue("@int_user_id", objentity.int_user_id);
                gComm.Parameters.AddWithValue("@int_rental_type", objentity.int_rental_type);
                gComm.Parameters.AddWithValue("@int_bed_room", objentity.int_bed_room);
                gComm.Parameters.AddWithValue("@int_bath_room", objentity.int_bath_room);
                gComm.Parameters.AddWithValue("@str_month", objentity.str_month);
                gComm.Parameters.AddWithValue("@dec_approx_budget", objentity.dec_approx_budget);
                gComm.Parameters.AddWithValue("@int_credit_range", objentity.int_credit_range);
                gComm.Parameters.AddWithValue("@bit_have_deposit", objentity.bit_have_deposit);

                gComm.Parameters.AddWithValue("@str_details", objentity.str_details);
                gComm.Parameters.AddWithValue("@str_location", objentity.str_location);
             
                gConn.Open();
                val = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return val;
        }

        public int connect_appartment_rental_update(tbl_connect_apartment_rental_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_update_tbl_apartment_rental_connect", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@int_post_id", objentity.int_post_id);
                gComm.Parameters.AddWithValue("@str_title", objentity.str_title);
             
                gComm.Parameters.AddWithValue("@int_rental_type", objentity.int_rental_type);
                gComm.Parameters.AddWithValue("@int_bed_room", objentity.int_bed_room);
                gComm.Parameters.AddWithValue("@int_bath_room", objentity.int_bath_room);
                gComm.Parameters.AddWithValue("@str_month", objentity.str_month);
                gComm.Parameters.AddWithValue("@dec_approx_budget", objentity.dec_approx_budget);
                gComm.Parameters.AddWithValue("@int_credit_range", objentity.int_credit_range);
                gComm.Parameters.AddWithValue("@bit_have_deposit", objentity.bit_have_deposit);

                gComm.Parameters.AddWithValue("@str_details", objentity.str_details);
                gComm.Parameters.AddWithValue("@str_location", objentity.str_location);

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
