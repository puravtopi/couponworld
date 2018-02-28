using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Coupon_Bal;
using Coupon_Entity;

namespace Coupon_Bal
{
    public class user_login : Connection_Bal
    {
        public SqlCommand gComm;

        public DataSet Check_Login(string uname, string pass, string logintype)
        {
            try
            {
                string lsp = "";

                if (logintype == "1")
                    lsp = "usp_member_login";
                else if (logintype == "2")
                    lsp = "usp_org_login";
                else if (logintype == "3")
                    lsp = "usp_retailer_login";
                else if (logintype == "4")
                    lsp = "usp_small_business_login";

                gComm = new SqlCommand(lsp, gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@str_email_id", uname);
                gComm.Parameters.AddWithValue("@str_password", pass);

                SqlDataAdapter lda = new SqlDataAdapter(gComm);
                DataSet lds = new DataSet();

                lda.Fill(lds);

                return lds;
            }
            catch (Exception ex)
            {
                gConn.Close();
                return null;
            }
            finally
            {
                gConn.Dispose();
            }
        }

        public DataSet forgot_password(string uname, string logintype)
        {
            try
            {
                string lsp = "";

                if (logintype == "1")
                    lsp = "usp_member_forgot";
                else if (logintype == "2")
                    lsp = "usp_org_forgot";
                else if (logintype == "3")
                    lsp = "usp_retailer_forgot";
                else if (logintype == "4")
                    lsp = "usp_small_business_forgot";

                gComm = new SqlCommand(lsp, gConn);
                gComm.CommandType = CommandType.StoredProcedure;

                gComm.Parameters.AddWithValue("@str_email_id", uname);

                SqlDataAdapter lda = new SqlDataAdapter(gComm);
                DataSet lds = new DataSet();

                lda.Fill(lds);

                return lds;
            }
            catch (Exception ex)
            {
                gConn.Close();
                return null;
            }
            finally
            {
                gConn.Dispose();
            }
        }
    }
}
