<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="app_file.upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                ControlToValidate="FileUpload1" ErrorMessage="Type de fichier est invalid ou la taill de fichier est volumeux" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="True" EnableClientScript="true"></asp:CustomValidator>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Aucun fichier"></asp:Label>
        </div>
    </form>
</body>
</html>
