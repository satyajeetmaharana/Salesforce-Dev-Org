({
	handleClick : function(component, event, helper) {
        var buttonClicked = event.getSource();
        var buttonMessage = buttonClicked.get("v.label");
        component.set("v.message",buttonMessage);
		
	}
})