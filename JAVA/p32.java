import java.util.Scanner;

// 클래스
class isOdd {
    static long odd(long n) {
        // 홀수일 때 : N = 3*N + 1
        n = 3 * n + 1;
        return n;
    }

    static long even(long n) {
        // 짝수일 때 : N /= 2
        n /= 2;
        return n;
    }
}

public class p32 {
    public static void main(String[] args) {
        try(Scanner sc = new Scanner(System.in)) {
        long n = sc.nextLong();

        // 결과값이 1이 될때까지 반복하고 1이 될때까지의 횟수 출력
        int count = 0;
        while (true) {
            // 정지조건
            if (n==1) break;
            // 예외조건
            else count++;

            // n이 홀수일 떄
            if (n%2!=0) n = isOdd.odd(n);
            // n이 짝수일 때
            else n = isOdd.even(n);
            }
        System.out.println(count);
        }
    }
}
