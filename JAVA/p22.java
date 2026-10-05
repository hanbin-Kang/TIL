import java.util.Scanner;

// 입력받은 수의 부호 판단

public class p22 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)){
        int n = sc.nextInt();
        if (n > 0) {
            System.out.println("양수");
        } else if (n == 0) {
            System.out.println("영");
        } else {
            System.out.println("음수");
        }
        }
    }
}
