import java.util.Arrays;
import java.util.Scanner;

public class p43 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = sc.nextInt();
        // 배열을 오름차순으로 정렬
        Arrays.sort(arr);
        boolean dup = false;
        for (int i=0; i<arr.length; i++) {
            if (i+1 < arr.length) {
                if (arr[i] == arr[i+1]) {
                    dup = true;
                    break;
                }
            }
            
        }
        if (dup) System.out.println("중복: 있음");
        else System.out.println("중복: 없음");
        sc.close();
    }
}
