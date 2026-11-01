import java.util.Arrays;
import java.util.Scanner;

public class p54 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
        int n = sc.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = sc.nextInt();
        // 오름차순으로 한 뒤, 절댓값 차이의 최소값 구하기
        Arrays.sort(arr);
        int absNum = Integer.MAX_VALUE;
        for (int i=1; i<arr.length; i++) {
            if (absNum > Math.abs(arr[i] - arr[i-1])) absNum = Math.abs(arr[i] - arr[i-1]);
        }
        System.out.println("최소 차이: " + absNum);
        }
    }
}
