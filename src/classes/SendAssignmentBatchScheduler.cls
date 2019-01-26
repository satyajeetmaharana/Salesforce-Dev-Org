global class SendAssignmentBatchScheduler implements Schedulable {
   global void execute(SchedulableContext sc) {
      SendAssignmentBatch batch = new SendAssignmentBatch(); 
      database.executebatch(batch);
   }
}