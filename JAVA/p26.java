import java.util.Scanner;

// a ~ b까지의 숫자들 출력하기

public class p26 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
        int a = sc.nextInt();
        int b = sc.nextInt();
        StringBuilder sb = new StringBuilder();
        for (int i=a; i<=b; i++) {
            if (sb.length() > 0) sb.append(" ");
            sb.append(i);
        }
        System.out.println(sb);
    }
    }
}
