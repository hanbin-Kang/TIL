import java.util.Scanner;

// 홀수 번째 입력은 더하고, 짝수 번째 입력은 빼서 결과 출력

public class p23 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
            int n = sc.nextInt();
            int total = 0;

            for (int i = 1; i <= n; i++) {
                int num = sc.nextInt();
                if (i % 2 == 1) { // 홀수 번째: 더하기
                    total += num;
                } else {          // 짝수 번째: 빼기
                    total -= num;
                }
            }

            System.out.println("결과: " + total);
        }
    }
}