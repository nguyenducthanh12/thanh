using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckOut : System.Web.UI.Page
{
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DateTime expiry = DateTime.Now.AddMinutes(5);
            this.SetResponseCookie("FirstName", txtFirstName.Text, expiry);
            this.SetResponseCookie("LastName", txtLastName.Text, expiry);
        }
        Response.Redirect("~/Order.aspx");
    }
    private void SetResponseCookie(string name, string value,
                                   DateTime expiry)
    {
        HttpCookie cookie = new HttpCookie(name, value);
        cookie.Expires = expiry;
        Response.Cookies.Add(cookie);
    }
}