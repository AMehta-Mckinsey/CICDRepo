trigger RestrictAccUpd on Account (before update) {
    if (Trigger.isUpdate && Trigger.isBefore) {
    //In a before delete trigger, the trigger accesses the records that will be deleted with the Trigger.old list.
        for (Account a : Trigger.New) {
           String str = Trigger.OldMap.get(a.Id).Name;
            if (str != 'okToUpd') {
                system.debug('Record: '+a.name+' failed to update');
                a.addError('You can\'t update this record!');
                continue;
            }
        }
    }
}