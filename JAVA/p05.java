import java.util.Scanner;

// 정수 n을 입력받아 1부터 n까지의 정수 중 n의 약수가 몇 개인지 구하는 프로그램을 작성한다.

public class p05 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.close();
        // for문 사용하여 n의 약수 개수를 구하는 문제
        int count = 0;
        for (int i=1; i<=n; i++) {
            // 나눴을때 나머지가 0이면
            if (n % i == 0) {
                count ++;
            }
        } System.out.println("약수 개수: " + count);
    }
}
