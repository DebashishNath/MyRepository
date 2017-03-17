using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreLibrary.DataAccessLayer
{
    public class CoreDocData
    {
        public Guid? Id { get; set; }
        public int DataId { get; set; }
        public string DataName { get; set; }
        public string OtherInfo1 { get; set; }
        public string OtherInfo2 { get; set; }
        public string OtherInfo3 { get; set; }
        public string OtherInfo4 { get; set; }
    }

    public class CoreDocDataResult
    {
        public List<CoreDocData> CoreDataInfo { get; set; }
        public ResponseStatus CoreDataResponse { get; set; }
    }

    public class ResponseStatus
    {
        public ReturnCodes ResponseCode { get; set; }
        public string ResponseMessage { get; set; }
    }

    public enum ReturnCodes : int
    {
        SUCCESS = 0,
        ERROR = -1
    }

    public class ReturnData<T>
    {
        public string ErrorMessage { get; set; }
        public T Value { get; set; }
    }

    public class Employee
    {
        public int empId;
        public string empName;
        public double salary;
        public double CalculateSalary(double inputSalary)
        {
            salary = inputSalary * 2;
            return salary;
        }
    }

    public class Department
    {
        public int deptId;
        public string deptName;
        public string GetDepartmentName(string tag)
        {
            switch(tag)
            {
                case "HR":
                    return "Human Resource";
                case "ADM":
                    return "Admin";
                case "SW":
                    return "Software";
            }
            return string.Empty;
        }
    }
}
