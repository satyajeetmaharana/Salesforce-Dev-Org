trigger mailNotifierTrigger on Case (after insert) {
    
    List <Case> newCases = Trigger.new;
    
    CaseStudy2.notifyMail(newCases);
    
    
}