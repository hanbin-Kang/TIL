import java.util.Scanner;

public class p41 {
    // 소수인지 확인하는 메서드
    static boolean isPrime(int i) {
        boolean primeCheck = false;
        for (int k=2; k*k<=i; k++) {
            if (i%k==0) {
                primeCheck = true;
                break;
            }
        }
        return primeCheck;
    }

    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
        int n = sc.nextInt();
        int count = 0;
        // 합성수의 수를 출력
        for (int i=1; i<=n; i++) {
            // 소수인지 true, false로 표현
            // true 일때 count++; 
            if (isPrime(i) == true) count++;
        }
        System.out.println(count);
        }
    }
}