using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Coupon
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }
        static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("home", "home", "~/index.aspx");
            routes.MapPageRoute("market-place", "market-place", "~/products.aspx");
            routes.MapPageRoute("consumer-details", "consumer-details", "~/consumer_page.aspx");
            routes.MapPageRoute("merchants-details", "merchants-details", "~/merchants_page.aspx");
            routes.MapPageRoute("organization-details", "organization-details", "~/organizations_page.aspx");
            routes.MapPageRoute("contact-us", "contact-us", "~/contact_us.aspx");
            routes.MapPageRoute("how-it-work", "how-it-work", "~/how_does_it_work.aspx");
            routes.MapPageRoute("about-us", "about-us", "~/what_sets_us_part.aspx");
            routes.MapPageRoute("organization-list", "organization-list", "~/view_organizations.aspx");
            routes.MapPageRoute("merchants", "merchants", "~/view_retailer.aspx");
            routes.MapPageRoute("companys", "companys", "~/view_company.aspx");

            routes.MapPageRoute("sb-profile", "sb-profile", "~/sb/sb_profile.aspx");
            routes.MapPageRoute("consumer-profile", "consumer-profile", "~/member_user/member_profile.aspx");

            routes.MapPageRoute("sb-deals", "sb-deals", "~/sb/view_deals_sb.aspx");
            routes.MapPageRoute("sb-transactions", "sb-transactions", "~/sb/view_sb_user_transaction.aspx");

            routes.MapPageRoute("retailer-profile", "retailer-profile", "~/retailer/profile.aspx");
            routes.MapPageRoute("retailer-deals", "retailer-deals", "~/retailer/view_deals_retailer.aspx");
            routes.MapPageRoute("retailer-transactions", "retailer-transactions", "~/retailer/view_user_transaction.aspx");

 
            routes.MapPageRoute("org-profile", "org-profile", "~/org/org_profile.aspx");
            routes.MapPageRoute("logout", "logout", "~/logout.aspx");
            //
            routes.MapPageRoute("login", "login/{type}/{lid}", "~/login.aspx");
            routes.MapPageRoute("consumer", "consumer", "~/member_sign_up.aspx");
            routes.MapPageRoute("organization", "organization", "~/org_sign_up.aspx");
            routes.MapPageRoute("retailers", "retailers", "~/retailer_sign_up.aspx");
            routes.MapPageRoute("small-business", "small-business", "~/sb_sign_up.aspx");

            routes.MapPageRoute("offer", "offer/{name}/{oid}", "~/offer_details.aspx");
            routes.MapPageRoute("retailer", "retailer/{name}/{rid}", "~/retailer_details.aspx");
            routes.MapPageRoute("orgnization", "orgnization/{name}/{oid}", "~/org_details.aspx");
            routes.MapPageRoute("company", "company/{name}/{cid}", "~/company_details.aspx");

            routes.MapPageRoute("retailer-deal-details", "retailer-deal-details/{name}/{oid}", "~/retailer/deal_details_retailer.aspx");
            //routes.MapPageRoute("offer", "offer/{name}/{oid}", "~/offer_details.aspx");
            routes.MapPageRoute("deal-details", "deal-details", "~/retailer/deal_details_retailer.aspx");
            routes.MapPageRoute("deal-details-sb", "deal-details-sb", "~/sb/deal_details_sb.aspx");
            routes.MapPageRoute("sb-deal-details", "sb-deal-details/{name}/{osid}", "~/sb/deal_details_sb.aspx");

            //routes.MapPageRoute("sb-deal-detailsss", "sb-deal-detailsss/{name}/{ossid}", "~/sb/deal_details_sb.aspx");

            routes.MapPageRoute("forgot-password", "forgot-password", "~/forgot_password.aspx");
            routes.MapPageRoute("view-details-sb", "view-details-sb", "~/sb/deal_details_sb.aspx");
            routes.MapPageRoute("view-details-retailer", "view-details-retailer", "~/retailer/deal_details_retailer.aspx");

            routes.MapPageRoute("transactions", "transactions", "~/member_user/view_transaction.aspx");
            routes.MapPageRoute("consumer-dashboard", "consumer-dashboard", "~/member_user/dashboard.aspx");
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}