import java.util.*;

public class largest {
       public static void main(String[] args) {
        int a,b,c;
        System.out.print("Enter Number A");
        Scanner num1 = new Scanner(System.in);
        a = num1.nextInt();

          System.out.print("Enter Number B");
        Scanner num2 = new Scanner(System.in);
        b = num2.nextInt();

          System.out.print("Enter Number C");
        Scanner num3 = new Scanner(System.in);
        c = num3.nextInt();
        if(a>b){
            if(a>c){
                System.out.println("A is greater");
            }
            else{
                System.out.println("C is greater");
            }

        }
        else{
            System.out.println("B is Greater");
        }
       }
}
