import java.util.Scanner;

public class p42 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = sc.nextInt();
        int lo = sc.nextInt(); // 시작값
        int hi = sc.nextInt(); // 끝값
        int count = 0;
        // 범위 안의 개수를 구하는 문제
        for (int i=0; i<arr.length; i++) {
            if (arr[i] >= lo && arr[i] <= hi) count++;
        }
        System.out.println("개수: " + count);
        sc.close();
    }
}
