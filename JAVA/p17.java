import java.util.Scanner;

// for문 안에 넣은 값을 수정하면 더욱 깔끔하다
// for (int multiple = k; multiple <= n; multiple += k) 시작값을 k, 끝값을 n으로 두면 가독성, 효울성이 올라간다

public class p17 {
    public static void main(String[] args) {
        try(Scanner sc = new Scanner(System.in)){
        int n = sc.nextInt();
        int k = sc.nextInt();
        // StringBuilder 사용
        StringBuilder sb = new StringBuilder();
        // n까지 수들 중에서 k의 배수를 구하여라
        for (int i=1; i<=n; i++) { 
            if (i * k <= n) { // i * k가 n이하일 때는 sb에 append
                if (sb.length() > 0) sb.append(" ");
                sb.append(i*k);
          } else break; // 범위를 넘어가면 즉시 종료
        }
        System.out.println(sb);
      }  
    }
  }
