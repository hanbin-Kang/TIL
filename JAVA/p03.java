import java.util.Scanner;

// 사용자로부터 정수 n을 입력받아 0부터 n까지의 정수를 순서대로 계산한다.
// 홀수 → 더한다.
// 짝수 → 뺀다.
// 계산이 끝난 후 최종 결과를 출력한다.
// 예를 들어 n = 5라면:
// 0 - 1 + 2 - 3 + 4 - 5
// 가 아니라 코드의 조건에 따라:
// 0 - 2 + 1 - 4 + 3 - 5
// 와 같은 개별 항의 부호를 적용해 계산하며, 최종 결과를 출력한다.
// for문과 if문, 나머지 연산자 %를 사용하여 홀수와 짝수를 구분한다.

public class p03 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.close(); // 누수 방지
        int total = 0;
        for (int i = 0; i <= n; i ++) {
            if (i % 2 == 0) {
                total -= i;
            } else {
                total += i;
            }
        }
        System.out.println("결과: " + total);
    }
}