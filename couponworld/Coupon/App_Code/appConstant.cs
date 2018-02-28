using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Coupon
{
    public class appConstant
    {
        //for PageSize of grid
        public static readonly int pageSize = 10;

        //for user type
        public static readonly string consumer = "1";

        public static readonly string organization = "2";

        public static readonly string reatiler = "3";

        public static readonly string smallbusiness = "4";

        public static readonly string websiteurl = "http://sevasocial.org";

        //public static readonly string websiteurl = "http://localhost:2628";

        public static string getVechicleType(string id)
        {
            if (id == "1")
                return "Car";
            else if (id == "2")
                return "SUV";
            else if (id == "3")
                return "Van";
            else
                return "Truck";
        }

        public static string getVechicleClass(string id)
        {
            if (id == "1")
                return "Economy";
            else if (id == "2")
                return "Compact";
            else if (id == "3")
                return "Intermediate";
            else if (id == "4")
                return "Standard";
            else
                return "Full Size";
        }

        public static string getRentalType(string id)
        {
            if (id == "1")
                return "Single Family";
            else if (id == "2")
                return "Condo";
            else if (id == "3")
                return "Townhomes";
            else if (id == "4")
                return "Lots and Land";
            else
                return "Manufactured";

        }

        public static string getCreditRang(string id)
        {
            if (id == "1")
                return "Not sure";
            else if (id == "2")
                return "Low";
            else if (id == "3")
                return "Average";
            else
                return "High";

        }

        public static string getSqFtRang(string id)
        {
            if (id == "1")
                return "800-1000";
            else if (id == "2")
                return "1000-1500";
            else if (id == "3")
                return "1500-2000";
            else
                return "2000+";

        }
    }
}