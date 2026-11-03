import java.util.Scanner;

public class p59 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int r = sc.nextInt();
        int c = sc.nextInt();
        int[][] g = new int[r][c];
        for (int i = 0; i < r; i++)
            for (int j = 0; j < c; j++) g[i][j] = sc.nextInt();
        // 각 행별 합을 구하는 문제
        StringBuilder sb = new StringBuilder();
        for (int row = 0; row < r; row++) {
            int sum =0;
            for (int col = 0; col < c; col++) {
                sum += g[row][col];
            }
            if (sb.length() > 0) sb.append(" ");
            sb.append(sum);
        }
        System.out.println("합: " + sb);
        sc.close();
    }
}
