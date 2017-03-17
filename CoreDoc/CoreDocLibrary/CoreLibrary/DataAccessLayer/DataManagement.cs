using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CoreLibrary;
using CoreLibrary.DataAccessLayer;

namespace CoreLibrary
{
    public class DataManagement : IDataManagement
    {
        public DataManagement()
        { }

        /// <summary>
        /// This method will save Application Information
        /// </summary>
        /// <param name="tag"></param>
        /// <param name="applicationId"></param>
        /// <param name="applicationName"></param>
        /// <returns></returns>
        public ResponseStatus SaveApplication(string tag,int applicationId, string applicationName)
        {
            ResponseStatus objResp = new ResponseStatus();
            try
            {
                using (CoreDocDBEntities db = new CoreDocDBEntities())
                {
                    var result = db.SaveApplication(tag, applicationId, applicationName);
                    objResp.ResponseCode = ReturnCodes.SUCCESS;
                }
            }
            catch (Exception ex)
            {
                objResp.ResponseCode = ReturnCodes.ERROR;
                objResp.ResponseMessage = ex.Message;
            }
            return objResp;
        }

        /// <summary>
        /// This method will save User Information
        /// </summary>
        /// <param name="tag"></param>
        /// <param name="userId"></param>
        /// <param name="userName"></param>
        /// <param name="userFullName"></param>
        /// <param name="userPassword"></param>
        public ResponseStatus SaveUser(string tag, Guid? userId, string userName, string userFullName, string userPassword)
        {
            ResponseStatus objResp = new ResponseStatus();
            try
            {
                using (CoreDocDBEntities db = new CoreDocDBEntities())
                {
                    var result = db.SaveUserInfo(tag, userId, userName, userFullName, userPassword);
                    objResp.ResponseCode = ReturnCodes.SUCCESS;
                }
            }
            catch (Exception ex)
            {
                objResp.ResponseCode = ReturnCodes.ERROR;
                objResp.ResponseMessage = ex.Message;
            }
            return objResp;
        }

        /// <summary>
        /// This method will save User and Application Map Information
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="applicationId"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public ResponseStatus SaveUserApplicationMap(Guid? userId, int applicationId, string status)
        {
            ResponseStatus objResp = new ResponseStatus();
            try
            {
                using (CoreDocDBEntities db = new CoreDocDBEntities())
                {
                    var result = db.SaveUserApplicationMap(userId,applicationId,status);
                    objResp.ResponseCode = ReturnCodes.SUCCESS;
                }
            }
            catch (Exception ex)
            {
                objResp.ResponseCode = ReturnCodes.ERROR;
                objResp.ResponseMessage = ex.Message;
            }
            return objResp;
        }

        /// <summary>
        /// This method will save Document Type Information
        /// </summary>
        /// <param name="tag"></param>
        /// <param name="documentTypeId"></param>
        /// <param name="applicationId"></param>
        /// <param name="documentTypeName"></param>
        /// <param name="userId"></param>
        public ResponseStatus SaveDocumentType(string tag, Guid? documentTypeId, int applicationId, string documentTypeName, Guid? userId)
        {
            ResponseStatus objResp = new ResponseStatus();
            try
            {
                using (CoreDocDBEntities db = new CoreDocDBEntities())
                {
                    var result = db.SaveDocumentType(tag, documentTypeId, applicationId, documentTypeName, userId);
                    objResp.ResponseCode = ReturnCodes.SUCCESS;  
                }
            }catch(Exception ex)
            {
                objResp.ResponseCode = ReturnCodes.ERROR;
                objResp.ResponseMessage = ex.Message;
            }
            return objResp;
        }

        /// <summary>
        /// This method will save Parent Link Information
        /// </summary>
        /// <param name="tag"></param>
        /// <param name="parentLinkId"></param>
        /// <param name="parentLinkName"></param>
        /// <param name="userId"></param>
        public ResponseStatus SaveParentLink(string tag, Guid? parentLinkId, string parentLinkName, Guid? userId)
        {
            ResponseStatus objResp = new ResponseStatus();
            try
            {
                using (CoreDocDBEntities db = new CoreDocDBEntities())
                {
                    var result = db.SaveParentLink(tag, parentLinkId, parentLinkName,userId);
                    objResp.ResponseCode = ReturnCodes.SUCCESS;  
                }
            }
            catch (Exception ex)
            {
                objResp.ResponseCode = ReturnCodes.ERROR;
                objResp.ResponseMessage = ex.Message;
            }
            return objResp;
        }

        /// <summary>
        /// This method will save Child Link Information
        /// </summary>
        /// <param name="tag"></param>
        /// <param name="childLinkId"></param>
        /// <param name="parentLinkId"></param>
        /// <param name="childLinkName"></param>
        /// <param name="userId"></param>
        public ResponseStatus SaveChildLink(string tag, Guid? childLinkId, Guid? parentLinkId, string childLinkName, Guid? userId)
        {
            ResponseStatus objResp = new ResponseStatus();
            try
            {
                using (CoreDocDBEntities db = new CoreDocDBEntities())
                {
                    var result = db.SaveChildLink(tag, childLinkId, parentLinkId, childLinkName, userId);
                    objResp.ResponseCode = ReturnCodes.SUCCESS;  
                }
            }
            catch (Exception ex)
            {
                objResp.ResponseCode = ReturnCodes.ERROR;
                objResp.ResponseMessage = ex.Message;
            }
            return objResp;
        }
    
        /// <summary>
        /// This method will save Document Information
        /// </summary>
        /// <param name="documentId"></param>
        /// <param name="documentTypeId"></param>
        /// <param name="parentLinkId"></param>
        /// <param name="childLinkId"></param>
        /// <param name="tab"></param>
        /// <param name="section"></param>
        /// <param name="operation"></param>
        /// <param name="viewModel"></param>
        /// <param name="XAMLFileName"></param>
        /// <param name="commandName"></param>
        /// <param name="propertyName"></param>
        /// <param name="propertyDescription"></param>
        /// <param name="serviceFileName"></param>
        /// <param name="serviceMethodName"></param>
        /// <param name="procedureName"></param>
        /// <param name="comments"></param>
        /// <param name="documentStatus"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public ResponseStatus SaveDocument(Guid? documentId, Guid? documentTypeId, Guid? parentLinkId, Guid? childLinkId, string tab, string section, string operation, string viewModel,string XAMLFileName,string commandName,
                                            string propertyName,string propertyDescription,string serviceFileName,string serviceMethodName,string procedureName,string comments,string documentStatus,Guid? userId)
        {
            ResponseStatus objResp = new ResponseStatus();
            try
            {
                using (CoreDocDBEntities db = new CoreDocDBEntities())
                {
                    var result = db.SaveDocument(documentId,documentTypeId,parentLinkId,childLinkId,tab,section,operation,viewModel,XAMLFileName,commandName,propertyName,propertyDescription,
                                                serviceFileName,serviceMethodName,procedureName,comments,documentStatus,userId);
                    objResp.ResponseCode = ReturnCodes.SUCCESS;
                }
            }
            catch (Exception ex)
            {
                objResp.ResponseCode = ReturnCodes.ERROR;
                objResp.ResponseMessage = ex.Message;
            }
            return objResp;
        }


        /// <summary>
        /// This method will return master data
        /// </summary>
        /// <param name="key"></param>
        /// <param name="searchValue"></param>
        /// <returns></returns>
        public CoreDocDataResult GetMasterData(int key, string searchValue)
        {
            CoreDocDataResult coreDataResult = new CoreDocDataResult();
            List<CoreDocData> lstCoreDocData = new List<CoreDocData>();
            CoreDocData objCoreDocData = new CoreDocData();
            ResponseStatus objResp = new ResponseStatus();
            try
            {
                using (CoreDocDBEntities db = new CoreDocDBEntities())
                {
                    var result = db.GetMasterData(key,searchValue);
                    if (result != null && result.Count() > 0)
                    {
                        foreach (var report in result)
                        {
                            objCoreDocData.Id = report.Id;
                            objCoreDocData.DataId = report.DataId;
                            objCoreDocData.DataName = report.DataName;
                            objCoreDocData.OtherInfo1 = report.OtherInfo1.ToString();
                            objCoreDocData.OtherInfo2 = report.OtherInfo2;
                            objCoreDocData.OtherInfo3 = report.OtherInfo3.ToString();
                            objCoreDocData.OtherInfo4 = report.OtherInfo4;
                            lstCoreDocData.Add(objCoreDocData);
                        }
                        coreDataResult.CoreDataInfo = lstCoreDocData;
                        objResp.ResponseCode = ReturnCodes.SUCCESS;
                        coreDataResult.CoreDataResponse = objResp;
                    }
                }
            }
            catch (Exception ex)
            {
                coreDataResult.CoreDataInfo = null;
                objResp.ResponseCode = ReturnCodes.ERROR;
                objResp.ResponseMessage = ex.Message;
                coreDataResult.CoreDataResponse = objResp;
            }
            return coreDataResult;
        }
    }
   
}
