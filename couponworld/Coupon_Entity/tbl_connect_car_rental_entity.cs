using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_connect_car_rental_entity
    {
        public int int_id { get; set; }
        public int int_connect_cat_id { get; set; }
        public int int_connect_service_id { get; set; }
        public int int_user_id { get; set; }
        public string str_pick_location { get; set; }
        public string str_title { get; set; }
        public DateTime date_pickup_date { get; set; }
        public DateTime date_return_date { get; set; }
        public int int_age { get; set; }
        public int int_vech_type { get; set; }
        public int int_vech_class { get; set; }
        public int int_capacity { get; set; }
        public string str_price { get; set; }
        public string str_details { get; set; }
        public bool bit_is_reject { get; set; }
        public int int_reject_reason { get; set; }
        public bool bit_is_approved { get; set; }
        public bool bit_is_complete { get; set; }
        public DateTime date_created_date { get; set; }
        public bool is_delete { get; set; }
        public DateTime date_update_date { get; set; }

    }
}
