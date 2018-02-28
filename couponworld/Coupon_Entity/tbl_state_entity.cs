using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_state_entity
    {
        public long int_state_id { get; set; }
        public string str_state_name { get; set; }
        public long int_country_id { get; set; }
        public string str_short_name { get; set; }
        public DateTime date_create_date { get; set; }
        public DateTime date_update_date { get; set; }
        public bool bit_is_delete { get; set; }
    }
}
