public class fieldController 
{
    public list<Selectoption> objectall {get;set;}
    public String objName{get;set;}
    public List<Selectoption> fieldAll{get;set;}
    public List<Sobject> objectAllrecords{get;set;}
    public List<String> fieldSelect{get;set;}
    public List<SelectOption> ascendingdesc {get;set;}
    public String order{get;set;}
    public List<SelectOption> limits{get;set;}
    public String limitselect{get;set;}
    public String querypage{get;set;}
    
    public fieldController()
    {
        Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        objectall = new List<Selectoption>();
        fieldAll=new List<Selectoption>();
        objectAllrecords=new List<Sobject>();
        for(Schema.Sobjecttype obj: schemaMap.values())
        {           
            if(obj.getDescribe().isQueryable())          
                objectall.add(new Selectoption(obj.getDescribe().getname(),obj.getDescribe().getLabel()));
        }
        objectall.sort();
        
        ascendingdesc = new List<SelectOption>();
        ascendingdesc.add(new SelectOption('Asc','Ascending'));
        ascendingdesc.add(new SelectOption('Desc','Descending'));
        
        limits = new List<SelectOption>();
        limits.add(new SelectOption('500','500'));
        limits.add(new SelectOption('1000','1000'));
        limits.add(new SelectOption('5000','5000'));
        limits.add(new SelectOption('10000','10000'));
        
        order = 'Asc';
        limitselect= '500';
    }

    public void showfields()
    {
        fieldAll = new List<SelectOption>();
        Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<String,schema.Sobjectfield> mapFields=schemaMap.get(objName).getDescribe().fields.getMap();     
        for(schema.Sobjectfield field:mapFields.values())
        {
            fieldAll.add(new Selectoption(field.getDescribe().getname(),field.getDescribe().getLabel ()));
        }
        
        fieldAll.sort();
        querypage ='';
        objectAllrecords = new List<SObject>();
    }
    
    public void executequery()
    {
        objectAllrecords = new List<Sobject>();
        try
        {
            String query = 'Select ' ;            
            for(String field : fieldSelect)  
            {   
                query = query + field + ',' ;  
            }           
            query = query.removeEnd(',');
            query = query + ' from ' + objName; 
            query = query + ' ORDER by Name ' + order;  
            query = query + ' limit ' + limitselect;
            querypage = query;
            objectAllrecords = Database.query(query) ;
        } 
        catch(Exception e)
        {
            Apexpages.addMessage(new Apexpages.Message(ApexPages.Severity.ERROR,'Wrong Query'));
            Apexpages.addMessage(new Apexpages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }
    }
}