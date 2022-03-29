trigger MapAccount on Opportunity (before insert,before update) {
    
  /*  List<Opportunity> ol=[select id,AccountId,Account.rating from Opportunity where id in: Trigger.new and StageName='Qualification'];
    Map<ID,Opportunity> mp=new Map<ID,Opportunity>();
    System.debug('----------' + ol);
    
    for(Opportunity o:ol){
        o.Account.rating='Cold';
        mp.put(o.id, o);
        System.debug('Rate--'+o.Account.rating);
    }
    System.debug(mp.values());*/
}