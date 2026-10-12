import java.util.Scanner;

// b ~ a까지의 값 구하기 

public class p29 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
        int a = sc.nextInt();
        int b = sc.nextInt();
        StringBuilder sb = new StringBuilder();
        for (int i=b; i>=a; i--) {
            if (sb.length() > 0) sb.append(" ");
            sb.append(i);
        }
        System.out.println(sb);
        }
    }
}