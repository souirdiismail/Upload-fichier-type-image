<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="app_file.upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript"  >
        function ValidFile(source, arguments) {

            var UploadDoc = document.getElementById('<%= FileUpload1.ClientID %>');
            var myfile = UploadDoc.value;
            var format = new Array();
            var Extension = myfile.substring(myfile.lastIndexOf('.') + 1).toLowerCase();
            if (Extension == "png" || Extension == "jpg" || Extension == "jpeg") {
                arguments.IsValid = true;
            }
            else {
                if (UploadDoc.value == '')
                    alert('Uploader le fichier .');
                else
                    alert("Le fichier n'est pas valid Veulliez ressaser d'uploader le fichier de type png , jpeg ou jpg");
                arguments.IsValid = false;
            }
            if (arguments.IsValid = true && document.getElementById("FileUpload1").files[0].size > 524288) {
                alert("Le fichier est superieur a 512kb");
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                ControlToValidate="FileUpload1" ErrorMessage="Type de fichier est invalid ou la taill de fichier est volumeux" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="True" EnableClientScript="true" ClientValidationFunction="ValidFile"></asp:CustomValidator>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Aucun fichier"></asp:Label>
        </div>
    </form>
</body>
</html>
