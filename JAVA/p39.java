import java.util.Scanner;

class TwinPrime {
    // 범위 내의 소수를 구하는 메서드
    static StringBuilder Prime(int n) {
        StringBuilder sb = new StringBuilder();
        for (int i=2; i<=n; i++) {
            boolean isPrime = true;
            for (int j=2; j*j<=i; j++) {
                if (i%j==0) {
                    isPrime = false;
                    break;
                }
            }
            if (isPrime) {
                if (sb.length() > 0) sb.append(" ");
                sb.append(i);
            }
        }
        return sb;
    }

    // String인 sb를 int, 배열로 변경 후 2차이 나는 값 출력
    static int result(StringBuilder sb) {
        String[] StrPrimeArr = sb.toString().split(" ");
        int[] IntPrimeArr = new int[StrPrimeArr.length];

        // IntPrimeArr 배열의 값을 int 타입으로 채워넣음
        for (int i=0; i<StrPrimeArr.length; i++) {
            IntPrimeArr[i] = Integer.parseInt(StrPrimeArr[i]);
        }
        int count = 0;
        // 쌍둥이 소수 구하기
        for (int a=0; a<IntPrimeArr.length-1; a++) {
            int start = IntPrimeArr[a];
            // start - now = -2인 경우 +1
            int b=a+1;
            int end = IntPrimeArr[b];
            // 조건문을 사용하여 계산
            if (end-start == 2) count++;
        }
        return count;
    }
}


public class p39 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        // 쌍둥이 소수 : 차이가 2인 두 소수
        // 소수들을 먼저 구한 후 그 값이 2차이 나는 소수들 출력

        System.out.println(TwinPrime.result(TwinPrime.Prime(n)));
        sc.close();
    }
}
