using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_small_business_social_entity
    {
        public long int_sb_social_id { get; set; }
        public long int_small_business_id { get; set; }
        public string str_fb_link { get; set; }
        public string str_twitter_link { get; set; }
        public string str_linkin_link { get; set; }
        public string str_google_plus_link { get; set; }
        public string str_other_link { get; set; }
        public DateTime date_create_date { get; set; }
        public DateTime date_update_date { get; set; }
        public bool bit_is_delete { get; set; }
    }
}
