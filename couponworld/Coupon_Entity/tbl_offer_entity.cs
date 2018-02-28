using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_offer_entity
    {
        public long int_offer_id { get; set; }
        public string str_offer_name { get; set; }
        public string str_offer_details { get; set; }
        public long int_discount_type_id { get; set; }
        public long int_deal_type_id { get; set; }
        public decimal dec_original_price { get; set; }
        public decimal dec_discount_amount { get; set; }
        public decimal dec_savings { get; set; }
        public long int_retailer_id { get; set; }
        public string date_start_date { get; set; }
        public string date_end_date { get; set; }
        public bool bit_isactive { get; set; }
        public string str_img { get; set; }
        public string int_category_id { get; set; }
        public long int_sub_category_id { get; set; }
        public bool bit_accept { get; set; }
        public long int_small_business_id { get; set; }
        public int int_organization_share { get; set; }
        public string str_sponsor { get; set; }
        public string str_limitation { get; set; }
        public DateTime date_created_date { get; set; }
        public DateTime date_update_date { get; set; }
        public bool bit_is_delete { get; set; }
        public int int_no_of_readim { get; set; }
        public bool bit_is_treading { get; set; }
        public bool bit_is_featured { get; set; }
        public decimal dec_marketing_fee { get; set; }
        public int int_marketing_type_id { get; set; }
    }
}