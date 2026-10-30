import java.util.Arrays;
import java.util.Scanner;

public class p48 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = sc.nextInt();
        // 가장 큰 값과 두번째로 큰 값을 가지는 변수 두가지를 사용
        Arrays.sort(arr);
        int bestNum = arr[arr.length-1];
        int secondNum = Integer.MIN_VALUE;
        for (int i=arr.length-1; i>=0; i--) {
            if (secondNum < arr[i] && arr[i] < bestNum) secondNum = arr[i];
        }
        if (secondNum != Integer.MIN_VALUE) System.out.println("두 번째: " + secondNum);
        else System.out.println("두 번째: 없음");
        sc.close();
    }
}
