trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> task = new List<Task>();
    List<Opportunity> opp = [Select Id, Name from Opportunity where StageName = 'Closed Won' and Id in : Trigger.New];
    for (Opportunity opp1 : opp){
        task.add(new Task(Subject = 'Follow Up Test Task',
                          WhatId = opp1.Id));
    }
    if (task.size() > 0){
        insert task;
    }
}