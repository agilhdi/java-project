import java.util.*;
public class TestHashset {
    public static void main(String[] args){
        Set set = new HashSet();

        set.add("Blitar");
        set.add("Jember");
        set.add("Jombang");
        set.add("Malang");
        set.add("Probolinggo");
        set.add("Malang");

        System.out.println(set);

        Iterator<String> iterator = set.iterator();
        while (iterator.hasNext()) {
            System.out.println(iterator.next().toUpperCase()+" ");
        } 
    }
}
