using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using CoreDocUI.HelperClasses;
using CoreDocUI.Forms.MenuRelated;
using CoreLibrary;
using NuGet;
using TimeZoneNames;
using CoreLibrary.DataAccessLayer;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;


namespace CoreDocUI.Forms.LoginRelated
{
    /// <summary>
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        public Login()
        {
            InitializeComponent();
            CommonMethods.HandleForm(this);
            txtUserName.Text = "akori2029@gmail.com";
            txtPassWord.Password = "nikunj"; 
        }

        private void ConnectWithAzureDatabase()
        {
            try
            {
                string strConnect = "Server=tcp:myserver207.database.windows.net,1433;Initial Catalog=IncrevDB;Persist Security Info=False;User ID=admin207;Password=Tdmin@03;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
                SqlConnection con = new SqlConnection(strConnect);
                con.Open();
            }
            catch (Exception ex)
            {
                string xx = ex.Message;
            }
        }
        private void TestTimeZone()
        {
            //Date Time Values
            DateTime dtNew = new DateTime(2016, 7, 5, 09, 30, 4);
            DateTime dt = new DateTime(2016, 8, 4, 10, 40, 5);
            string timeZoneName = "America/Los_Angeles";
            TimeZoneNames.TimeZoneValues objTimeZoneValues = TimeZoneNames.TZNames.GetNamesForTimeZone(timeZoneName, "en-US");

            TimeZoneInfo objTimeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById(objTimeZoneValues.Standard);
            DateTime convertdt = TimeZoneInfo.ConvertTime(dt, objTimeZoneInfo);
        }
        private void TestUserNameId()
        {
            string userValue = "A03F4FDF-ED45-4618-BBFB-26219A44FBAF|Labdirector Theranos";
            Guid UserId = new Guid(userValue.Substring(0, 36));
            string UserName = userValue.Substring(37);
        }

        private void ConnectWithMyDB()
        {
            string strConnect = "Data Source=INCINDW004;AttachDbFilename=E:\\NewSQL\\MSSQL12.MSSQLSERVER\\MSSQL\\DATA\\MyDB.mdf;Initial Catalog=MyDB;user id=sa;password=Welcome!;Integrated Security=True;";
            SqlConnection con = new SqlConnection(strConnect);
            con.Open();
        }
        //<DeviceGroupList><DeviceGroupDetail><DeviceGroupId>4</DeviceGroupId><GroupName>Newark 1781-6</GroupName><Status></Status><StartDate>2016-09-06T00:00:00</StartDate><EndDate>1901-01-01T00:00:00</EndDate></DeviceGroupDetail><DeviceGroupDetail><DeviceGroupId>5</DeviceGroupId><GroupName>Newark Another 1781-6</GroupName><Status></Status><StartDate>2016-09-08T00:00:00</StartDate><EndDate>2017-01-01T00:00:00</EndDate></DeviceGroupDetail><DeviceGroupDetail><DeviceGroupId>6</DeviceGroupId><GroupName>Newark Others</GroupName><Status></Status><StartDate>2016-01-01T00:00:00</StartDate><EndDate>2018-01-01T00:00:00</EndDate></DeviceGroupDetail></DeviceGroupList>
        private List<DeviceGroup> ParseXMLStringToGetDeviceGroupDetails()
        {
            //string textXml = "<DeviceGroupList>";

            //textXml = textXml + "<DeviceGroupDetail>";
            //textXml = textXml + "<DeviceGroupId>1</DeviceGroupId>";
            //textXml = textXml + "<GroupName>Newark 1781-6</GroupName>";
            //textXml = textXml + "<Status>A</Status>";
            //textXml = textXml + "<StartDate>2015-02-01T00:00:00</StartDate>";
            //textXml = textXml + "<EndDate>2016-09-06T00:00:00</EndDate>";
            //textXml = textXml + "</DeviceGroupDetail>";

            //textXml = textXml + "<DeviceGroupDetail>";
            //textXml = textXml + "<DeviceGroupId>2</DeviceGroupId>";
            //textXml = textXml + "<GroupName>Newark Other 1781-6</GroupName>";
            //textXml = textXml + "<Status>A</Status>";
            //textXml = textXml + "<StartDate>2015-02-01T00:00:00</StartDate>";
            //textXml = textXml + "<EndDate>2017-09-06T00:00:00</EndDate>";
            //textXml = textXml + "</DeviceGroupDetail>";

            //textXml = textXml + "</DeviceGroupList>";

            string textXml = "<DeviceGroupList><DeviceGroupDetail><DeviceGroupId>4</DeviceGroupId><GroupName>Newark 1781-6</GroupName><Status></Status><StartDate>2016-09-06T00:00:00</StartDate><EndDate>1901-01-01T00:00:00</EndDate></DeviceGroupDetail><DeviceGroupDetail><DeviceGroupId>5</DeviceGroupId><GroupName>Newark Another 1781-6</GroupName><Status></Status><StartDate>2016-09-08T00:00:00</StartDate><EndDate>2017-01-01T00:00:00</EndDate></DeviceGroupDetail><DeviceGroupDetail><DeviceGroupId>6</DeviceGroupId><GroupName>Newark Others</GroupName><Status></Status><StartDate>2016-01-01T00:00:00</StartDate><EndDate>2018-01-01T00:00:00</EndDate></DeviceGroupDetail></DeviceGroupList>";

            List<DeviceGroup> lstDevice = new List<DeviceGroup>();
            System.Xml.XmlDocument xmlDoc = new System.Xml.XmlDocument();
            xmlDoc.LoadXml(textXml);

            System.Xml.XmlNodeList parentNode = xmlDoc.GetElementsByTagName("DeviceGroupDetail");
            foreach (System.Xml.XmlNode childrenNode in parentNode)
            {
                DeviceGroup objDeviceGroup = new DeviceGroup();

                objDeviceGroup.DeviceGroupId = Convert.ToInt64(childrenNode.SelectSingleNode("DeviceGroupId").InnerText);
                objDeviceGroup.GroupName = childrenNode.SelectSingleNode("GroupName").InnerText;
                objDeviceGroup.Status = childrenNode.SelectSingleNode("Status").InnerText;
                objDeviceGroup.StartDate = Convert.ToDateTime(childrenNode.SelectSingleNode("StartDate").InnerText);
                if (childrenNode.SelectSingleNode("EndDate").InnerText.ToUpper().Equals("NULL"))
                {
                    objDeviceGroup.EndDate = (DateTime?)null;
                }
                else
                {
                    objDeviceGroup.EndDate = Convert.ToDateTime(childrenNode.SelectSingleNode("EndDate").InnerText);
                }

                lstDevice.Add(objDeviceGroup);
            }

            return lstDevice;
        }

        private void ParseXMLStringToGetValues()
        {
            string textXml = "<DeviceGroupList>";

            textXml = textXml + "<DeviceGroupDetail>";
            textXml = textXml + "<DeviceGroupId>1</DeviceGroupId>";
            textXml = textXml + "<Status>A</Status>";
            textXml = textXml + "<StartDate>01/01/2015</StartDate>";
            textXml = textXml + "<EndDate>15/10/2015</EndDate>";
            textXml = textXml + "</DeviceGroupDetail>";

            textXml= textXml + "<DeviceGroupDetail>";
            textXml = textXml + "<DeviceGroupId>2</DeviceGroupId>";
            textXml = textXml + "<Status>A</Status>";
            textXml = textXml + "<StartDate>01/01/2016</StartDate>";
            textXml = textXml + "<EndDate>15/10/2016</EndDate>";
            textXml = textXml + "</DeviceGroupDetail>";

            textXml= textXml + "</DeviceGroupList>";

            System.Xml.XmlDocument xmlDoc = new System.Xml.XmlDocument();
            xmlDoc.LoadXml(textXml);

            System.Xml.XmlNodeList parentNode = xmlDoc.GetElementsByTagName("DeviceGroupDetail");
            foreach (System.Xml.XmlNode childrenNode in parentNode)
            {
                string deviceGroupId = childrenNode.SelectSingleNode("DeviceGroupId").InnerText;
                string status = childrenNode.SelectSingleNode("Status").InnerText;
                string startDate = childrenNode.SelectSingleNode("StartDate").InnerText;
                string endDate = childrenNode.SelectSingleNode("EndDate").InnerText;
            }

            //string xpath = "DeviceGroupList/DeviceGroupDetail";
            //var nodes = xmlDoc.SelectNodes(xpath);

            //foreach (System.Xml.XmlNode childrenNode in nodes)
            //{
            //    string deviceGroupId = childrenNode.SelectSingleNode("//DeviceGroupId").Value;
            //    string status = childrenNode.SelectSingleNode("//Status").Value;
            //    string startDate = childrenNode.SelectSingleNode("//StartDate").Value;
            //    string endDate = childrenNode.SelectSingleNode("//EndDate").Value;
            //} 

            //[DeviceGroupId] [bigint] NOT NULL,
            //[QuantReferenceId] [int] NULL,
            //[EnumReferenceId] [int] NULL,
            //[Status] [varchar](1) NOT NULL,
            //[StartDate] [datetime] NOT NULL,
            //[EndDate] [datetime] NULL,
        }

        private void CompareUsingExcept()
        {
            int[] ints1 = { 5, 3};
            int[] ints2 = { 8, 3, 5};
            int[] Except = ints1.Except(ints2).ToArray();
            int xxx = Except.Count();
            foreach (int num in Except)
            {
                int x = num;
            }

            int[] Except1 = ints2.Except(ints1).ToArray();
            foreach (int num in Except1)
            {
                int x = num;
            }

        }
        private void OptionalMethod(int value = 1, string name = "Perl")
        {
            Console.WriteLine("value = {0}, name = {1}", value, name);
        }

        private ReturnData<List<CoreLibrary.DataAccessLayer.Employee>> AccessEmployee()
        {
            List<CoreLibrary.DataAccessLayer.Employee> lstEmp = new List<CoreLibrary.DataAccessLayer.Employee>();
            CoreLibrary.DataAccessLayer.Employee objEmp = new CoreLibrary.DataAccessLayer.Employee();
            objEmp.empId = 1;
            objEmp.empName = "Amit";
            objEmp.salary = objEmp.CalculateSalary(4000);
            lstEmp.Add(objEmp);

            objEmp = new CoreLibrary.DataAccessLayer.Employee();
            objEmp.empId = 2;
            objEmp.empName = "Vijay";
            objEmp.salary = objEmp.CalculateSalary(6000);
            lstEmp.Add(objEmp);

            objEmp = new CoreLibrary.DataAccessLayer.Employee();
            objEmp.empId = 3;
            objEmp.empName = "Tarun";
            objEmp.salary = objEmp.CalculateSalary(8000);
            lstEmp.Add(objEmp);

            ReturnData<List<CoreLibrary.DataAccessLayer.Employee>> objRetData = new ReturnData<List<Employee>>();
            objRetData.ErrorMessage = "";
            objRetData.Value = lstEmp;

            return objRetData;   
        }

        private ReturnData<CoreLibrary.DataAccessLayer.Department> AccessDepartment()
        {
            CoreLibrary.DataAccessLayer.Department objDept = new CoreLibrary.DataAccessLayer.Department();
            objDept.deptId = 1;
            objDept.deptName = objDept.GetDepartmentName("ADM");

            ReturnData<Department> objRetData = new ReturnData<Department>();
            objRetData.ErrorMessage = "";
            objRetData.Value = objDept;

            return objRetData;
        }
        private void TestRecursion(int counter)
        {
            MessageBox.Show(counter.ToString());
            counter = counter - 1;
            if (counter==0)
            {
                return; 
            }
            else
            {
                TestRecursion(counter);
            }
        }
        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            TestData objTestData = new TestData();
            objTestData.InsertData();
            TestRecursion(5);
            TestRemoveMethod();
            ConnectWithMyDB();
            ConnectWithAzureDatabase();
            var objEmp = AccessEmployee();
            if(objEmp!=null)
            {
                for(int cnt=0;cnt<objEmp.Value.Count();cnt++)
                {
                    int empId = objEmp.Value[cnt].empId;
                    string empName = objEmp.Value[cnt].empName;
                    double sal = objEmp.Value[cnt].salary;
                }
            }

            var objDept = AccessDepartment();
            if (objDept != null)
            {
                int deptId = objDept.Value.deptId;
                string deptName = objDept.Value.deptName;
            }

            OptionalMethod();
            CompareUsingExcept();
            ParseXMLStringToGetDeviceGroupDetails();
            ParseXMLStringToGetValues();
            if(!Validation())
            {
                return;
            }

            MainMenu mainMenu = new MainMenu();
            mainMenu.Show();
            this.Close();
        }

        private bool Validation()
        {
            string ValidateMsg = string.Empty;
            if (string.IsNullOrEmpty(txtUserName.Text))
            {
                ValidateMsg = "Please Enter UserName";
            }
            if (string.IsNullOrEmpty(txtPassWord.Password))
            {
                ValidateMsg = ValidateMsg + "\n Please Enter Password";
            }
            if (string.IsNullOrEmpty(ValidateMsg))
            {
                return true;
            }
            else
            {
                MessageBox.Show(ValidateMsg, "Error Message", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return false;
        }

        private void TestRemoveMethod()
        {
            string strValue= "Location:Newark,Provider:Theranos,User:LabDirector,";
            strValue = strValue.Remove(strValue.Length-1);
        }
        private bool ValidateLogin()
        {
            var result = new DataManagement().GetMasterData(8, txtUserName.Text.Trim());

            string ValidateMsg = string.Empty;
            if (string.IsNullOrEmpty(txtUserName.Text))
            {
                ValidateMsg = "Please Enter UserName";
            }
            if (string.IsNullOrEmpty(txtPassWord.Password))
            {
                ValidateMsg = ValidateMsg + "\n Please Enter Password";
            }
            if (string.IsNullOrEmpty(ValidateMsg))
            {
                return true;
            }
            else
            {
                MessageBox.Show(ValidateMsg, "Error Message", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return false;
        }
    }

    public class DeviceGroup
    {
        public long DeviceGroupId { get; set; }
        public string GroupName { get; set; }
        public string Status { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
    }
}
