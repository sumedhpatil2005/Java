import java.util.*;

public class Car {
    
        
         static String model = "X5";
        static int year = 2025;
        static String make = "BMW";

        public static void details(){
                    System.out.println(model);
                    System.out.println(year);
                    System.out.println(make);

        }

        public static void main(String[] args){
            Car obj1 = new Car();
            obj1.details();
            
        }
}