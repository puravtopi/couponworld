using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_auditmaster_entity
    {
        public long int_log_id { get; set; }
        public string date_log_date { get; set; }
        public string time_log_time { get; set; }
        public long int_user_id { get; set; }
        public string str_activity_details { get; set; }
        public string str_os { get; set; }
        public string str_ip { get; set; }
        public string str_device { get; set; }
    }
}
