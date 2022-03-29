({
    doInit : function(component, event, helper) {
        /*global $*/
        $(".carousel").carousel();
        /*global $*/
        $(".carousel").carousel({
            
            // percent-per-second
            // default is 50
            // false = disable touch swipe
            swipe: 30
            
        });
    }
})