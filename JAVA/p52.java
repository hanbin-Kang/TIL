import java.util.Scanner;

public class p52 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = sc.nextInt();
        
        long[] arrTwo = new long[n];
        StringBuilder sb = new StringBuilder();
        arrTwo[0] = arr[0];
        sb.append(arrTwo[0]);
        long num = arr[0];
        for (int i=1; i<n; i++) {
            num += arr[i];
            arrTwo[i] = num;
            if (sb.length() > 0) sb.append(" ");
            sb.append(arrTwo[i]);
        }
        System.out.println(sb);
        sc.close();
    }
}
