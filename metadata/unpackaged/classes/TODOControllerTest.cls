/*******************************************************************
 * Test class for the TODOController
 *******************************************************************/
@isTest
private with sharing class TODOControllerTest 
{
	private static testMethod void testGetGroups()
	{
		Group__c grp=new Group__c(Name='Unit test',
								  Description__c='Unit test');
		insert grp;
		
		List<Group__c> groups=TODOController.getGroups();
		System.assertEquals(1, groups.size());
	}
		
	public static testMethod void testGetTasks()
	{
		Group__c grp=new Group__c(Name='Unit test',
								  Description__c='Unit test');
		insert grp;

		Task__c tsk=new Task__c(Name='Unit Test',
								Group__c=grp.id,
								Description__c='Unit test',
								Due_Date__c=System.today());		
	
		insert tsk;
		
		List<Task__c> tasks=TODOController.getTasks(grp.id);
		
		System.assertEquals(1, tasks.size());
	}
	
	public static testMethod void testGetTask()
	{
		Group__c grp=new Group__c(Name='Unit test',
								  Description__c='Unit test');
		insert grp;

		Task__c tsk=new Task__c(Name='Unit Test',
								Group__c=grp.id,
								Description__c='Unit test',
								Due_Date__c=System.today());		
	
		insert tsk;
		
		List<Task__c> tasks=TODOController.getTask(tsk.id);
		
		System.assertEquals(1, tasks.size());
	}

	public static testMethod void testCompleteTask()
	{
		Group__c grp=new Group__c(Name='Unit test',
								  Description__c='Unit test');
		insert grp;

		Task__c tsk=new Task__c(Name='Unit Test',
								Group__c=grp.id,
								Description__c='Unit test',
								Due_Date__c=System.today());		
	
		insert tsk;
		
		String result=TODOController.completeTask(tsk.id, System.today());
		System.assertEquals('success', result);
		
		List<Task__c> tasks=TODOController.getTask(tsk.id);
		System.assertEquals(1, tasks.size());
		System.assertEquals(System.today(), tasks[0].Completed_Date__c);
	}

	public static testMethod void testCreateTask()
	{
		Group__c grp=new Group__c(Name='Unit test',
								  Description__c='Unit test');
		insert grp;

		String result=TODOController.createTask(grp.Name, 'Unit Test', '10', '06', '2013', 'Unit Test');
		System.assertEquals('success', result);
		
		List<Task__c> tasks=TODOController.getTasks(grp.Id);
		System.assertEquals(1, tasks.size());
	}
	
	public static testMethod void testCreateGroup()
	{
		String result=TODOController.createGroup('Unit Test', 'Unit Test');
		System.assertEquals('success', result);
		
		List<Group__c> groups=TODOController.getGroups();
		System.assertEquals(1, groups.size());
	}
}