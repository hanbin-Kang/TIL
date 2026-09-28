import java.util.Scanner;

// 사용자로부터 월(1~12)을 입력받아 해당 월의 마지막 날짜를 출력한다.
// 1, 3, 5, 7, 8, 10, 12 → 31일
// 4, 6, 9, 11 → 30일
// 2 → 28일
// 1~12 이외의 숫자 → 잘못된 월
// switch 표현식을 사용하여 월에 따른 마지막 날짜를 String 변수에 저장한 후 출력한다.

public class p02 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int month = sc.nextInt();

        String date = switch (month) {
            case 1, 3, 5, 7, 8, 10, 12 -> "31일";
            case 4, 6, 9, 11 -> "30일";
            case 2 -> "28일";
            default -> "잘못된 월";
        };
        sc.close();
        System.out.println(date);
    }
}
