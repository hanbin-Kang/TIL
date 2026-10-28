import java.util.Arrays;
import java.util.Scanner;

public class p45 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = sc.nextInt();
        Arrays.sort(arr);
        StringBuilder sb = new StringBuilder();
        for (int i=arr.length-1; i>=0; i--) {
            if (sb.length() > 0) sb.append(" ");
            sb.append(arr[i]);
        }
        System.out.println(sb);
        sc.close();
    }
}
