import java.util.Scanner;

public class p25 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
        int n = sc.nextInt();
        // posSum, negAbsSum 누적
        int posSum = 0;
        int negAbsSum = 0;

        for (int i=0; i<n; i++) {
            int num = sc.nextInt();
            if (num > 0) {
                posSum += num;
            } else if (num < 0) {
                negAbsSum += Math.abs(num);
            }
        }
        System.out.println("양수 합: " + posSum);
        System.out.println("음수의 절댓값 합: " + negAbsSum);
        }
    }
}
