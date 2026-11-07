import java.util.Scanner;

public class p62 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int r = sc.nextInt();
        int c = sc.nextInt();
        int[][] g = new int[r][c];
        for (int i = 0; i < r; i++)
            for (int j = 0; j < c; j++) g[i][j] = sc.nextInt();
        // 짝수
        int even = 0;
        // 홀수
        int odd = 0;

        for (int row=0; row<r; row++) {
            for (int col=0; col<c; col++) {
                int num = row + col; 
                if (num%2==0) even += g[row][col];
                else odd += g[row][col];
            }
        }
        System.out.println("짝수 합: " + even);
        System.out.println("홀수 합: " + odd);
        sc.close();
    }
}
