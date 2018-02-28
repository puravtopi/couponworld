using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_transaction_entity
    {
        public long int_trans_id { get; set; }
        public string date_trans_date { get; set; }
        public string time_trans_time { get; set; }
        public long int_user_id { get; set; }
        public long int_retailer_id { get; set; }
        public long int_offer_id { get; set; }
        public long int_small_business_id { get; set; }
        public decimal dec_share_amount { get; set; }
        public decimal dec_puchase_amt { get; set; }
        public string str_receipt { get; set; }
        public DateTime date_create_date { get; set; }
        public DateTime date_update_date { get; set; }
        public bool bit_is_delete { get; set; }
    }
}
