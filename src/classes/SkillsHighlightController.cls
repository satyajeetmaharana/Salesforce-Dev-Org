public class SkillsHighlightController{
    public List<SkillWrapper> SkillWrapperList{get;set;}
    public skillsHighlightController(){
        SkillWrapperList = new List<SkillWrapper>();
        
        for(Skill__c skillRec : [SELECT Id,Name, IsInactive__c, Completion__c FROM Skill__c WHERE IsInactive__c = false]){
            SkillWrapperList.add(new SkillWrapper(skillRec));
        }
    }
    
    public class SkillWrapper{
        public Skill__c skill{get;set;}
        public Decimal completedPer{get;set;}
        public Decimal uncompletedPer{get;set;}
        
        public SkillWrapper(Skill__c skill){
            this.skill = skill;
            completedPer = skill.Completion__c;
            uncompletedPer = 100-completedPer;
        
        }
        
    
    }
    
}