public class CalculatorTest {
    public static void main(String[] args) {
        System.out.println("Setup: Calculator object created");

        Calculator calculator = new Calculator();

        int a = 10;
        int b = 20;

        int result = calculator.add(a, b);

        if (result == 30) {
            System.out.println("Test Passed: " + a + " + " + b + " = " + result);
        } else {
            System.out.println("Test Failed");
        }

        calculator = null;
        System.out.println("Teardown: Calculator object removed");
    }
}