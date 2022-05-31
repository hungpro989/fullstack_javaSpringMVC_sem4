/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_controller;

import fontend_entities.Banner;
import fontend_entities.Blog;
import fontend_entities.Cart;
import fontend_entities.Category;

import fontend_utils.EmailUtil;
import fontend_entities.Customer;
import fontend_entities.ImageLink;
import fontend_entities.Message;
import fontend_entities.Order;
import fontend_entities.OrderDetail;
import fontend_entities.PaymentType;
import fontend_entities.Product;


import fontend_entities.Provider;

import fontend_model.BannerModel;
import fontend_model.BlogModel;
import fontend_model.CategoryModel;

import fontend_model.CustomerModel;
import fontend_model.HomeModel;
import fontend_model.MessageModel;
import fontend_model.OrderDetailModel;
import fontend_model.OrderModel;
import fontend_model.PaymentTypeModel;
import fontend_model.ProductModel;
import fontend_model.ProviderModel;

import fontend_utils.Common;
import fontend_utils.ConnectDB;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author hungp
 */
@Controller
@RequestMapping(value = "/fontend")
public class FontEndController {

    private CustomerModel customerModel;
    private CategoryModel categoryModel;
    
    
    private ProviderModel providerModel;
    private ProductModel productModel;
    private PaymentTypeModel paymentTypeModel;
    private OrderModel orderModel;
    private OrderDetailModel orderDetailModel;
    private BlogModel blogModel;
    private BannerModel bannerModel;
    private MessageModel messageModel;
    private HomeModel homeModel;

    public FontEndController() {
        customerModel = new CustomerModel();
        categoryModel = new CategoryModel();
        
        
        providerModel = new ProviderModel();
        productModel = new ProductModel();
        paymentTypeModel = new PaymentTypeModel();
        orderModel = new OrderModel();
        orderDetailModel = new OrderDetailModel();
        blogModel = new BlogModel();
        bannerModel = new BannerModel();
        messageModel = new MessageModel();
        homeModel = new HomeModel();
    }

    @RequestMapping(value = "/home")
    public ModelAndView homeFontend() {
        /**/
        ModelAndView model = new ModelAndView("/fontend/home");
        Customer c = new Customer();
        model.addObject("c", c);
        List<Product> listProductHot = productModel.getProductHot();
        List<Blog> listBlogs = blogModel.getAllBlog();
        List<Banner> listBanner = bannerModel.getAllBannerHome();
        Product product = homeModel.getProductDiscountHome();
        model.getModelMap().put("productDiscount", product);
        model.getModelMap().put("listBanner", listBanner);
        model.getModelMap().put("listBlogs", listBlogs);
        model.getModelMap().put("listProductHot", listProductHot);
        return model;
        /**/
    }

    @RequestMapping(value = "contact")
    public String contactFontend(Model model, @ModelAttribute("m") Message mes) {
        Customer c = new Customer();
        Message m = new Message();
        model.addAttribute("c", c);
        model.addAttribute("m", m);
        return "fontend/contact";
    }

    @RequestMapping(value = "send-message")
    public ModelAndView sendMessageFontend(Model model, @ModelAttribute("m") Message mes, HttpServletRequest request) throws MessagingException {
        Customer c = new Customer();
        Message m = new Message();
        boolean result_mes = false;
        model.addAttribute("c", c);
        model.addAttribute("m", m);
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String mesdes = request.getParameter("messageDescription");
        String email = request.getParameter("email");
        m.setName(name);
        m.setPhone(phone);
        m.setEmail(email);
        m.setMessageDescription(mesdes);
        result_mes = messageModel.insertMessage(m);
        if (result_mes) {
            EmailUtil.sendMail(email, "Message sent successfully!", "<p>Dear " + name + "</p>We will respond to your problem as quickly as possible. Thank you very much ");
            return new ModelAndView("redirect:contact.htm");
        } else {
            return new ModelAndView("redirect:contact.htm");
        }
    }

    @RequestMapping(value = "/checkout")
    public ModelAndView checkOutFontend(@ModelAttribute("message") final String message, HttpSession session, ModelMap mm) {
        ModelAndView model;
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        model = new ModelAndView("fontend/checkout");
        Customer c = new Customer();
        model.addObject("c", c);
        model.addObject("message", message);
        float paymentAmount = (float) getTotal(listCart);
        String name = (String) session.getAttribute("customer");
        List<PaymentType> listPaymentType = paymentTypeModel.getALlPaymentType();//danh sách phương thức thanh toán
        model.getModelMap().put("listPaymentType", listPaymentType);
        model.getModel().put("total", Common.formatNumber(paymentAmount));
        if (name != null) {
            Customer cus = customerModel.getCustomerByUserName(name);
            model.getModelMap().put("cus", cus);
            return model;
        } else {
            return model;
        }
    }

    @RequestMapping(value = "placeOrder")
    public ModelAndView placeOrder(@ModelAttribute("c") Customer c, HttpServletRequest request, HttpSession session) throws MessagingException {
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        String customer = (String) session.getAttribute("customer");
        Customer cus = customerModel.getCustomerByUserName(customer);
        ModelAndView model;

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String checkbox = request.getParameter("checkbox_create");
        String password = request.getParameter("password");
        String description = request.getParameter("description");
        int paymentTypeId = Integer.parseInt(request.getParameter("paymentTypeId"));
        int customerId = cus.getCustomerId();
        float total = Float.parseFloat(request.getParameter("total"));
        float subPrice = Float.parseFloat(request.getParameter("subPrice"));
        float cod = Float.parseFloat(request.getParameter("cod"));
        float discount = Float.parseFloat(request.getParameter("discount"));

        Order order = new Order();
        order.setTotalPrice(total);
        order.setSubPrice(subPrice);
        order.setCod(cod);
        order.setDiscount(discount);
        order.setPaymentTypeId(paymentTypeId);
        order.setDescription(description);
        boolean result_order = false;
        boolean result_cus = false;
        if (customer != null) {
            order.setCustomerId(customerId);
            order.setName(name);
            order.setPhone(phone);
            order.setAddress(address);
            order.setEmail(email);
            result_order = orderModel.insertOrder(order);
        } else if (customer == null && checkbox != null) {
            c.setName(name);
            c.setPhone(phone);
            c.setAddress(address);
            c.setEmail(email);
            c.setUserName(phone);
            c.setPassword(password);
            if (customerModel.checkUserName(phone)) {
                model = new ModelAndView("fontend/checkout");
                model.addObject("message", "Username or phone already exists.");
                return model;
            } else if (customerModel.checkEmail(email)) {
                model = new ModelAndView("fontend/checkout");
                model.addObject("message", "Email already exists.");
                return model;
            } else if (customerModel.checkPhone(phone)) {
                model = new ModelAndView("fontend/checkout");
                model.addObject("message", "Phone already exists.");
                return model;
            } else {
                result_cus = customerModel.insertCustomer(c);
            }
            if (result_cus) {
                int cusNewId = customerModel.getCustomerIdNew();
                order.setCustomerId(cusNewId);
                order.setName(name);
                order.setPhone(phone);
                order.setAddress(address);
                order.setEmail(email);
                result_order = orderModel.insertOrder(order);
            } else {
                model = new ModelAndView("fontend/checkout");
                return model;
            }
        } else {
            order.setCustomerId(4);
            order.setName(name);
            order.setPhone(phone);
            order.setAddress(address);
            order.setEmail(email);
            result_order = orderModel.insertOrder(order);
            if (result_order == false) {
                model = new ModelAndView("fontend/checkout");
                return model;
            }
        }
        if (result_order) {
            int orderId = orderModel.getOrderIdNew();
            String contentListCart = "";
            for (Cart listCart1 : listCart) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderId(orderId);
                orderDetail.setProductId(listCart1.getProduct().getProductId());
//                productModel.updateBuyItem(listCart1.getProduct().getProductId());
                if (listCart1.getProduct().getDiscount() == 0) {
                    orderDetail.setPrice(listCart1.getProduct().getPriceOutput());
                } else {
                    orderDetail.setPrice(listCart1.getProduct().getDiscount());
                }
                contentListCart = "<p>" + contentListCart + (listCart1.getProduct().getName()) + "[" + (listCart1.getQuantity()) + "pcs]" + ",</p>";
                orderDetail.setQuantity(listCart1.getQuantity());
                boolean k = orderModel.insertOrderDetail(orderDetail);
            }
            session.removeAttribute("listCart");
            session.removeAttribute("totalCod");
            session.removeAttribute("count_quantity");
            session.removeAttribute("cod");
            session.removeAttribute("subPrice");
            session.removeAttribute("discount");
            String content = "<div><p>Receiver: " + name + "</p><p>Number phone: " + phone + "</p><p>Address: " + address + "</p><strong>Items include: " + contentListCart + "</strong><p>Sub price: $" + subPrice + "</p><p>Discount: $" + discount + "</p><p>Fee shipping: $" + cod + "</p><p>Total: $" + total + "</p>Thank you so much!</div>";
            EmailUtil.sendMail(email, "Successful Order.", "<p>Dear " + name + "</p>Thank you for ordering from us. This is the order information you have placed: " + content);
            return new ModelAndView("fontend/thankyou");
        } else {
            return new ModelAndView("fontend/checkout");
        }
    }

    @RequestMapping(value = "/mycart")
    public String myCart(Model model, @ModelAttribute("message") final String message) {
        Customer c = new Customer();
        model.addAttribute("c", c);
        model.addAttribute("message", message);
        return "fontend/shoppingcart";
    }

    @RequestMapping(value = "/about")
    public String aboutFontend(Model model, @ModelAttribute("message") final String message) {
        Customer c = new Customer();
        model.addAttribute("c", c);
        model.addAttribute("message", message);
        return "fontend/about";
    }

    @RequestMapping(value = "/thankyou")
    public String thankYouFontend(Model model, @ModelAttribute("message") final String message) {
        Customer c = new Customer();
        model.addAttribute("c", c);
        model.addAttribute("message", message);
        return "fontend/thankyou";
    }

    @RequestMapping(value = "/resgiter")
    public @ResponseBody String resgiterCustomer(ModelMap mm, HttpServletRequest request, RedirectAttributes ra, HttpSession session,@RequestParam String name_create,@RequestParam String username_create,@RequestParam String password_create,@RequestParam String phone_create,@RequestParam String address_create,@RequestParam String email_create) throws MessagingException {
        Customer customer = new Customer();
        customer.setName(name_create);
        customer.setUserName(username_create);
        customer.setPassword(password_create);
        customer.setPhone(phone_create);
        customer.setAddress(address_create);
        customer.setEmail(email_create);
        
        if (customerModel.checkUserName(customer.getUserName())) {
            return "username_already_exists";
        } else if (customerModel.checkPhone(customer.getPhone())) {
            return "phone_already_exists";
        } else if(customerModel.checkEmail(customer.getEmail())){
            return "email_already_exists";
        }else {
            boolean result = customerModel.insertCustomer(customer);
            if (result) {
                int id = customerModel.getCustomerIdNew();
                String content = "<div><p>Username:</p>" + customer.getUserName() + "<br> <p>Email:</p>" + customer.getEmail() + "<br> Address:" + customer.getAddress() + " <br><p>Phone:</p>" + customer.getPhone() + "</div>";
                EmailUtil.sendMail(customer.getEmail(), "Successful.", "Thank you for register.This is your account information: " + content);
                return "true";
            } else {
                return "false";
            }
        }
        
    }

    @RequestMapping(value = "login")
    public @ResponseBody
    String login(HttpSession session, ModelMap mm, HttpServletRequest request, RedirectAttributes ra, @RequestParam String username_login, @RequestParam String password_login) {
        Customer cus = new Customer();
        cus.setUserName(username_login);
        cus.setPassword(password_login);
        boolean result = customerModel.checkLogin(cus);
        if (result) {
            session.setAttribute("customer", cus.getUserName());
            return "true";
        } else {
            return "false";
        }
    }

    @RequestMapping(value = "/profile")
    public ModelAndView profileFontend(HttpSession session, ModelMap mm, Model md) {
        Customer c = new Customer();
        md.addAttribute("c", c);
        ModelAndView model;
        String name = (String) session.getAttribute("customer");
        if (name != null) {
            model = new ModelAndView("fontend/profile");
            Customer cus = customerModel.getCustomerByUserName(name);
            model.getModelMap().put("profile", cus);
            return model;
        } else {
            model = new ModelAndView("fontend/home");
            mm.put("message", "Đăng nhập để tiếp tục.");
            Customer cus = new Customer();
            model.getModelMap().put("customer", cus);
            model.getModelMap().put("action", "profile");
            return model;
        }
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:home.htm";  //Where you go after logout here.
    }

    @RequestMapping(value = "/shop")
    public ModelAndView getDataProduct() {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        ModelAndView model = new ModelAndView("fontend/shop");
        Customer c = new Customer();
        int productTotal = 0;
        model.addObject("c", c);
        int sizeRowofPage = 12;//số sản phâm tren 1 trang
        HashMap map1 = productModel.getDataPagination(1, sizeRowofPage);
        List<Category> listCategory = categoryModel.getCategoryRoot();//danh sách danh mục cha hiện thị menu trái
        List<Provider> listProvider = providerModel.getAllProvider();//danh sách nhà cung cấp hiện thị cho phần lọc theo thương hiệu
        
        List<Product> listProductHot = productModel.getProductHot();// danh sách sản phâm nổi bật
        productTotal = productModel.getProductTotal();
        String url = (String) map1.get("url");//chuỗi phân trang
        List<Product> listProduct = new ArrayList<>();
        try {
            ResultSet rs = (ResultSet) map1.get("rs");
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
                listProduct.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Connection conn = (Connection) map1.get("conn");
            CallableStatement callSt = (CallableStatement) map1.get("callSt");
            ConnectDB.closeConnect(conn, callSt);
        }
        model.getModelMap().put("listCategory", listCategory);
        model.getModelMap().put("listProductHot", listProductHot);
        model.getModelMap().put("listProduct", listProduct);
        model.getModelMap().put("listProvider", listProvider);
        
        model.getModelMap().put("url", url);
        model.getModelMap().put("productTotal", productTotal);
        return model;
    }

    @RequestMapping(value = "/getDataPagging")
    public ModelAndView getDataProductPagging(@RequestParam("page") String page) {
        SimpleDateFormat fomat = new SimpleDateFormat("dd-MM-yyyy");
        ModelAndView model = new ModelAndView("fontend/shop");
        Customer c = new Customer();
        model.addObject("c", c);
        int pageInt = Integer.parseInt(page);
        int sizeRowofPage = 12;// số sản phẩm trên 1 trang
        HashMap map1 = productModel.getDataPagination(pageInt, sizeRowofPage);
        List<Category> listCategory = categoryModel.getCategoryRoot();//danh sách danh mục cha hiện thị menu trái
        List<Provider> listProvider = providerModel.getAllProvider();//danh sách nhà cung cấp hiện thị cho phần lọc theo thương hiệu
        String url = (String) map1.get("url");
        List<Product> listProduct = new ArrayList<>();
        try {
            ResultSet rs = (ResultSet) map1.get("rs");
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
                listProduct.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            Connection conn = (Connection) map1.get("conn");
            CallableStatement callSt = (CallableStatement) map1.get("callSt");
            ConnectDB.closeConnect(conn, callSt);
        }
        model.getModelMap().put("listProduct", listProduct);
        model.getModelMap().put("url", url);
        model.getModelMap().put("listProvider", listProvider);
        model.getModelMap().put("listCategory", listCategory);
        return model;
    }

    @RequestMapping(value = "/shopdetail")
    public ModelAndView productDetail(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("fontend/shopdetail");
        Customer c = new Customer();
        model.addObject("c", c);
        productModel.updateViews(id);
        Product product = productModel.getProductById(id);
        Category category = productModel.getCategoryByProductId(id);
        List<Product> lsRefe = productModel.getProductRefsren(product);//danh sách sản phẩm liên quan(sản phẩm cùng danh muc)
        List<ImageLink> listImage = productModel.getImageProduct(id);//danh sách ảnh liên quan, ảnh mô tả cho sản phảm

        model.getModelMap().put("product", product);
        model.getModelMap().put("listImage", listImage);
        model.getModelMap().put("listRefe", lsRefe);
        model.getModelMap().put("category", category);
        return model;
    }

    @RequestMapping(value = "/addcart")
    public ModelAndView addCart(@RequestParam("Id") int id, @RequestParam(value = "quantity", required = false) String quantity,
            HttpSession session, HttpServletRequest request) {
        ModelAndView model = new ModelAndView("redirect:mycart.htm");
        Customer c = new Customer();
        model.addObject("c", c);
        int quan = Integer.parseInt(quantity);
        //lay ds sp của customer trong session
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        if (listCart == null) {
            // nếu listCart rỗng null thì thêm mới
            listCart = new ArrayList<>();
            listCart.add(new Cart(productModel.getProductById(id), quan));
        } else {
            //nếu đã tồn tại thì
            boolean flag = false;
            for (Cart cart : listCart) {
                //trường hợp1: trùng productId thì giữ nguyên và tăng Quantity sp đó
                if (cart.getProduct().getProductId() == id) {
                    int a = cart.getQuantity();
                    cart.setQuantity(a + quan);
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                listCart.add(new Cart(productModel.getProductById(id), quan));
            }
        }
        // đưa giỏ hàng lên session
        session.setAttribute("listCart", listCart);
        session.setAttribute("total", (getTotal(listCart)));
        session.setAttribute("discount", (getDiscount(listCart)));
        session.setAttribute("subPrice", (getSubPrice(listCart)));
        session.setAttribute("count_quantity", countProductCart(listCart));
        session.setAttribute("cod", (getCod(listCart)));
        session.setAttribute("totalCod", (getTotalCod(listCart)));
        return model;
    }

    public float getTotal(List<Cart> listCart) {
        float total = 0;
        if (listCart != null) {
            for (Cart c : listCart) {
                if (c.getProduct().getDiscount() == 0) {
                    total += (float) (c.getQuantity() * (c.getProduct().getPriceOutput()));
                } else {
                    total += (float) (c.getQuantity() * (c.getProduct().getDiscount()));
                }
            }
        }
        return total;
    }

    public float getSubPrice(List<Cart> listCart) {
        float subPrice = 0;
        if (listCart != null) {
            for (Cart c : listCart) {
                subPrice += (float) (c.getQuantity() * (c.getProduct().getPriceOutput()));
            }
        }
        return subPrice;
    }

    public float getDiscount(List<Cart> listCart) {
        float subPrice = getSubPrice(listCart);
        float total = getTotal(listCart);
        float discount = 0;
        if (listCart != null) {
            for (Cart c : listCart) {
                discount = subPrice - total;
            }
        }
        return discount;
    }

    public float getCod(List<Cart> listCart) {
        float total = getTotal(listCart);
        float cod = 0;
        if (listCart != null) {
            cod = total * (float) (0.05);
        }
        return cod;
    }

    public float getTotalCod(List<Cart> listCart) {
        float total = getTotal(listCart);
        float totalCod = 0;
        if (listCart != null) {
            totalCod = (total * (float) (0.05)) + total;
        }
        return totalCod;
    }

    public int countProductCart(List<Cart> listCart) {
        int count_quantity = 0;
        if (listCart != null) {
            for (Cart c : listCart) {
                if (c.getProduct().getDiscount() == 0) {
                    count_quantity += c.getQuantity();
                } else {
                    count_quantity += c.getQuantity();
                }
            }
        }
        return count_quantity;
    }

    /**
     * xóa sản phẩm trong giỏ hàng
     *
     * @param id
     * @param session
     * @return
     */
    @RequestMapping(value = "/remove", method = RequestMethod.GET)
    public ModelAndView remove(@RequestParam("Id") int id, HttpSession session) {
        ModelAndView model = new ModelAndView("redirect:mycart.htm");
        Customer c = new Customer();
        model.addObject("c", c);
        // lấy dssp session kh
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        if (listCart != null) {
            for (int i = 0; i < listCart.size(); i++) {
                if (listCart.get(i).getProduct().getProductId() == id) {
                    // neu sp ton tai thi remove
                    listCart.remove(i).getProduct().getProductId();
                    break;
                }
            }
        }
        // luu ds sp va tong tien
        session.setAttribute("listCart", listCart);
        session.setAttribute("discount", (getDiscount(listCart)));
        session.setAttribute("subPrice", (getSubPrice(listCart)));
        session.setAttribute("total", (getTotal(listCart)));
        session.setAttribute("cod", (getCod(listCart)));
        session.setAttribute("count_quantity", countProductCart(listCart));
        session.setAttribute("totalCod", (getTotalCod(listCart)));
        return model;
    }

    @RequestMapping(value = "/update")
    public ModelAndView update(HttpServletRequest request, HttpSession session) {
        ModelAndView model = new ModelAndView("redirect:mycart.htm");
        Customer c = new Customer();
        model.addObject("c", c);
        // lay ds sp khach hang trong session 
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        // lay danh sach sl san pham muon mua
        String[] arrQuantity = request.getParameterValues("quantity");
        for (int i = 0; i < listCart.size(); i++) {
            listCart.get(i).setQuantity(Integer.parseInt(arrQuantity[i]));
            if (Integer.parseInt(arrQuantity[i]) < 1) {
                listCart.get(i).setQuantity(1);
            }
        }
        // luu ds sp va tong tien
        session.setAttribute("listCart", listCart);
        session.setAttribute("discount", (getDiscount(listCart)));
        session.setAttribute("subPrice", (getSubPrice(listCart)));
        session.setAttribute("total", (getTotal(listCart)));
        session.setAttribute("cod", (getCod(listCart)));
        session.setAttribute("count_quantity", countProductCart(listCart));
        session.setAttribute("totalCod", (getTotalCod(listCart)));
        return model;
    }

    @RequestMapping(value = "/listOrder")
    public ModelAndView listOrderFontend(HttpSession session, ModelMap mm) {
        ModelAndView model;
        String customer = (String) session.getAttribute("customer");
        if (customer != null) {
            Customer cus = customerModel.getCustomerByUserName(customer);
            model = new ModelAndView("fontend/listorder");
            model.addObject("c", cus);
            List<Order> listOrder = orderModel.getOrderByUserId(cus.getCustomerId());
            model.getModelMap().put("listOrder", listOrder);
        } else {
            model = new ModelAndView("fontend/home");
            mm.put("tb", "Bạn chưa đăng nhập, đăng nhập để xem lịch sủ mua hàng.");
            Customer cus = new Customer();
            model.addObject("c", cus);
            model.getModelMap().put("customer", cus);
            model.getModelMap().put("customer", "history");
        }
        return model;
    }

    @RequestMapping(value = "/orderdetail")
    public ModelAndView orderDetail(@RequestParam("Id") int id, HttpSession session) {
        ModelAndView model;
        String name = (String) session.getAttribute("customer");
        List<OrderDetail> orderDetail = orderDetailModel.getOrderDetailById(id);
        if (name != null) {
            model = new ModelAndView("fontend/orderdetail");
            Customer cus = customerModel.getCustomerByUserName(name);
            Order order = orderModel.getOrderById(id);
            model.addObject("c", cus);
            model.getModelMap().put("cus", cus);
            model.getModelMap().put("order", order);
            model.getModelMap().put("listOrderDetail", orderDetail);
            return model;
        } else {
            model = new ModelAndView("fontend/home");
            return model;
        }
    }

    @RequestMapping(value = "/updateOrder")
    public ModelAndView updateOrder(@ModelAttribute("updateOrder") Order order, HttpSession session, ModelMap mm) {
        ModelAndView model;
        String name = (String) session.getAttribute("customer");
        Customer cus = customerModel.getCustomerByUserName(name);
        order.setUserId(cus.getCustomerId());
        boolean result_updateOrder = false;
        if (name != null) {
            result_updateOrder = orderModel.updateOrder(order);
            if (result_updateOrder) {
                model = new ModelAndView("redirect:listOrder.htm");
                model.addObject("c", cus);
                return model;
            } else {
                mm.put("message", "Update failed.");
                model = new ModelAndView("fontend/home");
                model.addObject("c", cus);
                return model;
            }
        } else {
            mm.put("message", "Update failed.");
            model = new ModelAndView("fontend/home");
            model.addObject("c", cus);
            return model;
        }
    }

    @RequestMapping(value = "blog")
    public ModelAndView getAllBlog() {
        ModelAndView model = new ModelAndView("fontend/blog");
        Customer cus = new Customer();
        model.addObject("c", cus);
        List<Blog> list = blogModel.getAllBlog();
        model.getModelMap().put("listBlog", list);
        return model;
    }

    @RequestMapping(value = "/blogdetail")
    public ModelAndView blogDetail(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("fontend/blogdetail");
        Customer cus = new Customer();
        model.addObject("c", cus);
        Blog blog = blogModel.getBlogById(id);
        model.getModelMap().put("blog", blog);
        return model;
    }

    @RequestMapping(value = "/searchorderbyphone")
    public ModelAndView listSearchOrder(@ModelAttribute("o") Order o, HttpServletRequest request) {
        ModelAndView model = new ModelAndView("fontend/listsearchorder");
        Customer cus = new Customer();
        model.addObject("c", cus);
        String phone = request.getParameter("phone");
        List<Order> listOrder = orderModel.getOrderByPhone(phone);
        model.getModelMap().put("listOrder", listOrder);
        return model;
    }

    @RequestMapping(value = "/searchproductbycategory")
    public ModelAndView searchProductByCategory(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("fontend/shop");
        Customer cus = new Customer();
        model.addObject("c", cus);
        List<Provider> listProvider = providerModel.getAllProvider();//danh sách nhà cung cấp hiện thị cho phần lọc theo thương hiệu
        List<Category> listCategory = categoryModel.getCategoryRoot();//danh sách danh mục cha hiện thị menu trái
        List<Product> listProduct = productModel.getAllProductByCategory(id);

        model.getModelMap().put("productTotal", listProduct.size());
        model.getModelMap().put("listProduct", listProduct);
        model.getModelMap().put("listCategory", listCategory);
        model.getModelMap().put("listProvider", listProvider);
        return model;
    }

    @RequestMapping(value = "/search-product-by-provider")
    public ModelAndView searchProductByProvider(@RequestParam("Id") int id) {
        ModelAndView model = new ModelAndView("fontend/shop");
        Customer cus = new Customer();
        model.addObject("c", cus);
        List<Provider> listProvider = providerModel.getAllProvider();//danh sách nhà cung cấp hiện thị cho phần lọc theo thương hiệu
        List<Category> listCategory = categoryModel.getCategoryRoot();//danh sách danh mục cha hiện thị menu trái
        List<Product> listProduct = productModel.getAllProductByProvider(id);

        model.getModelMap().put("productTotal", listProduct.size());
        model.getModelMap().put("listProduct", listProduct);
        model.getModelMap().put("listCategory", listCategory);
        model.getModelMap().put("listProvider", listProvider);
        return model;
    }

    @RequestMapping(value = "/product-price-low-to-high")
    public ModelAndView productLowToHigh() {
        ModelAndView model = new ModelAndView("fontend/shop");
        Customer cus = new Customer();
        model.addObject("c", cus);
        List<Provider> listProvider = providerModel.getAllProvider();//danh sách nhà cung cấp hiện thị cho phần lọc theo thương hiệu
        List<Category> listCategory = categoryModel.getCategoryRoot();//danh sách danh mục cha hiện thị menu trái
        List<Product> listProduct = productModel.getAllProductByPriceLowToHigh();

        model.getModelMap().put("productTotal", listProduct.size());
        model.getModelMap().put("listProduct", listProduct);
        model.getModelMap().put("listCategory", listCategory);
        model.getModelMap().put("listProvider", listProvider);
        return model;
    }

    @RequestMapping(value = "/product-price-high-to-low")
    public ModelAndView productHighToLow() {
        ModelAndView model = new ModelAndView("fontend/shop");
        Customer cus = new Customer();
        model.addObject("c", cus);
        List<Provider> listProvider = providerModel.getAllProvider();//danh sách nhà cung cấp hiện thị cho phần lọc theo thương hiệu
        List<Category> listCategory = categoryModel.getCategoryRoot();//danh sách danh mục cha hiện thị menu trái
        List<Product> listProduct = productModel.getAllProductByPriceHighToLow();

        model.getModelMap().put("productTotal", listProduct.size());
        model.getModelMap().put("listProduct", listProduct);
        model.getModelMap().put("listCategory", listCategory);
        model.getModelMap().put("listProvider", listProvider);
        return model;
    }

    @RequestMapping(value = "/product-most-view")
    public ModelAndView productBestView() {
        ModelAndView model = new ModelAndView("fontend/shop");
        Customer cus = new Customer();
        model.addObject("c", cus);
        List<Provider> listProvider = providerModel.getAllProvider();//danh sách nhà cung cấp hiện thị cho phần lọc theo thương hiệu
        List<Category> listCategory = categoryModel.getCategoryRoot();//danh sách danh mục cha hiện thị menu trái
        List<Product> listProduct = productModel.getAllProductByBestView();

        model.getModelMap().put("productTotal", listProduct.size());
        model.getModelMap().put("listProduct", listProduct);
        model.getModelMap().put("listCategory", listCategory);
        model.getModelMap().put("listProvider", listProvider);
        return model;
    }

    @RequestMapping(value = "/product-best-seller")
    public ModelAndView productBestBuy() {
        ModelAndView model = new ModelAndView("fontend/shop");
        Customer cus = new Customer();
        model.addObject("c", cus);
        List<Provider> listProvider = providerModel.getAllProvider();//danh sách nhà cung cấp hiện thị cho phần lọc theo thương hiệu
        List<Category> listCategory = categoryModel.getCategoryRoot();//danh sách danh mục cha hiện thị menu trái
        List<Product> listProduct = productModel.getAllProductByBestBuy();

        model.getModelMap().put("productTotal", listProduct.size());
        model.getModelMap().put("listProduct", listProduct);
        model.getModelMap().put("listCategory", listCategory);
        model.getModelMap().put("listProvider", listProvider);
        return model;
    }

    @RequestMapping(value = "/change-password-customer")
    public @ResponseBody
    String changPasswordCustomer(HttpServletRequest request, @RequestParam String pass_new, @RequestParam int customerId, @RequestParam String name, @RequestParam String email) throws MessagingException {
        ModelAndView model = new ModelAndView("fontend/thankyou");
        Customer c = new Customer();
        model.addObject("c", c);
        c.setCustomerId(customerId);
        c.setPasswordNew(pass_new);
        boolean updatePass = customerModel.updatePassword(c);
        if (updatePass) {
            EmailUtil.sendMail(email, "Change password successfully", "<p>Dear " + name + "</p>We changed the password at your request:" + pass_new);
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            return "fontend/home";
        } else {
            return "fontend/home";
        }
    }

    @RequestMapping(value = "/forget-password-customer")
    public ModelAndView forgetPasswordCustomer(@ModelAttribute("c") Customer c) {
        ModelAndView model = new ModelAndView("fontend/forgetpassword");
        c = new Customer();
        model.addObject("c", c);
        return model;
    }

    @RequestMapping(value = "/forget-password-continue")
    public @ResponseBody
    String forgetPasswordContinueCustomer(HttpServletRequest request, @RequestParam String email) throws MessagingException {
        ModelAndView model = new ModelAndView("fontend/thankyou");
        Customer c = new Customer();
        model.addObject("c", c);
        if (customerModel.checkEmail(email)) {
            c = customerModel.getCustomerByEmail(email);
            String new_pass = Common.getRandomString(30);
            Customer cust = new Customer();
            cust.setCustomerId(c.getCustomerId());
            cust.setPasswordNew(new_pass);
            boolean updatePass = customerModel.updatePassword(cust);
            if (updatePass) {
                EmailUtil.sendMail(email, "Change password successfully", "<p>Dear " + c.getName() + "</p><p>We received a request to change your password.</p> <p>First, we give you a random security password like this: </p><p><strong>" + new_pass + "</strong></p><p>Then you use the above password to log in and change the new password which is your own.</p><p>Now !!!</p><br><i>Thank you for trusting the service!</i>");
                return "true";
            }
        }
        return "false";
    }
}
