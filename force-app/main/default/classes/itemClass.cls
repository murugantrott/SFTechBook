public class itemClass {
    public static string itemIDmethod (string itemId){
    Map<String, String> isoArray = new Map<String, String>{

    '0'  => '0',

        '1'  => '1',

        '2'  => '2',

        '3'  => '3',

        '4'  => '4',

        '5'  => '5',

        '6'  => '6',

        '7'  => '7',

        '8'  => '8',

        '9'  => '9',

        'A'  => '10',

        'B'  => '11',

        'C'  => '12',

        'D'  => '13',

        'E'  => '14',

        'F'  => '15',

        'G'  => '16',

        'H'  => '17',

        'I'  => '18',

        'J'  => '19',

        'K'  => '20',

        'L'  => '21',

        'M'  => '22',

        'N'  => '23',

        'O'  => '24',

        'P'  => '25',

        'Q'  => '26',

        'R'  => '27',

        'S'  => '28',

        'T'  => '29',

        'U'  => '30',

        'V'  => '31',

        'W'  => '32',

        'X'  => '33',

        'Y'  => '34',

        'Z'  => '35'

        };

            Integer lngCheck = 36;

for (Integer lng = 0; lng <= itemId.length() - 1; lng++) { 

    String charAtPosition = String.valueOf(itemId.substring(lng, lng+1)).toUpperCase();
    system.debug('charAtPosition' + charAtPosition);

    Integer returnvalue = -1;

    if (isoArray.containsKey(charAtPosition)) {

        returnvalue = Integer.valueOf(isoArray.get(charAtPosition));
        system.debug('returnvalue' +returnvalue);

    }

    lngCheck = lngCheck + Integer.valueOf(returnvalue);         

    if (lngCheck > 36) {lngCheck = lngCheck - 36;
                       }
    lngCheck = lngCheck * 2;
                       
                       
                       

    if (lngCheck >= 37) {lngCheck = lngCheck - 37;} 

    System.debug('for loop => '+lngCheck);

}       

lngCheck = 37 - lngCheck;       

if (lngCheck == 36)lngCheck = 0;  
system.debug('lngcheck' +lngCheck);

String checkDigit = null;

for (String isoKey : isoArray.keySet()) {

    System.debug('lngCheck for checkdigit '+lngCheck);

    System.debug('isoArray.get(isoKey) for checkdigit'+isoArray.get(isoKey));

    if (lngCheck == Integer.valueOf(isoArray.get(isoKey))) {

        checkDigit = isoKey;

    }

}
       system.debug('result ' +itemId+checkDigit);
        return itemId+checkDigit;
    }
}