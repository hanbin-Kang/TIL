import java.util.Scanner;

// int best = sc.nextInt(); << best라는 변수에 입력값을 넣음
// Math.abs() < Math라는 클래스에 들어있는 abs라는 절댓값을 구하는 메서드
// best값은 더 큰값이 올 때만 변경되기 때문에 1, -1이 와도 1이 best값이다 

public class p10 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int best = sc.nextInt();
        for (int i = 1; i <= n - 1; i++) {
            int num = sc.nextInt();
            // 절댓값 비교
            if (Math.abs(num) > Math.abs(best)) {
                best = num;
            }
        }
        System.out.println("절댓값 최대의 값: " + best);
        sc.close();
    }
}
