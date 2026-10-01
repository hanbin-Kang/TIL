import java.util.Scanner;

public class p20 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
            int n = sc.nextInt();

            // 홀수의 곱을 구하는 문제
            // 초기화: 1로 시작
            long oddProduct = 1; // 변수명을 더 구체적으로 수정

            // 1부터 n까지 홀수만 순회 (i += 2로 홀수만 선택)
            for (long i = 1; i <= n; i += 2) {
                oddProduct *= i;
            }

            // 결과 출력
            System.out.println("홀수 곱: " + oddProduct);
        }
    }
}