<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ekle" />
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="OtomobilID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="125px">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="OtomobilID" HeaderText="OtomobilID" InsertVisible="False" ReadOnly="True" SortExpression="OtomobilID" />
                    <asp:BoundField DataField="Marka" HeaderText="Marka" SortExpression="Marka" />
                    <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                    <asp:BoundField DataField="Resim" HeaderText="Resim" SortExpression="Resim" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="OtomobilID" DataSourceID="SqlDataSource1" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="OtomobilID" HeaderText="OtomobilID" InsertVisible="False" ReadOnly="True" SortExpression="OtomobilID" />
                    <asp:BoundField DataField="Marka" HeaderText="Marka" SortExpression="Marka" />
                    <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                    <asp:BoundField DataField="Resim" HeaderText="Resim" SortExpression="Resim" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CalismaConnectionString %>" DeleteCommand="DELETE FROM [Otomobiller] WHERE [OtomobilID] = @OtomobilID" InsertCommand="INSERT INTO [Otomobiller] ([Marka], [Model], [Resim]) VALUES (@Marka, @Model, @Resim)" SelectCommand="SELECT * FROM [Otomobiller]" UpdateCommand="UPDATE [Otomobiller] SET [Marka] = @Marka, [Model] = @Model, [Resim] = @Resim WHERE [OtomobilID] = @OtomobilID">
                <DeleteParameters>
                    <asp:Parameter Name="OtomobilID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Marka" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox2" Name="Model" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox3" Name="Resim" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Marka" Type="String" />
                    <asp:Parameter Name="Model" Type="String" />
                    <asp:Parameter Name="Resim" Type="String" />
                    <asp:Parameter Name="OtomobilID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="OtomobilID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FAFAD2;color: #284775;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="OtomobilIDLabel" runat="server" Text='<%# Eval("OtomobilID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MarkaLabel" runat="server" Text='<%# Eval("Marka") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ResimLabel" runat="server" Text='<%# Eval("Resim") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #FFCC66;color: #000080;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="OtomobilIDLabel1" runat="server" Text='<%# Eval("OtomobilID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="MarkaTextBox" runat="server" Text='<%# Bind("Marka") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("Model") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ResimTextBox" runat="server" Text='<%# Bind("Resim") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="MarkaTextBox" runat="server" Text='<%# Bind("Marka") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("Model") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ResimTextBox" runat="server" Text='<%# Bind("Resim") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #FFFBD6;color: #333333;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="OtomobilIDLabel" runat="server" Text='<%# Eval("OtomobilID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MarkaLabel" runat="server" Text='<%# Eval("Marka") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ResimLabel" runat="server" Text='<%# Eval("Resim") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                        <th runat="server"></th>
                                        <th runat="server">OtomobilID</th>
                                        <th runat="server">Marka</th>
                                        <th runat="server">Model</th>
                                        <th runat="server">Resim</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="OtomobilIDLabel" runat="server" Text='<%# Eval("OtomobilID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MarkaLabel" runat="server" Text='<%# Eval("Marka") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ResimLabel" runat="server" Text='<%# Eval("Resim") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <br />
        </div>
    </form>
</body>
</html>
