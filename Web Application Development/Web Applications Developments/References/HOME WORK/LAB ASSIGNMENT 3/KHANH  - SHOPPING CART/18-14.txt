package com.brainysoftware.burnaby;

import java.util.Hashtable;
import java.util.ArrayList;
import java.util.Enumeration;
import java.sql.*;

public class DbBean {
  public String dbUrl = "";
  public String dbUserName = "";
  public String dbPassword = "";

  public void setDbUrl(String url) {
    dbUrl = url;
  }
  public void setDbUserName(String userName) {
    dbUserName = userName;
  }
  public void setDbPassword(String password) {
    dbPassword = password;
  }

  public Hashtable getCategories() {
    Hashtable categories = new Hashtable();
    try {
      Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
      Statement s = connection.createStatement();
      String sql = "SELECT CategoryId, Category FROM Categories" +
        " ";
      ResultSet rs = s.executeQuery(sql);
      while (rs.next()) {
        categories.put(rs.getString(1), rs.getString(2) );
      }
      rs.close();
      s.close();
      connection.close();
    }
    catch (SQLException e) {}
    return categories;
  }

  public ArrayList getSearchResults(String keyword) {
    ArrayList products = new ArrayList();
    try {
      Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
      Statement s = connection.createStatement();
      String sql = "SELECT ProductId, Name, Description, Price FROM Products" +
        " WHERE Name LIKE '%" + keyword.trim() + "%'" +
        " OR Description LIKE '%" + keyword.trim() + "%'";
      ResultSet rs = s.executeQuery(sql);
      while (rs.next()) {
        Product product = new Product();
        product.id = rs.getInt(1);
        product.name = rs.getString(2);
        product.description = rs.getString(3);
        product.price = rs.getDouble(4);
        products.add(product);
      }
      rs.close();
      s.close();
      connection.close();
    }
    catch (SQLException e) {}
    return products;
  }

  public ArrayList getProductsInCategory(String categoryId) {
    ArrayList products = new ArrayList();
    try {
      Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
      Statement s = connection.createStatement();
      String sql = "SELECT ProductId, Name, Description, Price FROM Products" +
        " WHERE CategoryId=" + categoryId;
      ResultSet rs = s.executeQuery(sql);
      while (rs.next()) {
        Product product = new Product();
        product.id = rs.getInt(1);
        product.name = rs.getString(2);
        product.description = rs.getString(3);
        product.price = rs.getDouble(4);
        products.add(product);
      }
      rs.close();
      s.close();
      connection.close();
    }
    catch (SQLException e) {}
    return products;
  }

  public Product getProductDetails(int productId) {
    Product product = null;
    try {
      Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
      Statement s = connection.createStatement();
      String sql = "SELECT ProductId, Name, Description, Price FROM Products" +
        " WHERE ProductId=" + Integer.toString(productId);
      ResultSet rs = s.executeQuery(sql);
      if (rs.next()) {
        product = new Product();
        product.id = rs.getInt(1);
        product.name = rs.getString(2);
        product.description = rs.getString(3);
        product.price = rs.getDouble(4);
      }
      rs.close();
      s.close();
      connection.close();
    }
    catch (SQLException e) {}
    return product;
  }

  public boolean insertOrder(String contactName, String deliveryAddress,
    String ccName, String ccNumber, String ccExpiryDate, Hashtable shoppingCart) {
    boolean returnValue = false;
    long orderId = System.currentTimeMillis();
    Connection connection = null;
    try {
      connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
      connection.setAutoCommit(false);
      Statement s = connection.createStatement();
      String sql = "INSERT INTO Orders" +
        " (OrderId, ContactName, DeliveryAddress, CCName, CCNumber, CCExpiryDate)" +
        " VALUES" +
        " (" + orderId + ",'" + contactName + "','" + deliveryAddress + "'," +
        "'" + ccName + "','" + ccNumber + "','" + ccExpiryDate + "')";
      s.executeUpdate(sql);
      // now insert items into OrderDetails table
      Enumeration enum = shoppingCart.elements();
      while (enum.hasMoreElements()) {
        ShoppingItem item = (ShoppingItem) enum.nextElement();
        sql = "INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price)" +
        " VALUES (" + orderId + "," + item.productId + "," +
        item.quantity + "," + item.price + ")";
        s.executeUpdate(sql);
      }

      s.close();
      connection.commit();
      connection.close();
      returnValue = true;
    }
    catch (SQLException e) {
      try {
        connection.rollback();
        connection.close();
      }
      catch (SQLException se) {}
    }
    return returnValue;
  }
}
