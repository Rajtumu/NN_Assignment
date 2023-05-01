trigger LeadTrigger on Lead (before update) {
   
    if(Trigger.isBefore&&Trigger.isUpdate){
        LeadTriggerHandler lt=new LeadTriggerHandler();
        lt.beforeUpdate(Trigger.new,Trigger.oldMap);
    }
}