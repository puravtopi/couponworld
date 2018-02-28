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
    public class tbl_connect_car_rental_bal : Connection_Bal
    {

        public SqlCommand gComm;

        public int connect_car_rental_insert(tbl_connect_car_rental_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_insert_tbl_car_rental_connect", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                //gComm.Parameters.AddWithValue("@int_company_id", objentity.int_company_id);
                gComm.Parameters.AddWithValue("@int_age", objentity.int_age);
                gComm.Parameters.AddWithValue("@int_capacity", objentity.int_capacity);
                gComm.Parameters.AddWithValue("@int_connect_cat_id", objentity.int_connect_cat_id);
                gComm.Parameters.AddWithValue("@int_connect_service_id", objentity.int_connect_service_id);
                gComm.Parameters.AddWithValue("@int_user_id", objentity.int_user_id);
                gComm.Parameters.AddWithValue("@int_vech_class", objentity.int_vech_class);
                gComm.Parameters.AddWithValue("@int_vech_type", objentity.int_vech_type);
                gComm.Parameters.AddWithValue("@str_details", objentity.str_details);

                gComm.Parameters.AddWithValue("@str_pick_location", objentity.str_pick_location);
                gComm.Parameters.AddWithValue("@str_price", objentity.str_price);
                gComm.Parameters.AddWithValue("@date_pickup_date", objentity.date_pickup_date);
                gComm.Parameters.AddWithValue("@date_return_date", objentity.date_return_date);
                gComm.Parameters.AddWithValue("@str_title", objentity.str_title);

                gConn.Open();
                val = Convert.ToInt32(gComm.ExecuteScalar());
                gConn.Close();
            }
            catch (Exception ex)
            {

            }
            return val;
        }

        public int connect_car_rental_update(tbl_connect_car_rental_entity objentity)
        {
            int val = 0;
            try
            {
                gComm = new SqlCommand("usp_update_tbl_car_rental_connect", gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                //gComm.Parameters.AddWithValue("@int_company_id", objentity.int_company_id);
                gComm.Parameters.AddWithValue("@int_age", objentity.int_age);
                gComm.Parameters.AddWithValue("@int_capacity", objentity.int_capacity);
                gComm.Parameters.AddWithValue("@int_post_id", objentity.int_id);
               
                gComm.Parameters.AddWithValue("@int_vech_class", objentity.int_vech_class);
                gComm.Parameters.AddWithValue("@int_vech_type", objentity.int_vech_type);
                gComm.Parameters.AddWithValue("@str_details", objentity.str_details);

                gComm.Parameters.AddWithValue("@str_pick_location", objentity.str_pick_location);
                gComm.Parameters.AddWithValue("@str_price", objentity.str_price);
                gComm.Parameters.AddWithValue("@date_pickup_date", objentity.date_pickup_date);
                gComm.Parameters.AddWithValue("@date_return_date", objentity.date_return_date);
                gComm.Parameters.AddWithValue("@str_title", objentity.str_title);

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
