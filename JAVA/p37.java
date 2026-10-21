import java.util.Scanner;

class primeCounter_N {
    static void primeCount(int n) {
        int count = 0;
        // 2 ~ n까지의 수들중
        for (int i=2; ; i++) {
            // 소수를 구하여라
            boolean prime = true;
            for (int j=2; j*j<=i; j++) {
                if (i%j==0) {
                    prime = false;
                    break;
                }
            }
            if (prime) count++;

            if (count==n) {
                System.out.println(i);
                break;
            }
        } 
    }
}

public class p37 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        // n번쨰로 나오는 소수를 구하여라
        primeCounter_N.primeCount(n);
        sc.close();
    }
}
