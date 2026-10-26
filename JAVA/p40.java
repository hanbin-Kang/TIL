import java.util.Scanner;
import java.util.ArrayList;

public class p40 {
    static ArrayList<Integer> Prime(int n) {
        ArrayList<Integer> list = new ArrayList<Integer>(); // 리스트의 선언
        for (int i=2; i<=n; i++) {
            boolean isPrime = true;
            for (int j=2; j*j<=i; j++) {
                if (i%j==0) {
                    isPrime = false;
                    break;
                }
            }
            if (isPrime) list.add(i);
        }
        return list;
    }

    public static void main(String[] args) {
        try(Scanner sc = new Scanner(System.in)) {
        int n = sc.nextInt();
        // n보다 작은 소수를 리스트에 넣은 후, n - 가장 작은 소수가 리스트에 있는지 확인 
        // 있으면 출력 + 정지, 없으면 다음 수로 넘어가기 
        ArrayList<Integer> result = Prime(n);
        StringBuilder sb = new StringBuilder();
        for (int i=0; i<result.size(); i++) { // 배열의 크기는 length(), 리스트의 크기는 size()
            int start = result.get(i);
            int target = n - start;
            for (int j=i; j<result.size(); j++) {
                if (target == result.get(j)) {
                    sb.append(start);
                    sb.append(" + ");
                    sb.append(target);
                    break;
                }
            }
            // sb에 하나 이상있으면 출력후 정지, 하나 이상 있으면 최솟값 + target
            if (sb.length() > 0) {
                System.out.println(sb);
                break;
            }
        }
    }
}
}
