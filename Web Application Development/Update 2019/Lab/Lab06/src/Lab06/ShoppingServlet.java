package Lab06;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ShoppingServlet", urlPatterns = "/ShoppingServlet")
public class ShoppingServlet extends HttpServlet {
    private AccountBean acc;
    private Map<Item, Integer> inventory = new HashMap<>();

    private Item parseFromString(String str){
        Item item = new Item();
        String[] parts = str.split("-");
        item.setProduct(parts[0].trim());
        item.setManufacturer(parts[1].trim());
        item.setMadeIn(parts[2].trim());
        item.setPrice(Double.valueOf(parts[3].trim()));
        return item;
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        //-------------------Handle Account Request----------------------
//        acc = (AccountBean) request.getAttribute("acc");
        if (this.acc == null){
            acc = new AccountBean();
            acc.setName(request.getParameter("name"));
            acc.setVisa(request.getParameter("visa"));
            acc.setAddress(request.getParameter("address"));
        }
        System.out.println(acc);
        request.setAttribute("acc", acc);
        //-------------------Handle Item Request----------------------
        String itemStr = request.getParameter("item");
        String quantity = request.getParameter("quantity");
//        System.out.println("Item: " + itemStr);
//        System.out.println("Quantity: " + quantity);

        if (itemStr != null && quantity != null){
            Item item = parseFromString(itemStr);
            Integer quantityInt = Integer.valueOf(quantity);

            inventory.put(item, inventory.getOrDefault(item, 0) + quantityInt);
        }

//        System.out.println("Input Item: ");
//        for (Item item : inventory.keySet())
//            System.out.println(item + " + " + inventory.get(item));
        request.setAttribute("inventory", inventory);
        //-------------------Handle Item Delete----------------------
        String deleteItemStr = request.getParameter("productDelete");
        System.out.println("ItemStrDelete: "+ deleteItemStr);
        Item deleteItem = null;
        if (deleteItemStr != null) {
            for (Item item : inventory.keySet()){
                if (item.getProduct().equals(deleteItemStr)){
                    deleteItem = item;
                    break;
                }
            }
            if (deleteItem != null){
                inventory.remove(deleteItem);
            }
        }

        System.out.println("Item Deleted: " + deleteItem);
        request.setAttribute("inventory", inventory);

        //-----------------------ForwardToProduct---------------------
        if (request.getParameter("checkout") == null){
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/products.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/checkout.jsp");
            dispatcher.forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
