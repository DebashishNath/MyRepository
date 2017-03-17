using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;
using System.Data;
using System.IO;
using System.Windows;
using System.Windows.Controls;
using System.Security.Cryptography;
using System.Configuration;
using System.Text.RegularExpressions;

namespace CoreDocUI.HelperClasses
{
    public class CommonMethods
    {
        public static void HandleForm(Window wn)
        {
            wn.WindowStyle=WindowStyle.ToolWindow;
            wn.WindowStartupLocation = WindowStartupLocation.CenterScreen;
        }

        public static string GetHashPassword(string inputPassword)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(inputPassword);
            return System.Convert.ToBase64String(plainTextBytes);
        }

        public static string GetOriginalPassword(string inputHashPassword)
        {
            var base64EncodedBytes = System.Convert.FromBase64String(inputHashPassword);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
        }
    }
}
