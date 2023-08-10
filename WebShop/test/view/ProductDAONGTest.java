/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/EmptyTestNGTest.java to edit this template
 */
package view;

import java.util.ArrayList;
import model.Product;
import static org.testng.Assert.*;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

/**
 *
 * @author dell
 */
public class ProductDAONGTest {
    
    public ProductDAONGTest() {
    }

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }

    @BeforeMethod
    public void setUpMethod() throws Exception {
    }

    @AfterMethod
    public void tearDownMethod() throws Exception {
    }

    /**
     * Test of getNewProduct method, of class ProductDAO.
     */
    @Test
    public void testGetNewProduct() {
        System.out.println("getNewProduct");
        ProductDAO instance = new ProductDAO();
        ArrayList expResult = null;
        ArrayList result = instance.getNewProduct();
        assertEquals(result, expResult);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getSaleProduct method, of class ProductDAO.
     */
    @Test
    public void testGetSaleProduct() {
        System.out.println("getSaleProduct");
        ProductDAO instance = new ProductDAO();
        ArrayList expResult = null;
        ArrayList result = instance.getSaleProduct();
        assertEquals(result, expResult);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllProduct method, of class ProductDAO.
     */
    @Test
    public void testGetAllProduct() {
        System.out.println("getAllProduct");
        String search = "";
        String category = "";
        ProductDAO instance = new ProductDAO();
        ArrayList expResult = null;
        ArrayList result = instance.getAllProduct(search, category);
        assertEquals(result, expResult);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getRelateProduct method, of class ProductDAO.
     */
    @Test
    public void testGetRelateProduct() {
        System.out.println("getRelateProduct");
        int id = 0;
        ProductDAO instance = new ProductDAO();
        ArrayList expResult = null;
        ArrayList result = instance.getRelateProduct(id);
        assertEquals(result, expResult);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getProduct method, of class ProductDAO.
     */
    @Test
    public void testGetProduct() {
        System.out.println("getProduct");
        int id = 0;
        ProductDAO instance = new ProductDAO();
        Product expResult = null;
        Product result = instance.getProduct(id);
        assertEquals(result, expResult);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAdminProduct method, of class ProductDAO.
     */
    @Test
    public void testGetAdminProduct() {
        System.out.println("getAdminProduct");
        ProductDAO instance = new ProductDAO();
        ArrayList expResult = null;
        ArrayList result = instance.getAdminProduct();
        assertEquals(result, expResult);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of changeProduct method, of class ProductDAO.
     */
    @Test
    public void testChangeProduct() {
        System.out.println("changeProduct");
        String name = "";
        String image = "";
        int quantity = 0;
        double price = 0.0;
        String description = "";
        int id = 0;
        ProductDAO instance = new ProductDAO();
        instance.changeProduct(name, image, quantity, price, description, id);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of addProduct method, of class ProductDAO.
     */
    @Test
    public void testAddProduct() {
        System.out.println("addProduct");
        String name = "";
        String image = "";
        int quantity = 0;
        double price = 0.0;
        int cate_id = 0;
        String description = "";
        ProductDAO instance = new ProductDAO();
        instance.addProduct(name, image, quantity, price, cate_id, description);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deleteProduct method, of class ProductDAO.
     */
    @Test
    public void testDeleteProduct() {
        System.out.println("deleteProduct");
        int id = 0;
        ProductDAO instance = new ProductDAO();
        instance.deleteProduct(id);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
