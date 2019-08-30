using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckOut : System.Web.UI.Page
{
    private Customer customer;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            customer = (Customer)Session["Customer"];
            this.LoadCustomerData();
        }
    }
    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        //if (!chkSameAsBilling.Checked)
        //{
        //    Page.Validate("ShipTo");
        //} 
        if (Page.IsValid)
        {        
            this.GetCustomerData();
            Response.Redirect("~/CheckOut2.aspx");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("Cart");
        Session.Remove("Customer");
        Response.Redirect("~/Order.aspx");
    }
    private void LoadCustomerData()
    {
        if (customer != null)
        {
            txtFirstName.Text = customer.FirstName;
            txtLastName.Text = customer.LastName;
            txtEmail1.Text = customer.EmailAddress;
            txtPhone.Text = customer.Phone;
            txtAddress.Text = customer.Address;
            txtCity.Text = customer.City;
            ddlState.SelectedValue = customer.State;
            txtZip.Text = customer.Zip;
            txtShipAddress.Text = customer.ShippingAddress;
            txtShipCity.Text = customer.ShippingCity;
            ddlShipState.SelectedValue = customer.ShippingState;
            txtShipZip.Text = customer.ShippingZip;
        }
    }
    private void GetCustomerData()
    {
        if (customer == null)
            customer = new Customer();
        customer.FirstName = txtFirstName.Text;
        customer.LastName = txtLastName.Text;
        customer.EmailAddress = txtEmail1.Text;
        customer.Phone = txtPhone.Text;
        customer.Address = txtAddress.Text;
        customer.City = txtCity.Text;
        customer.State = ddlState.SelectedValue;
        customer.Zip = txtZip.Text;
        customer.ShippingAddress = txtShipAddress.Text;
        customer.ShippingCity = txtShipCity.Text;
        customer.ShippingState = ddlShipState.SelectedValue;
        customer.ShippingZip = txtShipZip.Text;
        Session["Customer"] = customer;
    }
    protected void chkSameAsBilling_CheckedChanged(object sender, EventArgs e)
    {
        if (!chkSameAsBilling.Checked)
        {
            rfvShipAddress.Enabled = true;
            rfvShipCity.Enabled = true;
            rfvShipState.Enabled = true;
            rfvShipZip.Enabled = true;
            txtShipAddress.Enabled = true;
            txtShipCity.Enabled = true;
            ddlShipState.Enabled = true;
            txtShipZip.Enabled = true;
        }
        else
        {
            rfvShipAddress.Enabled = false;
            rfvShipCity.Enabled = false;
            rfvShipState.Enabled = false;
            rfvShipZip.Enabled = false;
            txtShipAddress.Enabled = false;
            txtShipCity.Enabled = false;
            ddlShipState.Enabled = false;
            txtShipZip.Enabled = false;
        }
    }
}