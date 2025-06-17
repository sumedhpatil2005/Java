import java.util.*;

public class prime{
    public static void main(String[] args){
    //     int num;
    //     System.out.println("Enter a Number");
    //     Scanner sc = new Scanner(System.in);
    //     num = sc.nextInt();

    //     for(int i = 2; i <= num/2;i++){
    //         if(num % i == 0){
    //             System.out.println("Number is Not prime it is divisible by "+i);
    //             break;
    //         }
    //         else{
    //             System.out.println("Number is  a Prime Number");
    //             break;

    //         }
    //     }
        for(int i = 1;i<=100;i++){
                if(isprime(i)){
                    System.out.println("Number is Prime"+i);
                }
        }
     }

    private static boolean isprime(int  num) {
        boolean pri = false;
        for(int i =1;i<=num/2;i++){
            if(num%i!=0){
                    pri = true;
            }
            else{
                pri = false;
            }
            
        }
        return pri;
        
        
      }
} 