({
	 doInit : function(component, event) {
        $A.createComponent(
            "c:form",
            {
                
            },
            function(newComponent){
                component.set("v.body",newComponent);
            }
        )
    },
    getExpenseList : function(component, event) {
        alert('2');
        $A.createComponent(
            "c:expenseList",
            {
               "expense" : event.getParam("expense")
            },
            function(newComponent){
                component.set("v.body",newComponent);
            }
        )
    }
})