@RestResource(urlMapping='/Account/Contacts/*')
global with sharing class AccountManager
{
  @HttpGet
   global static Account getAccount()
   {
      RestRequest request = RestContext.request;
        String AccountId= request.requestURI.substring(   request.requestURI.lastIndexOf('/')+1);
        Account result =  [SELECT Id,Name FROM Account WHERE Id = :AccountId];               
        return result;
   }
 
}