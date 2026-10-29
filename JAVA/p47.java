import java.util.Scanner;

public class p47 {
    // s.charAt(i)는 문자열 s에서 i번째 문자를 가져오고, - '0'은 그 숫자 문자를 실제 정수로 변환
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String s = sc.next();
        int sum= 0;
        for (int i=0; i<s.length(); i++) {  
            sum += (s.charAt(i) - '0');
        }
        System.out.println(sum);
        sc.close();
    }
}
