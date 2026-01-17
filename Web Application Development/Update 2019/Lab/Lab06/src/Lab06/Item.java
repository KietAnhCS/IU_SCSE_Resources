package Lab06;

import java.util.Objects;

public class Item {
    private String product;
    private String manufacturer;
    private String madeIn;
    private Double price;

    public Item() {
    }

    public Item(String product, String manufacturer, String madeIn, Double price) {
        this.product = product;
        this.manufacturer = manufacturer;
        this.madeIn = madeIn;
        this.price = price;
    }

    public void parseFromString(String str){

    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getMadeIn() {
        return madeIn;
    }

    public void setMadeIn(String madeIn) {
        this.madeIn = madeIn;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return product + " - " + manufacturer + " - " + madeIn + " - " + price;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Item item = (Item) o;
        return product.equals(item.product) &&
                manufacturer.equals(item.manufacturer) &&
                madeIn.equals(item.madeIn) &&
                price.equals(item.price);
    }

    @Override
    public int hashCode() {
        return Objects.hash(product, manufacturer, madeIn, price);
    }
}
