import java.util.Scanner;

public class p16 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)){
        int n = sc.nextInt();
        // python의 join과 비슷한 역할을 하는 StringBuilder
        StringBuilder sb = new StringBuilder();
        // 입력 받은 수의 약수들을 출력
        for (int i = 1; i <= n; i++) {
            // 입력받은 수의 약수이려면 나눴을 때 0이 나와야함
            if (n % i == 0) {
                //sb.append(i).append(" "); // 이렇게 하면 마지막에도 " "이 들어간다
                if (sb.length() > 0) sb.append(" "); 
                sb.append(i);
            }
        }
      System.out.println(sb);
    }
  }
}
