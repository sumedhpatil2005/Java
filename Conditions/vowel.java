import java.util.*;

public class vowel{
    public static void main(String[] args) {
           
            System.out.println("Enter the character:");
            Scanner sc = new Scanner(System.in);
            char c = sc.next().charAt(0);
            if(c == 'a' || c=='e' || c=='i' || c=='o' || c=='u' ){
                    System.out.println("The Character is Vowel");
            }
            else{
                System.out.println("The Character is not vowel");
            }
        }
}