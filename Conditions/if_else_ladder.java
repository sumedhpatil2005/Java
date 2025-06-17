import java.util.*;
public class if_else_ladder {
    public static void main(String[] args) {
        int marks;
        System.out.print("Enter marks of the student :");

        Scanner sc = new Scanner(System.in);
        marks = sc.nextInt();

        if(marks>95 && marks <100){
            System.out.println("A+ Grade");
        }
        else if(marks>90){
            System.out.println("A Grade");
        }
        else if(marks>80){
            System.out.println("B+ Grade");

        }
        else if(marks>70){
            System.out.println("B Grade");
        }
        else if(marks>60){
            System.out.println("C grade");
        }
        else if(marks >0 && marks < 60){
            System.out.println("Room for improvement");
        }
        else{
            System.out.println("Enter Valid Marks!");
        }
    }   
}
