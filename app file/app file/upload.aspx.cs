using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace app_file
{
    public partial class upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            List<string> listexe = new List<string>() {".jpg",".jpeg",".png", ".svg" };
            if (!FileUpload1.HasFile)
            {
                Label1.Text = "aucun fichier !!";

            }
            else
            {
                Label1.Text= FileUpload1.FileName+" "+FileUpload1.PostedFile.ContentLength+" "+ FileUpload1.PostedFile.ContentType;
                
             
                foreach (string item in listexe)
                {
                    if (FileUpload1.PostedFile.FileName.EndsWith(item))
                    {
                        FileUpload1.SaveAs(Server.MapPath("Files") + "\\" + FileUpload1.FileName);
                        break;
                    }
                }
            }
           

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {

            List<string> listexe = new List<string>() { ".jpg", ".jpeg", ".png", ".svg" };
            if (!FileUpload1.HasFile)
            {
                Label1.Text = "Le type de fichier n'est pas valid";
              
            }
            else
            {
                Label1.Text = FileUpload1.FileName + " " + FileUpload1.PostedFile.ContentLength + " " + FileUpload1.PostedFile.ContentType;


                foreach (string item in listexe)
                {
                    if (FileUpload1.PostedFile.FileName.EndsWith(item))
                    {
                        
                        FileUpload1.SaveAs(Server.MapPath("Files") + "\\" + FileUpload1.FileName);
                        break;
                    }
                    else
                    {
                        args.IsValid = false;
                        CustomValidator1.ErrorMessage = "Fichier n'est pas valid";
                    }
                }
            }

            int m = FileUpload1.PostedFile.ContentLength;
            if ( m > 524288)
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage = "Fichier est superieur a 512kb";

            }
            else
            {
                args.IsValid = true;
            }

        }

      
    } 
}