using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_admin_entity
    {
        public int int_admin_id { get; set; }

        public string str_user_name { get; set; }

        public string str_email_id { get; set; }

        public string str_password { get; set; }

        public bool bit_isactive { get; set; }

        public bool bit_is_sub_admin { get; set; }

    }
}
