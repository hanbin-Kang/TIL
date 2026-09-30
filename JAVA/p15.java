import java.util.Scanner;

public class p15 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)){
        int n = sc.nextInt();
        int num1 = sc.nextInt(); // 밖에서 미리 num1을 구함
        int num2 = sc.nextInt(); // 밖에서 미리 num2를 구함
        int maxValue = num1 * num2; // 최대곱을 미리 구해놓고 비교
        // 연속하는 두 수의 곱을 구하고 그 중에서 최대값을 구하여라
        for (int i=1; i <= n - 2; i++) { 
            num1 = num2;
            num2 = sc.nextInt();
            if (maxValue < num1 * num2) {  
                maxValue = num1 * num2;
            }
          }
        System.out.println("연속 두 값의 최대 곱: " + maxValue);
        }
    }
}

// ==============================================================================================================================

// 최댓값을 가장 작은 값으로 설정한 후 
// maxValue = Math.max(maxValue, prevNum * curNum); 
// Math.max()를 사용하여 가장 작은 값 vs 이전 값과 현재값의 곱을 계산
// 더 큰값을 maxValue에 저장
// 두 코드 모두 논리적으로는 같지만 밑에 코드가 효율성과 편리성이 높다


// public class p15 {
//     public static void main(String[] args) {
//         // 연속하는 두 수의 곱을 구하고 그 중에서 최대값을 구하여라
//         try (Scanner sc = new Scanner(System.in)) {
//             int n = sc.nextInt();
//             int prevNum = sc.nextInt(); // 이전 값을 저장 (prev 패턴)
//             int maxValue = Integer.MIN_VALUE; // 초기값을 첫 곱으로 설정

//             for (int i = 1; i < n; i++) {
//                 int curNum = sc.nextInt(); // 현재 값 입력
//                 maxValue = Math.max(maxValue, prevNum * curNum); // Math.max로 간결하게 갱신
//                 prevNum = curNum; // 현재 값을 이전 값으로 이동
//             }

//             System.out.println("연속 두 값의 최대 곱: " + maxValue);
//         }
//     }
// }