using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckOut2 : System.Web.UI.Page
{
    private Customer customer;

    protected void Page_Load(object sender, EventArgs e)
    {

        customer = (Customer)Session["Customer"];

        string message =
            "Contact information\n" +
            "    Email: " + customer.EmailAddress + "\n" +
            "    First name: " + customer.FirstName + "\n" +
            "    Last name: " + customer.LastName + "\n" +
            "    Phone number: " + customer.Phone + "\n" +
            "Billing address\n" +
            "    Address: " + customer.Address + "\n" +
            "    City: " + customer.City + "\n" +
            "    State: " + customer.State + "\n" +
            "    Zip code: " + customer.Zip + "\n" +
            "Shipping address\n" +
            "    Address: " + customer.ShippingAddress + "\n" +
            "    City: " + customer.ShippingCity + "\n" +
            "    State: " + customer.ShippingState + "\n" +
            "    Zip code: " + customer.ShippingZip;

        txtData.Text = message;
    }
}