import java.util.Scanner;
import java.util.Arrays;

public class p57 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] a = new int[n];
        for (int i = 0; i < n; i++) a[i] = sc.nextInt();
        int m = sc.nextInt();
        int[] b = new int[m];
        for (int i = 0; i < m; i++) b[i] = sc.nextInt();
        // 배열 만들기
        int[] arr = new int[n+m];
        // 배열에 a값 넣고, b값 넣고, 오름차순으로 정렬
        int j=0;
        for (int i=0; i<arr.length; i++) {
            if (i<n) {
                arr[i] = a[i];
            }
            else {
                arr[i] = b[j];
                j++;
            }
        }
        // 정렬
        Arrays.sort(arr);
        StringBuilder sb = new StringBuilder();
        for (int i=0; i<arr.length; i++) {
            if (sb.length() > 0) sb.append(" ");
            sb.append(arr[i]);
        }
        System.out.println(sb);
        sc.close();
    }
}
