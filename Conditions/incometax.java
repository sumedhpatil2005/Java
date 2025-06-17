import java.util.*;
public class incometax {
    public static void main(String[] args) {
         
        float TotalTax;
         float income;
         System.out.println("Enter Your Income :");
         Scanner sc = new Scanner(System.in);
         income = sc.nextFloat();

         if(income <=100000){
            System.out.println("No Income-Tax");
         }
         else if(income<=200000 && income >100000){
              TotalTax  =  income *10/100;
              System.out.println("Your income lies in 10% income bracket your Tax is "+TotalTax);
            }
            else if(income >200000 ){
                TotalTax = income - 100000 *20/100 + 10000;
                System.out.println("Your income lies in 20% income bracket your Tax is "+TotalTax);
            }
    }   
}
