using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_connect_entity
    {

        public int int_post_id { get; set; }
        public int int_category_id { get; set; }
        public int int_service_id { get; set; }
        public DateTime date_post_date { get; set; }
        public string str_no_of_days { get; set; }
        public string str_approx_budget { get; set; }
        public int int_user_id { get; set; }
        public string str_zip_code { get; set; }
        public bool bit_is_complete { get; set; }
        public DateTime date_complete_date { get; set; }
        public DateTime date_created_date { get; set; }
        public bool is_delete { get; set; }
        public DateTime date_update_date { get; set; }
        public string str_title { get; set; }
        public string str_details { get; set; }
        public int int_retailer_id { get; set; }

        public bool bit_is_reject { get; set; }
        public bool bit_is_approved { get; set; }
        public int int_reject_reason { get; set; }



    }
}
