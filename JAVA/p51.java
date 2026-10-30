import java.util.Arrays;
import java.util.Scanner;

public class p51 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int k = sc.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = sc.nextInt();
        // 배열에서 가장 작은 k개 출력
        Arrays.sort(arr);
        StringBuilder sb = new StringBuilder();
        for (int i=0; i<k; i++) {
            if (sb.length() > 0) sb.append(" ");
            sb.append(arr[i]);
        }
        System.out.println(sb);
        sc.close();
    }
}
