import java.util.*;

public class basic{
    
    public static void main(String[] args) {
     int num    ;
        System.out.println("Enter a Number");
        Scanner sc = new Scanner(System.in);
        num = sc.nextInt();
        if(num<0){
            System.out.println("Num is Negative:");
        }
        else if(num>0){
            System.out.println("Number is positive");
        }
        else{
            System.out.println("Number is zero");
        }
    }
} 