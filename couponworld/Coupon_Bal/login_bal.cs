using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Coupon_Entity;
using System.Data;
using System.Data.SqlClient;

namespace Coupon_Bal
{
    public class login_bal : Connection_Bal
    {
        public SqlCommand gComm;

        public DataSet Check_Login(string uname, string pass)
        {

            try
            {

                gComm = new SqlCommand("admin_login", gConn);
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
    }
}
