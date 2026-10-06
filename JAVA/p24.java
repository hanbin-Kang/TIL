import java.util.Scanner;

// 짝수와 홀수의 합중 더 높은것 구하는 문제

public class p24 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
            int n = sc.nextInt();
            long evenSum = 0; // 큰 입력 대비 long 사용
            long oddSum = 0;

            for (int i = 0; i < n; i++) {
                int num = sc.nextInt();
                if (num % 2 == 0) {
                    evenSum += num;
                } else {
                    oddSum += num;
                }
            }

            // 세 가지 경우를 명확하게 분기
            if (evenSum > oddSum) {
                System.out.println("짝수 합이 큼");
            } else if (oddSum > evenSum) {
                System.out.println("홀수 합이 큼");
            } else {
                System.out.println("같음");
            }
        }
    }
}