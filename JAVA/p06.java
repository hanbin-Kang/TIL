import java.util.Scanner;

// 여러 정수의 합계 구하기
// 첫 번째로 정수 n을 입력받는다.
// 이후 n개의 정수를 입력받아 모두 더한 후 합계를 출력한다.

public class p06 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();

        int sum = 0;
        for (int i=1; i<=n; i++) {
            sum += sc.nextInt();
        } 
        System.out.println("합계: " + sum);
        sc.close();
    }
}
// 원리 : Scanner의 특징 : 공백과 줄바꿈 구분 -> 입력한 값중에 공백이나 줄바꿈을 기준으로 숫자를 하나씩 잘라서 읽음
// 공백의 개수와 n이 같으니깐 반복문을 통해 계산