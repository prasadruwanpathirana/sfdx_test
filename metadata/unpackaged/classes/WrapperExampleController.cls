public with sharing class WrapperExampleController 
{

  public ApexPages.StandardController myAccountController {get; set;}
  public Account Account {get; set;}
  public Id tId {get; set;}
  
  public ApexPages.StandardController myUserController {get; set;}
  public User User {get; set;}
  
  public ApexPages.StandardController standardContactController;
    
  public WrapperExampleController (ApexPages.StandardController cntrl) {
    tId = ApexPages.currentPage().getParameters().get('Id');
    system.debug('123' + tId );
    standardContactController = cntrl;


  }

}