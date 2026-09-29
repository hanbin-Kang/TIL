import java.util.Scanner;

// 첫째 줄에 정수 n을 입력받는다.
// 둘째 줄부터 n개의 정수가 주어진다.
// 입력받은 n개의 정수 중 가장 큰 값을 찾아 출력하시오.

public class p08 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        // Integer.MIN_VALUE : int가 가질 수 있는 최솟값 <-> Integer.MAX_VALUE : 최댓값
        int max = sc.nextInt(); // 처음에 오는 수가 최댓값
        for (int i = 1; i <= n - 1; i++) {
            int num = sc.nextInt();
            if (max < num) {
                max = num;
            }
        }
        System.out.println("최댓값: " + max);
        sc.close();
    }
}
