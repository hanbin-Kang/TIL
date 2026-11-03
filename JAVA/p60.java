import java.util.Scanner;

public class p60 {
    // 자릿수의 합을 구하는 메서드
    static int numSum(int n) {
        int sum = 0;
        while (true) {
            sum += n%10;
            if (n/10==0) break;
            else n/=10;
        }
        return sum;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        // 자릿수의 합으로 N이 나눠 떨어지면 하샤드 
        if (n % numSum(n) == 0) System.out.println("하샤드");
        else System.out.println("하샤드 아님");
        sc.close();
    }
}