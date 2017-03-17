using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CoreLibrary.DataAccessLayer
{
    public class TestData
    {
        public TestData()
        {}

        public int InsertData()
        {
            try
            {
                string sqlConnect = "Data source=INCINDW004\\MSSQLSERVER16;initial catalog=TestDB;User Id=sa;password=Welcome!;Integrated Security=false;Trusted_Connection=false;";
                SqlConnection _sqlconn = new SqlConnection(sqlConnect);
                _sqlconn.Open();
                SqlCommand cmd = _sqlconn.CreateCommand();

                cmd.CommandText = @"INSERT INTO [TestDB].[dbo].[M_EMP] ([LastName], [Salary]) VALUES (@LastName, @Salary);";

                SqlParameter paramLastName = cmd.CreateParameter();
                paramLastName.ParameterName = @"LastName";
                paramLastName.DbType = DbType.AnsiStringFixedLength;
                paramLastName.Direction = ParameterDirection.Input;
                paramLastName.Value = "Gupta";
                paramLastName.Size = 32;
                cmd.Parameters.Add(paramLastName);

                SqlParameter paramSalary = cmd.CreateParameter();
                paramSalary.ParameterName = @"Salary";
                paramSalary.DbType = DbType.Int32;
                paramSalary.Direction = ParameterDirection.Input;
                paramSalary.Value = 2000;
                cmd.Parameters.Add(paramSalary);

                cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
                return -1;
            }
            return 0;
        }
    }
}
