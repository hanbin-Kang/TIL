import java.util.Scanner;

// 홀수의 합을 구하는 문제
public class p21 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)){
        int n = sc.nextInt();
        // 홀수의 곱을 구하는 문제
        long total = 1;
        for (long i=1; i<=n; i += 2) {
            total *= i;
        }
    System.out.println("홀수 곱: " + total);
    }  
}
}