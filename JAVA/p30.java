import java.util.Scanner;

// 범위 내의 공비수열의 총 합

public class p30 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
        int a = sc.nextInt(); // 첫 항
        int r = sc.nextInt(); // 공비
        int n = sc.nextInt(); // 항의 수
        long result = a; // 결과값
        StringBuilder sb = new StringBuilder();
        for (int i=1; i<=n; i++) {
            if (sb.length() > 0) sb.append(" "); // 처음을 제외한 다음은 띄어쓰기
            sb.append(result); // 값 넣기
            result *= r; // result값 변경
        }
        System.out.println(sb); // 출력
        }
    }
}
