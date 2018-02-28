using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_country_entity
    {

        public long int_country_id { get; set; }
        public string str_country_name { get; set; }
        public string str_region { get; set; }
        public DateTime date_create_date { get; set; }
        public DateTime date_update_date { get; set; }
        public bool bit_is_delete { get; set; }
    }
}
