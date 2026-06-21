import java.util.Arrays;
import java.util.Comparator;

class Product {
    int productId;
    String productName;
    String category;

    Product(int productId, String productName, String category) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
    }

    @Override
    public String toString() {
        return "ID: " + productId +
               ", Name: " + productName +
               ", Category: " + category;
    }
}

public class EcommerceSearch {

    public static Product linearSearch(Product[] products, String targetName) {
        for (Product product : products) {
            if (product.productName.equalsIgnoreCase(targetName)) {
                return product;
            }
        }
        return null;
    }

    public static Product binarySearch(Product[] products, String targetName) {
        int left = 0;
        int right = products.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;

            int comparison =
                    products[mid].productName.compareToIgnoreCase(targetName);

            if (comparison == 0) {
                return products[mid];
            } else if (comparison < 0) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        return null;
    }

    public static void main(String[] args) {

        Product[] products = {
                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Mobile", "Electronics"),
                new Product(103, "Watch", "Accessories"),
                new Product(104, "Camera", "Electronics"),
                new Product(105, "Headphones", "Electronics")
        };

        Product result1 = linearSearch(products, "Camera");
        System.out.println("Linear Search Result:");
        System.out.println(result1);

        Arrays.sort(products,
                Comparator.comparing(p -> p.productName));

        Product result2 = binarySearch(products, "Camera");
        System.out.println("\nBinary Search Result:");
        System.out.println(result2);
    }
}