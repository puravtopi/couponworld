using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_feedback_entity
    {
        public long int_feedback_id { get; set; }
        public long int_offer_id { get; set; }
        public string str_date { get; set; }
        public string str_rate { get; set; }
        public string str_feedback { get; set; }
        public long int_user_id { get; set; }
        public DateTime date_create_date { get; set; }
        public DateTime date_update_date { get; set; }
        public bool bit_is_delete { get; set; }
    }
}
