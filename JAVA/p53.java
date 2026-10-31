import java.util.Scanner;

public class p53 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = sc.nextInt();
        // 인접한 두 배열의 차이를 저장하여 출력
        StringBuilder sb = new StringBuilder();
        for (int i=1; i<arr.length; i++) {
            if (sb.length() > 0) sb.append(" ");
            sb.append(arr[i] - arr[i-1]);
        }
        System.out.println(sb);
        sc.close();
    }
}
