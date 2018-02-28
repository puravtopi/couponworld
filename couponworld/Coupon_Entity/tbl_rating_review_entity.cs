using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_rating_review_entity
    {
        public long int_rating_id { get; set; }
        public long int_retailer_id { get; set; }
        public long int_user_id { get; set; }
        public decimal dec_rate { get; set; }
        public string str_review { get; set; }
        public DateTime date_create_date { get; set; }
        public DateTime date_update_date { get; set; }
        public bool bit_is_delete { get; set; }
    }
}
