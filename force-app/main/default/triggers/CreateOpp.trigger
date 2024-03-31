trigger CreateOpp on Account (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        CreateOppHandler.createOpp(Trigger.newmap, Trigger.oldmap);
    }

}