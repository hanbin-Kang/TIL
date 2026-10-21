import java.util.Scanner;

class primeCounter {
    static void primeCount(int n) {
        int count = 0;
        // 2 ~ n까지의 수들중
        for (int i=2; i<=n; i++) {
            // 소수를 구하여라
            boolean prime = true;
            for (int j=2; j*j<=i; j++) {
                if (i%j==0) prime = false;
            }
            if (prime) count++;
        }
        System.out.println("개수: " + count);
    }
}

public class p35 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        
        // 2 ~ n까지의 숫자들 중에서 소수의 개수를 구하여라
        // 소수 판정 : 메서드
        primeCounter.primeCount(n);
        sc.close();
    }
}
