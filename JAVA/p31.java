import java.util.Scanner;

// 완전수인지 확인하는 클래스
class WeirdNum {
    static int isWeirdN(int n) {
        // n보다 큰 수들을 구하는 반복문
        for (int i=n+1; ; i++) {
            int sum = 0;
            // 소수들의 합을 구하는 반복문
            for (int j=1; j<i; j++) {
                if (i%j==0) sum+=j;
            }
            // sum==i일때 반환
            if (sum==i) return sum;
        }
    }
}

public class p31 {
    public static void main(String[] args) {
        try(Scanner sc = new Scanner(System.in)) {
        int n = sc.nextInt();
        // n을 초과하는 완전수 찾기 
        // 완전수 : 자기 자신을 제외한 약수들의 합이 자기 자신과 같은 수
        // 클래스에서 static 메서드를 사용하여서 객체화를 하지 않아도 됨
        System.out.println(WeirdNum.isWeirdN(n));
        }
    }
}
