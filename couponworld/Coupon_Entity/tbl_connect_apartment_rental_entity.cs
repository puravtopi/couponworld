using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_connect_apartment_rental_entity
    {
        public int int_post_id { get; set; }
        public int int_connect_cat_id { get; set; }
        public int int_service_id { get; set; }
        public int int_user_id { get; set; }
        public string dec_approx_budget { get; set; }
        public string str_title { get; set; }

        public string str_location { get; set; }
        public int int_rental_type { get; set; }
        public int int_bed_room { get; set; }
        public int int_bath_room { get; set; }
        public int int_credit_range { get; set; }
     
        public string str_month { get; set; }
        public string str_details { get; set; }
        public bool bit_is_reject { get; set; }
        public int int_reject_reason { get; set; }
        public bool bit_is_approved { get; set; }
        public bool bit_is_complete { get; set; }
        public DateTime date_post_date { get; set; }
        public bool is_delete { get; set; }
        public bool bit_have_deposit { get; set; }
        public DateTime date_update_date { get; set; }
    }
}
