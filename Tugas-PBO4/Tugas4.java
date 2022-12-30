import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Tugas4 {
    public static void main(String[] args) {
        List<String> lis = new ArrayList<String>();
        
        lis.add("Agil");
        lis.add("Abdulhadi");
        lis.add("Mustofa");
        lis.add("XII-RPLA");
 
        for (Iterator<String> iterator = lis.iterator(); iterator.hasNext();) {
            String string = (String) iterator.next();
            System.out.println(string);
        }
    }
}