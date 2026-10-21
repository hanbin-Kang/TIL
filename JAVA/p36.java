import java.util.Scanner;

class primelist {
    static void primeCount(int n) {
        StringBuilder sb = new StringBuilder();
        // 2 ~ n까지의 수들중
        for (int i=2; i<=n; i++) {
            // 소수를 구하여라
            boolean prime = true;
            for (int j=2; j*j<=i; j++) {
                if (i%j==0) prime = false;
            }
            if (prime) {
                if (sb.length() > 0) sb.append(" ");
                sb.append(i); 
            }
        }
        System.out.println(sb);
    }
}

public class p36 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        // 2 ~ n까지의 범위중 소수를 나열하여라
        // 메서드 사용
        primelist.primeCount(n);
        sc.close();
    }
}
