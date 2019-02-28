public class quickEmailController{
    
    ApexPages.StandardSetController setCon;
    
    public quickEmailController(ApexPages.StandardSetController controller)
    {
        setCon = controller;
    }

    public pageReference doSomething()
    {
        // do something with the selected records
        String s;
        for ( Account acc : (Account[])setCon.getSelected() )
        {
                s =+ String.valueOf(acc.Id) + '\'' ;
        }
        
        system.debug('test :' + s);
        PageReference pageRef = new PageReference('/apex/ABSI_Mass_Task_Action?' + s);
        pageRef.setRedirect(true);
        return pageRef;
        
    }
}