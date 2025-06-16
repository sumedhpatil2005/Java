import java.util.*;

public class Employee {
            static String name;
            static double salary;
          Employee(String name,double salary){
            this.name = name;
            this.salary = salary;
          }
          public static void getdetails(){
               System.out.println(name);
            System.out.println(salary);
          }

          public static void main(String[] args) {
            Employee obj = new Employee("sumedh",50000000);
            obj.getdetails();
          }
}