import java.util.Scanner;

public class p50 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = sc.nextInt();
        // 인접한 두 수의 최대 절댓값을 구하여라
        // 절댓값을 구하는거니 무조건 0이상
        int maxValue = 0; 
        for (int i=0; i<arr.length; i++) { 
            // 0부터 시작하면 if문으로 조건을 하나 더 달아야하는데
            // 1로 시작하면 조건문이 하나 더 필요 없음
            // EX)  
            // (int i = 1; i < arr.length; i++) 
            // Math.abs(arr[i] - arr[i - 1])
            if (i+1 < arr.length) {
                if (maxValue < Math.abs(arr[i] - arr[i+1])) {
                    maxValue = Math.abs(arr[i] - arr[i+1]);
                }
            }
        }
        System.out.println("최대 차이: " + maxValue);
        sc.close();
    }
}
