import java.util.Scanner;

class PrimeFactorization {
    // 범위 내의 소수를 구하는 메서드
    static StringBuilder primeCount(int n) {
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
        return sb;
    }

    // 소수들을 이용하여 n을 소인수분해 하는 메서드
    static void primeF(StringBuilder sb, int n) {
        StringBuilder result = new StringBuilder();
        // sb의 개수를 세는 방법 : split(" ")을 활용하여 " " 개수를 구하는 방식 사용
        // sb.toString().split(" ").length
        
        // sb.toString().split(" ") : StringBuilder의 문자열을 공백 기준으로 분리하여 String 배열에 저장한다.
        String[] primeArr = sb.toString().split(" "); 
        
        // 소인수분해 하기
        for (int i=0; i<primeArr.length; i++) {
            // String타입인 값을 int값으로 변경하기
            int prime = Integer.parseInt(primeArr[i]);
            // 소인수분해
            while (n % prime == 0) {
                if (result.length() > 0) result.append(" ");
                result.append(prime);

                n /= prime;
            }
            // 정지조건
            if (n == 1) break;
        }
        System.out.println(result);
    }
}

public class p38 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        // 소인수분해 : 소수들로만 나눈 값
        // 메서드의 return값을 매개변수로 사용
        PrimeFactorization.primeF(PrimeFactorization.primeCount(n), n);
        sc.close();
    }
}
