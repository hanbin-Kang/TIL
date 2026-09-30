import java.util.Scanner;
// try를 사용하여 sc.close() 사용 x
public class p13 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
            int n = sc.nextInt();
            int best = sc.nextInt();
            int idx = 1;
            for (int i=1; i<n; i++) {
                int num = sc.nextInt();
                if (best < num) {
                    best = num;
                    idx = i + 1; // 최대값의 위치를 찾기 위해 i를 사용
                }
            }
        System.out.println("최댓값의 위치: " + idx);
        }
    }
}
