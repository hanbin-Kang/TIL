import java.util.Scanner;

// 첫 번째 줄에 정수 n을 입력받는다.
// 두 번째 줄에 정수 k를 입력받는다.
// 정수 n과 k를 입력받아 1부터 n까지의 정수 중 k의 배수가 몇 개인지 구하는 프로그램을 작성한다.

public class p04 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int k = sc.nextInt();
        sc.close();
        int count = 0;
        for (int i=1; i<=n; i++) {
            if (i % k == 0) {
                count += 1;
            } 
        } System.out.println(k + "의 배수 개수: " + count);
    }
}
