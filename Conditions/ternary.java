import java.util.*;

class ternary{
    public static void main(String[] args) {
        int a;
        int b;
        System.out.println("Enter the value of A:");
        Scanner sc = new Scanner(System.in);
        a= sc.nextInt();

        System.out.println("Enter the value of B:");
        Scanner sb = new Scanner(System.in);
        b= sb.nextInt();

        int min = (a<b)? a :b;
        System.out.println("The Smallest Number is : "+min);
    }
}