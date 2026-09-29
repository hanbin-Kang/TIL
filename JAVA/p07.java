import java.util.Scanner;

// sc.nextInt() → 입력값 하나를 꺼내서 사용하고, 변수에 저장하지 않았다면 다시 사용할 수 없다 -> 변수에 저장하지 않으면 일회용이다

public class p07 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int sum = 0;
        // Scanner의 원리로 푸는 문제 : 입력한 값중 스페이스바나 엔터가 있으면 분리
        for (int i=0; i<n; i++) {
            int num = sc.nextInt();
            // 양수일 때
            if (num > 0) {
                sum += num;
            }
        }
        System.out.println("양수 합: " + sum);
        sc.close();
    }
}

// p06번은 sc.nextInt()를 한 번만 사용하므로 변수에 저장하지 않고 바로 sum에 더해도 된다.
// 하지만 이 문제는 입력값을 if문에서 한 번 확인한 후 다시 사용해야 하므로,
// sc.nextInt()로 읽은 값을 변수에 저장해서 사용해야 한다.

// if (sc.nextInt() > 0) {
//     sum += sc.nextInt();
// }  
// 10을 if문으로 확인하고 sum에 더한다 : x
// 10을 if문으로 확인하고 그 다음 수인 -3을 sum에 더한다 : Scanner가 읽은 값을 기억해서 다시 주는 게 아니라, 입력을 순서대로 하나씩 소비하기 때문