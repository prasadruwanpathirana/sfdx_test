({
    
    doInit : function(component, event) {
        var action = component.get("c.findAll");
        action.setCallback(this, function(a) {
            component.set("v.contacts", a.getReturnValue());            
        });
        $A.enqueueAction(action);        
    },
    
    changeValue : function (component, event, helper) {
        $('#testing').text('sdaf');
        alert(12);
      	component.set("v.myBool", false);
        var test  = component.find("testing");
        console.log(test);        
    },

    handleValueChange : function (component, event, helper) {
        // handle value change
        console.log("old value: " + event.getParam("oldValue"));
        console.log("current value: " + event.getParam("value"));
    }   
})