import java.util.Scanner;

// 최댓값 최솟값을 구하는 코드에서 if-else if가 아닌 if-if를 사용한 이유 :
// 1, 3, 5처럼 순차적으로 커지는 코드에서는 먼저있는 최댓값 구하는 코드에서 다 true가 나와 최솟값을 구하는 코드에는 접근하지 못한다
// 따라서 if-if 사용해야한다

public class p14 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
        int n = sc.nextInt();
        // 최댓값과 최솟값을 구한 후 그 둘의 차이를 구하기
        int max = Integer.MIN_VALUE;
        int min = Integer.MAX_VALUE;
        // 반복문 실행
        for (int i=0; i<n; i++) {
            int num = sc.nextInt();
            // 최댓값
            if (num > max) {
                max = num;
            } 
            // 최솟값
            if (num < min) {
                min = num;
            }
        }
        int result = max - min;
        System.out.println("차이: " + result);
      }
    }
}
