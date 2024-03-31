public with sharing class DateReturn {
    
    
    public date getdate1(){
        date d = date.today().addDays(-1);
        system.debug('date' +d);
        return d;
    }

}