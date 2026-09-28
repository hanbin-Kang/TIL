import java.util.Scanner;

// 사용자로부터 1~7 사이의 숫자를 입력받아 해당하는 요일이 평일인지 주말인지 출력한다.
// 1 ~ 5 → 평일
// 6 ~ 7 → 주말
// 그 외의 숫자 → 잘못된 입력
// switch문을 사용하여 입력받은 숫자에 따라 결과를 출력한다.

public class p01 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int day = sc.nextInt();
        switch (day) {
            case 1: case 2: case 3: case 4: case 5: 
                System.out.println("평일");
                break;
            case 6: case 7:
                System.out.println("주말");
                break;
            default :
                System.out.println("잘못된 입력");
                break;
        }
        sc.close();
    }
}