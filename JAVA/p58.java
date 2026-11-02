import java.util.Scanner;

public class p58 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int r = sc.nextInt();
        int c = sc.nextInt();
        int[][] g = new int[r][c];
        for (int i = 0; i < r; i++)
            for (int j = 0; j < c; j++) g[i][j] = sc.nextInt();
        // 배열들의 전체 합 구하기
        int sum = 0;
        for (int row = 0; row < r; row++) {
            for (int col = 0; col < c; col++) {
                sum += g[row][col];
            }
        }
        System.out.println("합: " + sum);
        sc.close();
    }
}
