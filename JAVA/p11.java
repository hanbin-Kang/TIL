import java.util.Scanner;

// try (Scanner sc = new Scanner(System.in))을 사용하면 매번 sc.close(); 할 번거로움이 없어진다

public class p11 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        // 가장 큰 값은 best라는 변수로 저장, 두번째로 큰 값은 second로 저장
        // 모든 숫자가 -일때를 방지하여 0으로 두면 안됨
        int best = Integer.MIN_VALUE; 
        int second = Integer.MIN_VALUE;
        // best보다 클 때 -> best를 그 값으로 바꾸고 갖고 있는 값을 second로 변경
        // best보다는 작고 second보다는 클 때 -> 그 값을 second로 저장
        for (int i=1; i<=n; i++) {
            int num = sc.nextInt();
            if (num > best) {
                second = best;
                best = num;
            } else if (num > second) { // else if 로 두어서 best보다 작으면 이쪽으로 와서 num > second만 적어두어도 충분
                second = num;
            }
        }   
        sc.close();
        System.out.println("두 번째로 큰 값: " + second);
    }
}
 
