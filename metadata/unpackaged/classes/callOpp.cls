public class callOpp{

    public Opportunity getOpp() {
       
       return [select name from opportunity LIMIT 1];
    }



    public callOpp() {

    }


    public callOpp(ApexPages.StandardController controller) {

    }


  public list<opportunity> getaccounts (){
  list<opportunity> test = new list<opportunity>();
  test = [select name from opportunity];
  
  System.debug(test);
  return test;
  }


}