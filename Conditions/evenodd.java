import java.util.*;

public class evenodd {
    public static void main(String[] args) {
        int num;
        System.out.print("Enter a Num : ");
        Scanner sc = new Scanner(System.in);
        num = sc.nextInt();

        if(num%2==0){
            System.out.println("Number is Even");

        }
        else{
            System.out.println("Number is odd");
        }
    }
}