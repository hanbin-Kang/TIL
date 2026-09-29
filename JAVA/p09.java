import java.util.Scanner;

// 최솟값과 최댓값을 동시에 구하는 문제 

public class p09 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        // 최솟값과 최댓값을 동시에 구하는 문제
        int max = Integer.MIN_VALUE; // int에서 올수있는 가장 작은 값을 최댓값으로 설정
        int min = Integer.MAX_VALUE; // int에서 올수있는 가장 큰 값을 최솟값으로 설정
        // 반복문
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
        System.out.println("최댓값: " + max);
        System.out.println("최솟값: " + min);
        sc.close();
    }
}
