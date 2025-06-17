import java.util.*;

class leaptyear{
    public static void main(String[] args) {
        int Year;
        System.out.println("Enter the Year To Check For Leap year :");
        Scanner sc = new Scanner(System.in);
        Year = sc.nextInt();
        if(Year%4==0&& Year % 100!=0 || Year % 400 != 0){
                System.out.println("The Year is Leap Year!!");
        }
        else{
            System.out.println("The Year is not Leap Year!!");
        }
    }
}