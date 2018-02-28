using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_donation_entity
    {
        public long int_donation_id { get; set; }
        public string str_name { get; set; }
        public string str_message { get; set; }
        public long int_organization_id { get; set; }
        public string str_amount { get; set; }
        public DateTime date_date_time { get; set; }
        public string str_email_id { get; set; }
        public string str_address { get; set; }
    }
}
