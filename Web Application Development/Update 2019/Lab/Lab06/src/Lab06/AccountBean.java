package Lab06;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class AccountBean  {
    private String name;
    private String visa;
    private String address;
    private Map<Item, Integer> inventory = new HashMap<>();

    public AccountBean() {
    }

    public AccountBean(String name, String visa, String address) {
        this.name = name;
        this.visa = visa;
        this.address = address;
    }

    public void addItem(Item item, Integer quantity) {
        inventory.put(item, quantity);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVisa() {
        return visa;
    }

    public void setVisa(String visa) {
        this.visa = visa;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString(){
        return "Name: " + this.name + " VISA: " + this.visa + " Address: " + this.address;
    }
}
