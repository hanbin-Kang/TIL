import java.util.Scanner;

// 짝수일 때와 홀수일 때 앞에 붙이는 부호를 다르게 하여 출력

public class p27 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
        int n = sc.nextInt();
        StringBuilder sb = new StringBuilder();
        // 1 ~ n까지 반복
        for (int i=1; i<=n; i++) {
            // 홀수일 때 : +
            if (i % 2 != 0) {
                sb.append("+");
                sb.append(i);
                sb.append(" ");
            }
            // 짝수일 때 : -
            else {
                sb.append("-");
                sb.append(i);
                sb.append(" ");            
            }
        }
        System.out.println(sb);
        }
    }
}
