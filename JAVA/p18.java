import java.util.Scanner;

public class p18 {

    public static void main(String[] args) {

        try (Scanner sc = new Scanner(System.in)) {

            int n = sc.nextInt();
            // 소수 vs 소수 아님을 구분하는 문제
            // 소수: 1과 자기 자신을 제외하고 나누어 떨어지는 수가 없는 값
            boolean flag = true; // 처음에는 소수라고 가정

            for (int i = 2; i < n; i++) {
                // 나누어 떨어지면 소수가 아님
                if (n % i == 0) {
                    flag = false;
                    break; // 소수가 아닌걸로 판정 나면 바로 탈출 
                }
            }
            // 결과 출력
            if (flag == true) {
                System.out.println("소수");
            } else {
                System.out.println("소수 아님");
            }
        }
    }
}
