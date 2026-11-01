import java.util.Scanner;

public class p56 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = sc.nextInt();
        // 원래 배열은 순서대로 유지, 0을 가장 마지막으로
        int[] newArr = new int[n];
        int base = 0;
        for (int i=0; i<n; i++) {
            if (arr[i] != 0) {
                newArr[base] = arr[i];
                base++;
            }
        }
        // 출력
        StringBuilder sb = new StringBuilder();
        for (int i=0; i<n; i++) {
            if (sb.length() > 0) sb.append(" ");
            sb.append(newArr[i]);
        }
        System.out.println(sb);
        sc.close();
    }
}
