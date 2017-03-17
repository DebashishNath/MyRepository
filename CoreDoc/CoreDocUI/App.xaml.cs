using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace CoreDocUI
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public App()
        {
            //this.StartupUri = new Uri("Forms/LoginRelated/Login.xaml", UriKind.Relative);
            this.StartupUri = new Uri("Forms/LoginRelated/Login.xaml", UriKind.Relative);
        }
    }
}
