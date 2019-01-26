public class dependentPicklistController{
    public String state{ get;set; }
    public String district{get; set;}
    
    public List<SelectOption> getStates(){
        List<SelectOption> stateOptions = new List<SelectOption>();
        stateOptions.add(new SelectOption('NONE','-------NONE------'));
        stateOptions.add(new SelectOption('UP','UP'));
        stateOptions.add(new SelectOption('MP','MP'));
        stateOptions.add(new SelectOption('Maharastra','Maharastra'));
        stateOptions.add(new SelectOption('Gujarat','Gujarat'));
        
        return stateOptions;
    
    }
    
    public List<SelectOption> getDistricts(){
        List<SelectOption> districtOptions = new List<SelectOption>();
        districtOptions.add(new SelectOption('NONE','-------NONE------'));
        if(state=='UP'){
                districtOptions.add(new SelectOption('UP district1','UP district1'));
                districtOptions.add(new SelectOption('UP district2','UP district2'));
                districtOptions.add(new SelectOption('UP district3','UP district3'));
                districtOptions.add(new SelectOption('UP district4','UP district4'));
        }
        else if(state == 'MP'){
                districtOptions.add(new SelectOption('MP district1','MP district1'));
                districtOptions.add(new SelectOption('MP district2','MP district2'));
                districtOptions.add(new SelectOption('MP district3','MP district3'));
                districtOptions.add(new SelectOption('MP district4','MP district4'));
        }   
        else if(state == 'Maharastra'){
                districtOptions.add(new SelectOption('MH district1','MH district1'));
                districtOptions.add(new SelectOption('MH district2','MH district2'));
                districtOptions.add(new SelectOption('MH district3','MH district3'));
                districtOptions.add(new SelectOption('MH district4','MH district4'));
        }  
        else if(state == 'Gujarat'){
                districtOptions.add(new SelectOption('GJ district1','GJ district1'));
                districtOptions.add(new SelectOption('GJ district2','GJ district2'));
                districtOptions.add(new SelectOption('GJ district3','GJ district3'));
                districtOptions.add(new SelectOption('GJ district4','GJ district4'));
        }  
        return districtOptions;
    }
}