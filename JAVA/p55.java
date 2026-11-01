import java.util.Scanner;

public class p55 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = sc.nextInt();
        // 중첩 반복문을 사용하여 역전 갯수 구하기
        int count = 0;
        for (int i=0; i<arr.length; i++) {
            for (int j=i+1; j<arr.length; j++) {
                if (arr[i] > arr[j]) count++;
            }
        }
        System.out.println("역전: " + count);
        sc.close();
    }
}
