using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cokie = new HttpCookie("Student");
            cokie.Value = "Hein Htet Soe";
            Response.Cookies.Add(cokie);
            CookieLabel.Text = Response.Cookies["Student"].Value;
            Response.Cookies["computer"].Expires = DateTime.Now.AddDays(-1);
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["name"] = txtName.Text;
            genderLabel.Text = "";
            if (RadioButton1.Checked)
            {
                genderLabel.Text = $"{Session["name"]} is {RadioButton1.Text}.";
            }
            else genderLabel.Text = $"{Session["name"]} is {RadioButton2.Text}";
            Response.Write(Session["name"]);

            Button1.Visible = false;
            ListBox1.Visible = false;
            name.Visible = false;
            txtName.Visible = false;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            dateLabel.Text = "";
            dateLabel.Text = "You selected:" + Calendar1.SelectedDate.ToString("D");
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if((FileUpload1.PostedFile != null) && (FileUpload1.PostedFile.ContentLength > 0))
            {
                string fn = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                string saveLocation = Server.MapPath("upload") + "\\" + fn;
                try
                {
                    FileUpload1.PostedFile.SaveAs(saveLocation);
                    FileStatus.Text = $"The file {fn} has been uploaded.";
                }
                catch (Exception ex)
                {
                    FileStatus.Text = "Error : " + ex.Message;
                }
            } 
            else
            {
                FileStatus.Text = "Please select a file to upload";
            }
        }

        protected void MultipleFileUploadButton_Click(object sender, EventArgs e)
        {
            if(MultipleFileUpload.PostedFile != null && MultipleFileUpload.PostedFile.ContentLength > 0)
            {
                var count = 0;
                foreach (HttpPostedFile uploadedFile in  MultipleFileUpload.PostedFiles)
                {
                    string fn = System.IO.Path.GetFileName(uploadedFile.FileName);
                    string saveLocation = Server.MapPath("upload") + "\\" + fn;
                    try
                    {
                        uploadedFile.SaveAs(saveLocation);
                        count++;
                    }
                    catch (Exception ex)
                    {
                        MulitpleFileStatus.Text = "Error : " + ex.Message;
                    }
                }
                if(count > 0)
                {
                    MulitpleFileStatus.Text = $" {count} files uploaded. ";
                }
            }
            else
            {
                MulitpleFileStatus.Text = "Please select a file to upload.";
            }
        }

        protected void DownloadButton_Click(object sender, EventArgs e)
        {
            string filePath = "C:\\Users\\HeinHtetSoe\\source\\repos\\WebApplication4\\WebApplication4\\download\\TextFile1.txt";
            FileInfo file = new FileInfo(filePath);
            if (file.Exists)
            {
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length",file.Length.ToString());
                Response.ContentType = "text/plain";
                Response.Flush();
                Response.TransmitFile(file.FullName);
                Response.End();
            }
            else
            {
                DownloadLabel.Text = "Requested file is not available to download.";
            }
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void CookieCollectionButton_Click(object sender, EventArgs e)
        {
            CookieCollectionLabel.Text = "";
            if (Apple.Checked)
            {
                Response.Cookies["computer"]["apple"] = "apple";
            }
            if (Google.Checked)
            {
                Response.Cookies["computer"]["google"] = "google";
            }
            if (Samsung.Checked)
            {
                Response.Cookies["computer"]["samsung"] = "samsung";
            }
            if (Request.Cookies["computer"].Values.ToString() != null)
            {
                if (Request.Cookies["computer"]["apple"] != null)
                {
                    CookieCollectionLabel.Text += Request.Cookies["computer"]["apple"] + " ";
                }
                if (Request.Cookies["computer"]["google"] != null)
                {
                    CookieCollectionLabel.Text += Request.Cookies["computer"]["google"] + " ";
                }
                if (Request.Cookies["computer"]["samsung"] != null)
                {
                    CookieCollectionLabel.Text += Request.Cookies["computer"]["samsung"] + " ";
                }
            }
            else
            {
                CookieCollectionLabel.Text = "Choose something!";
            }
            Response.Cookies["computer"].Expires = DateTime.Now.AddDays(-1);
        }
    }
}