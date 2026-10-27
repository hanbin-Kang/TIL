import java.util.Scanner;
import java.util.Arrays;

public class p44 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = sc.nextInt();
        // 배열을 복사하여 오름차순으로 정렬
        // arrSort = arr이라고 하면 기본자료형이 아니여서 참조값을 복사하여 변경하면 같이 변경됨
        int[] arrSort = new int[arr.length];
        for (int i=0; i<arr.length; i++) arrSort[i] = arr[i];
        Arrays.sort(arrSort);
       
        // 오름차순인지 확인 
        boolean isSame = true;
        for (int i=0; i<arr.length; i++) {
            if (arr[i] != arrSort[i]) {
                isSame = false;
                break;
            }
        }
        if (isSame) System.out.println("판정: 정렬됨");
        else System.out.println("판정: 정렬 안 됨");
        sc.close();
    }
}
