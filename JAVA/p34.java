import java.util.Scanner;

class isPrime {
    static boolean PrimeMethod(int n) {
        boolean prime = true;
        for (int j=2; j*j<=n; j++) {
            if (n % j == 0) { 
                prime = false;
                break;
            }
        }
        return prime;
    }
}

public class p34 {
    public static void main(String[] args) {
        try(Scanner sc = new Scanner(System.in)) {
        int n = sc.nextInt();
        if (isPrime.PrimeMethod(n) == true) System.out.println("소수");
        else System.out.println("소수 아님"); 
        }
    }
}
