﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_small_business_type
    {
        public long int_small_business_type_id { get; set; }
        public string str_small_business_type_name { get; set; }
        public DateTime date_create_date { get; set; }
        public DateTime date_update_date { get; set; }
        public bool bit_is_delete { get; set; }
    }
}
