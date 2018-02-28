using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_group_entity
    {
        public long int_group_id { get; set; }
        public string str_name { get; set; }
        public bool bit_isactive { get; set; }
        public DateTime date_create_date { get; set; }
        public DateTime date_update_date { get; set; }
        public bool bit_is_delete { get; set; }
    }
}
