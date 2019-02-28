public class TODOController 
{
	@RemoteAction
	public static List<Group__c> getGroups()
	{
		return [select id, Name, Open_Task_Count__c, Description__c 
				from Group__c];
	}

	@RemoteAction
	public static List<Task__c> getTasks(Id groupId)
	{
		return [select id, Name, Description__c, Due_Date__c, Group__r.Name, Complete__c, Status_Image__c 
				from Task__c 
				where Group__c=:groupId
				order by Due_Date__c];
	}
	
	@RemoteAction
	public static List<Task__c> getTask(Id taskId)
	{
		return [select id, Name, Description__c, Due_Date__c, Group__r.Name, Complete__c, Completed_Date__c, Status_Image__c 
				from Task__c 
				where Id=:taskId];
	}

	@RemoteAction
	public static String completeTask(Id taskId, Date theDate)
	{
		String result='success';
		try
		{		
			List<Task__c> tasks=[select id, Group__c, Complete__c from Task__c where Id=:taskId];
			if (tasks.size()>0)
			{	
				Task__c task=tasks[0];
				task.Complete__c=true;
				task.Completed_Date__c=theDate;
				update task;
			}
		}
		catch(Exception e)
		{
			result=e.getMessage();
		}
		
		return result;
	}
	
	@RemoteAction
	public static String createTask(String groupName, String name, String day, String month, String year, String descrip)
	{
		String result='success';
		try
		{		
			List<Group__c> groups=[select id, Name from Group__c where Name=:groupName];
			if (groups.size()>0)
			{	
				Group__c grp=groups[0];
				Task__c newTask=new Task__c(Name=name,
											Group__c=grp.id,
											Due_Date__c=Date.newInstance(Integer.valueOf(year), 
																		 Integer.valueOf(month)+1, 
																		 Integer.valueOf(day)),
											Description__c=descrip);
				
				insert newTask;
			}
		}
		catch(Exception e)
		{
			result=e.getMessage();
		}
		
		return result;
	}
	
	@RemoteAction
	public static String createGroup(String groupName, String groupDesc)
	{
		String result='success';
		try
		{		
			Group__c newGroup=new Group__c(Name=groupName,
										   Description__c=groupDesc);
				
			insert newGroup;
		}
		catch(Exception e)
		{
			result=e.getMessage();
		}
		
		return result;
	}
}