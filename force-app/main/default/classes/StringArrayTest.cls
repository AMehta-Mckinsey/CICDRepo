public class StringArrayTest {
    public static List<string> generateStringArray(integer i){
        integer k;
        List<string> nList = new List<String>();
        for(k=0; k<i; k++){
            nList.add('Test ' + k);
		}
        system.debug('--List-- ' +nList );
        return nList;
    }
}