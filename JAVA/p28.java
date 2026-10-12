import java.util.Scanner;

// 숫자 사이에 ,를 붙이고 마지막에 .을 붙이는 문제

public class p28 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
        int n = sc.nextInt();
        // StringBuilder을 사용
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= n; i++) {
            // 길이가 0보다 클때
            if (sb.length() > 0) sb.append(", ");
            sb.append(i);
        }
    // 마지막에 . 추가
    sb.append(".");
    System.out.println(sb);    
    }
  }
}