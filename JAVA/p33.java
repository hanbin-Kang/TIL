import java.util.Scanner;

// N을 초과하는 첫 2가지 소수를 찾는 클래스
class primeOver {
    // 메서드
    static StringBuilder primeTwo(int n) {
        StringBuilder sb = new StringBuilder();
        int count = 0; // count 위치
        for (int i=n+1; ; i++) {
            boolean isprime = true;

            // 소수 판정
            for (int j=2; j<i; j++) {
                if (i%j==0) {
                    isprime = false;
                    break;
                }
            }
            if (isprime==true) {
                if (sb.length() > 0) sb.append(" ");

                sb.append(i);
                count++;

                if (count == 2) break;   
            }
        }       
        return sb; // return 위치
    }
        
}

public class p33 {
    public static void main(String[] args) {
        try(Scanner sc = new Scanner(System.in)) {
        int n = sc.nextInt();
        System.out.println(primeOver.primeTwo(n));
        }
    }
}
