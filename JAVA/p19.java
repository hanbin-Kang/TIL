import java.util.Scanner;

// 자신을 제외한 약수중 가장 큰 값을 구하여라
// (int i = n - 1; n > 0; i--) -> (int i = n / 2; i >= 1; i--)
// n/2를 한 이유 : 1과 n, 그리고 2와 n/2 순인데 약수들이 자기 자신을 제외한 값중 가장 큰 약수를 구하는 것이니 n/2로 두는 것이 효율적이다    

public class p19 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
        int n = sc.nextInt();
        // 자기 자신을 제외한 약수중 가장 큰 수
        // 약수를 먼저 구해야함 
        for (int i = n - 1; n > 0; i--) { // 거꾸로 하여 큰 값부터 계산
            if (n % i == 0) {
                System.out.println("가장 큰 진약수: " + i);
                break; // 하나만 찾는 문제이니 찾고 바로 탈출
            }
        }
      }
    }
}
