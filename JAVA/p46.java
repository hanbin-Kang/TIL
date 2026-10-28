import java.util.Arrays;
import java.util.Scanner;

public class p46 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int k = sc.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = sc.nextInt();
        // 가장 큰 k개를 출력
        StringBuilder sb = new StringBuilder();
        Arrays.sort(arr);
        for (int i=arr.length-1; i>=n-k; i--) {
            if (sb.length() > 0) sb.append(" ");
            sb.append(arr[i]);
        }
        System.out.println(sb);
        sc.close();
    }
}
