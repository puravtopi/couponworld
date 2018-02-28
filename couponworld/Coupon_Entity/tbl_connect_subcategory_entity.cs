using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_connect_subcategory_entity
    {
        public int int_connect_sub_cat_id { get; set; }

        public int int_connect_cat_id { get; set; }

        public string str_sub_cat { get; set; }

        public bool bit_is_delete { get; set; }

    }
}
