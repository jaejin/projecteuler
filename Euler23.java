import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jaejinyun
 * Date: 13. 4. 9.
 * Time: 오후 11:15
 * To change this template use File | Settings | File Templates.
 */
public class Euler23 {

    private int numbers[] = new int[28123];


    private List<Integer> exceedNum = new ArrayList<Integer>();


    public Euler23() {
        for(int i = 0;i< numbers.length;i++) {
            numbers[i] = i;
        }
    }

    public int exceed(int n) {

        int sum = 0;

        for(int i=1;i < n-1;i++) {
            if ( n % i == 0 )
                sum = sum + i;
        }

        return sum;
    }


    public int find() {
        int sum = 0;
        for(int i = 1;i < numbers.length;i++)  {
            if( exceed(i) > i) {
                exceedNum.add(i);
                for(int e : exceedNum) {
                    if( e+i < numbers.length)
                        numbers[e+i] = 0;
                }
            }

            if( numbers[i] != 0)
              sum = sum+ i;
        }

        return sum;
    }

    public static void main(String[] args) {
        Euler23 euler23 = new Euler23();
        System.out.println(euler23.exceed(12));
        System.out.println(euler23.find());
    }
}
