/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_model;

import fontend_entities.Category;
import fontend_entities.ImageLink;
import fontend_entities.Product;


import fontend_entities.Provider;
import fontend_utils.Common;
import fontend_utils.ConnectDB;
import fontend_utils.Pagination;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class ProductModel {
    SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
    public HashMap getDataPagination(int page, int pageSize) {
        HashMap map1 = Pagination.getDataForPagination(page, pageSize, "Product", "ProductId", "getDataPagging.htm");
        return map1;
    }

    public List<Product> getAllProduct() {
        
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{call getAllProductCategory()}");
            ResultSet rs = calla.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setName(rs.getString("Name"));
                product.setContentDetail(rs.getString("ContentDetail"));
                product.setImages(rs.getString("Images"));
                product.setView(rs.getInt("View"));
                product.setBuyItem(rs.getInt("BuyItem"));
                product.setPriceInput(rs.getFloat("PriceInput"));
                product.setPriceOutput(rs.getFloat("PriceOutput"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getInt("CategoryId"));
                product.setProviderId(rs.getInt("ProviderId"));
                
                
                product.setStatus(rs.getBoolean("Status"));
                
                product.setDiscount(rs.getFloat("Discount"));
                product.setShowHome(rs.getBoolean("ShowHome"));
                if (rs.getDate("Created") == null) {
                    product.setCreated(null);
                } else {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }

    //8 SP mới 
    public List<Product> getProductHot() {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getProductHot()}");
            rs = calla.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setName(rs.getString("Name"));
                product.setContentDetail(rs.getString("ContentDetail"));
                product.setImages(rs.getString("Images"));
                product.setView(rs.getInt("View"));
                product.setBuyItem(rs.getInt("BuyItem"));
                product.setPriceInput(rs.getFloat("PriceInput"));
                product.setPriceOutput(rs.getFloat("PriceOutput"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getInt("CategoryId"));
                product.setStatus(rs.getBoolean("Status"));
                
                product.setDiscount(rs.getFloat("Discount"));
                if (rs.getDate("Created") == null) {
                    product.setCreated(null);
                } else {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }

    public int getProductTotal() {
        Connection conn = null;
        CallableStatement calla = null;
        int result = 0;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getProductTotal(?)}");
            calla.registerOutParameter(1, Types.INTEGER);
            calla.executeUpdate();
            result = calla.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }

    public Product getProductById(int id) {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        Product product = new Product();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall(" {call getProductById(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while (rs.next()) {
                product.setProductId(rs.getInt("ProductId"));
                product.setName(rs.getString("Name"));
                product.setContentDetail(rs.getString("ContentDetail"));
                product.setImages(rs.getString("Images"));
                product.setView(rs.getInt("View"));
                product.setBuyItem(rs.getInt("BuyItem"));
                product.setPriceInput(rs.getFloat("PriceInput"));
                product.setPriceOutput(rs.getFloat("PriceOutput"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getInt("CategoryId"));
                product.setProviderId(rs.getInt("ProviderId"));
                
                product.setStatus(rs.getBoolean("Status"));
                
                product.setDiscount(rs.getFloat("Discount"));
                product.setShowHome(rs.getBoolean("ShowHome"));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return product;
    }

    public List<Product> getProductRefsren(Product pro) {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getProductReferen(?,?)}");
            calla.setInt(1, pro.getProductId());
            calla.setInt(2, pro.getCategoryId());
            rs = calla.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setName(rs.getString("Name"));
                product.setContentDetail(rs.getString("ContentDetail"));
                product.setImages(rs.getString("Images"));
                product.setView(rs.getInt("View"));
                product.setBuyItem(rs.getInt("BuyItem"));
                product.setPriceInput(rs.getFloat("PriceInput"));
                product.setPriceOutput(rs.getFloat("PriceOutput"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getInt("CategoryId"));
                
                product.setDiscount(rs.getFloat("Discount"));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    
    public List<ImageLink> getImageProduct(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        List<ImageLink> list = new ArrayList<ImageLink>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getImageProduct(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while (rs.next()) {
                ImageLink imageLink = new ImageLink();
                imageLink.setImageLinkId(rs.getInt("ImageLinkId"));
                imageLink.setProductId(rs.getInt("ProductId"));
                imageLink.setImageLinkName(rs.getString("ImageLinkName"));
                imageLink.setStatus(rs.getBoolean("Status"));
                list.add(imageLink);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }

    public Category getCategoryByProductId(int id) {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        Connection conn = null;
        CallableStatement calla = null;
        Category category = new Category();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall(" {call getCategoryByProductId(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while (rs.next()) {
                category.setName(rs.getString("Name"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return category;
    }
    public boolean updateBuyItem(Product pro) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updateBuyItem(?,?)}");
            calla.setInt(1, pro.getProductId());
            calla.setInt(2, pro.getQuantity());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean updateViews(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;

        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updateViews(?)}");
            calla.setInt(1, id);
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    
    public boolean updateQuantity(Product pro) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updateQuantity(?,?)}");
            calla.setInt(1, pro.getProductId());
            calla.setInt(2, pro.getQuantity());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    
    public List<Product> getAllProductByCategory(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllProductByCategoryId(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setName(rs.getString("Name"));
                product.setContentDetail(rs.getString("ContentDetail"));
                product.setImages(rs.getString("Images"));
                product.setView(rs.getInt("View"));
                product.setBuyItem(rs.getInt("BuyItem"));
                product.setPriceInput(rs.getFloat("PriceInput"));
                product.setPriceOutput(rs.getFloat("PriceOutput"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getInt("CategoryId"));
                
                product.setDiscount(rs.getFloat("Discount"));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public List<Product> getAllProductByProvider(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllProductByProviderId(?)}");
            calla.setInt(1, id);
            rs = calla.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setName(rs.getString("Name"));
                product.setContentDetail(rs.getString("ContentDetail"));
                product.setImages(rs.getString("Images"));
                product.setView(rs.getInt("View"));
                product.setBuyItem(rs.getInt("BuyItem"));
                product.setPriceInput(rs.getFloat("PriceInput"));
                product.setPriceOutput(rs.getFloat("PriceOutput"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getInt("CategoryId"));
                
                product.setDiscount(rs.getFloat("Discount"));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public List<Product> getAllProductByPriceLowToHigh() {
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllProductByLowToHigh()}");
            rs = calla.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setName(rs.getString("Name"));
                product.setContentDetail(rs.getString("ContentDetail"));
                product.setImages(rs.getString("Images"));
                product.setView(rs.getInt("View"));
                product.setBuyItem(rs.getInt("BuyItem"));
                product.setPriceInput(rs.getFloat("PriceInput"));
                product.setPriceOutput(rs.getFloat("PriceOutput"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getInt("CategoryId"));
                
                product.setDiscount(rs.getFloat("Discount"));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public List<Product> getAllProductByPriceHighToLow() {
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllProductByHighToLow()}");
            rs = calla.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setName(rs.getString("Name"));
                product.setContentDetail(rs.getString("ContentDetail"));
                product.setImages(rs.getString("Images"));
                product.setView(rs.getInt("View"));
                product.setBuyItem(rs.getInt("BuyItem"));
                product.setPriceInput(rs.getFloat("PriceInput"));
                product.setPriceOutput(rs.getFloat("PriceOutput"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getInt("CategoryId"));
                
                product.setDiscount(rs.getFloat("Discount"));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public List<Product> getAllProductByBestView() {
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllProductByBestView()}");
            rs = calla.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setName(rs.getString("Name"));
                product.setContentDetail(rs.getString("ContentDetail"));
                product.setImages(rs.getString("Images"));
                product.setView(rs.getInt("View"));
                product.setBuyItem(rs.getInt("BuyItem"));
                product.setPriceInput(rs.getFloat("PriceInput"));
                product.setPriceOutput(rs.getFloat("PriceOutput"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getInt("CategoryId"));
                
                product.setDiscount(rs.getFloat("Discount"));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public List<Product> getAllProductByBestBuy() {
        Connection conn = null;
        CallableStatement calla = null;
        List<Product> list = new ArrayList<Product>();
        ResultSet rs;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call getAllProductByBestBuy()}");
            rs = calla.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setName(rs.getString("Name"));
                product.setContentDetail(rs.getString("ContentDetail"));
                product.setImages(rs.getString("Images"));
                product.setView(rs.getInt("View"));
                product.setBuyItem(rs.getInt("BuyItem"));
                product.setPriceInput(rs.getFloat("PriceInput"));
                product.setPriceOutput(rs.getFloat("PriceOutput"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setCategoryId(rs.getInt("CategoryId"));
                
                product.setDiscount(rs.getFloat("Discount"));
                if (rs.getDate("Created") != null) {
                    product.setCreated(fomat.format(rs.getDate("Created")));
                }
                product.setStatus(rs.getBoolean("Status"));
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return list;
    }
    public boolean updateProduct(Product product) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updateProduct(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            calla.setInt(1, product.getProductId());
            calla.setString(2, product.getName());
            calla.setString(3, product.getContentDetail());
            calla.setString(4, product.getImages());
            calla.setInt(5, product.getView());
            calla.setInt(6, product.getBuyItem());
            calla.setInt(7, product.getQuantity());
            calla.setFloat(8, product.getPriceInput());
            calla.setFloat(9, product.getPriceOutput());
            calla.setFloat(10, product.getDiscount());
            calla.setInt(11, product.getCategoryId());
            calla.setInt(12, product.getProviderId());
            calla.setBoolean(13, product.isStatus());
            calla.setBoolean(14, product.isShowHome());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean insertProduct(Product product) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call insertProduct(?,?,?,?,?,?,?,?)}");
            calla.setString(1, product.getName());
            calla.setString(2, product.getContentDetail());
            calla.setInt(3, product.getQuantity());
            calla.setFloat(4, product.getPriceInput());
            calla.setFloat(5, product.getPriceOutput());
            calla.setFloat(6, product.getDiscount());
            calla.setInt(7, product.getCategoryId());
            calla.setInt(8, product.getProviderId());
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
    public boolean updateProductStatus(int id) {
        Connection conn = null;
        CallableStatement calla = null;
        boolean result = false;
        try {
            conn = ConnectDB.openConnect();
            calla = conn.prepareCall("{ call updateProductStatus(?)}");
            calla.setInt(1, id);
            calla.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectDB.closeConnect(conn, calla);
        }
        return result;
    }
}
