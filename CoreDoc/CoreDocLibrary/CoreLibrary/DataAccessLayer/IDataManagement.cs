using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreLibrary.DataAccessLayer
{
    public interface IDataManagement
    {

        ResponseStatus SaveUser(string tag, Guid? userId, string userName, string userFullName, string userPassword);
        ResponseStatus SaveUserApplicationMap(Guid? userId, int applicationId, string status);
        ResponseStatus SaveDocumentType(string tag, Guid? documentTypeId, int applicationId, string documentTypeName, Guid? userId);
        ResponseStatus SaveParentLink(string tag, Guid? parentLinkId, string parentLinkName, Guid? userId);
        ResponseStatus SaveChildLink(string tag, Guid? childLinkId, Guid? parentLinkId, string childLinkName, Guid? userId);
        ResponseStatus SaveDocument(Guid? documentId, Guid? documentTypeId, Guid? parentLinkId, Guid? childLinkId, string tab, string section, string operation, string viewModel, string XAMLFileName, string commandName,
                                            string propertyName, string propertyDescription, string serviceFileName, string serviceMethodName, string procedureName, string comments, string documentStatus, Guid? userId);

    }
}
