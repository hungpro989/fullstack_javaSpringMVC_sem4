/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_controller;

import fontend_entities.Banner;
import fontend_entities.Blog;
import fontend_entities.Category;
import fontend_entities.Customer;
import fontend_entities.Delivery;
import fontend_entities.ImageLink;
import fontend_entities.LevelUser;
import fontend_entities.MailCustomer;
import fontend_entities.Message;
import fontend_entities.Order;
import fontend_entities.OrderDetail;
import fontend_entities.PaymentType;
import fontend_entities.Product;

import fontend_entities.Provider;
import fontend_entities.SendEmail;
import fontend_entities.User;
import fontend_model.BannerModel;
import fontend_model.BlogModel;
import fontend_model.CategoryModel;
import fontend_model.CustomerModel;
import fontend_model.DeliveryModel;
import fontend_model.HomeModel;
import fontend_model.LevelUserModel;
import fontend_model.MailCustomerModel;
import fontend_model.MessageModel;
import fontend_model.OrderDetailModel;
import fontend_model.OrderModel;
import fontend_model.PaymentTypeModel;
import fontend_model.ProductModel;
import fontend_model.ProviderModel;
import fontend_model.UserModel;
import fontend_utils.EmailUtil;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author hungp
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    private CustomerModel customerModel;
    private OrderModel orderModel;
    private OrderDetailModel orderDetailModel;
    private PaymentTypeModel paymentTypeModel;
    private DeliveryModel deliveryModel;
    private HomeModel homeModel;
    private ProductModel productModel;
    private CategoryModel categoryModel;
    private ProviderModel providerModel;
    private BlogModel postModel;
    private BannerModel bannerModel;
    private UserModel userModel;
    private MailCustomerModel mailCustomerModel;
    private LevelUserModel levelUserModel;
    private MessageModel messageModel;

    public AdminController() {
        customerModel = new CustomerModel();
        orderModel = new OrderModel();
        orderDetailModel = new OrderDetailModel();
        paymentTypeModel = new PaymentTypeModel();
        deliveryModel = new DeliveryModel();
        homeModel = new HomeModel();
        productModel = new ProductModel();
        categoryModel = new CategoryModel();
        providerModel = new ProviderModel();
        postModel = new BlogModel();
        bannerModel = new BannerModel();
        userModel = new UserModel();
        mailCustomerModel = new MailCustomerModel();
        levelUserModel = new LevelUserModel();
        messageModel = new MessageModel();
        
    }
    
    @RequestMapping(value = "/list-mail")
    public ModelAndView listMail(HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/listmail");
            List<MailCustomer> listmail = mailCustomerModel.getAllMessage();
            model.getModelMap().put("listmail", listmail);
            return model;
        } else {
            return new ModelAndView("redirect:login.htm");
        }
    }
    @RequestMapping(value = "/mail-detail")
    public ModelAndView mailDetail(@RequestParam("Id") int id,HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/maildetail");
            MailCustomer mail = mailCustomerModel.getMailDetail(id);
            model.getModelMap().put("mail", mail);
            return model;
        } else {
            return new ModelAndView("redirect:login.htm");
        }
    }
    @RequestMapping(value = "/list-message")
    public ModelAndView listMessage(HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/listmessage");
            List<Message> listMessage = messageModel.getAllMessage();
            model.getModelMap().put("listMessage", listMessage);
            return model;
        } else {
            return new ModelAndView("redirect:login.htm");
        }
    }
    @RequestMapping(value = "/message-detail")
    public ModelAndView messageDetail(@RequestParam("Id") int id,HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/messagedetail");
            messageModel.updateMessageStatus(id);
            Message message = messageModel.getMessageById(id);
            model.getModelMap().put("message", message);
            return model;
        } else {
            return new ModelAndView("redirect:login.htm");
        }
    }
    @RequestMapping(value = "/send-each-email", method = RequestMethod.POST)
    public @ResponseBody String sendEachEmail(@RequestParam String email, @RequestParam String content,HttpSession session) throws MessagingException {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            if (email != null && content != null) {
                EmailUtil.sendMail(email, "Message reply from Furniture Store", content);
                MailCustomer mailcus = new MailCustomer();
                mailcus.setTitle("Message reply from Furniture Store");
                mailcus.setContent(content);
                mailcus.setCustomer(email);
                mailcus.setCountMail(1);
                mailcus.setCountMailSuccess(1);
                boolean result_mail = mailCustomerModel.insertMailCustomer(mailcus);
                if(result_mail){
                    return "1";
                }
            }
            return "false";
        } else {
            return "redirect:login.htm";
        }
    }
    @RequestMapping(value = "/send-email")
    public ModelAndView sendEmail(HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/sendemail");
            User u = new User();
            model.addObject("u", u);
            List<Customer> listCustomer = customerModel.getAllCustomer();
            model.getModelMap().put("listCustomer", listCustomer);
            return model;
        } else {
            return new ModelAndView("redirect:login.htm");
        }
    }

    @RequestMapping(value = "/send-email-process", method = RequestMethod.POST)
    @ResponseBody
    public String sendEmailProcess(@RequestParam(value = "listemail[]") List<String> listmail, @RequestParam String content, @RequestParam String title,HttpSession session) throws MessagingException {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            String titlel ="";
            titlel = title;
            int countListsuc = 0;
            int listCount = listmail.size();
            String listCu = String.join(",", listmail);
            if (listmail != null && content != null) {
                for (String listmailStr : listmail) {
                    String email = listmailStr;
                    EmailUtil.sendMail(email, titlel, content);
                    countListsuc = countListsuc+1;
                }
                MailCustomer mailcus = new MailCustomer();
                mailcus.setTitle(titlel);
                mailcus.setContent(content);
                mailcus.setCustomer(listCu);
                mailcus.setCountMail(listCount);
                mailcus.setCountMailSuccess(countListsuc);
                boolean result_mail = mailCustomerModel.insertMailCustomer(mailcus);
                if(result_mail){
                    String cc = String.valueOf(countListsuc);
                    return cc;
                }
            }
            return "false";
        } else {
            return "redirect:login.htm";
        }
    }

    @RequestMapping(value = "/login")
    public ModelAndView loginAdmin() {
        ModelAndView model = new ModelAndView("backend/login");
        User u = new User();
        model.addObject("u", u);
        return model;
    }

    @RequestMapping(value = "/processlogin")
    public @ResponseBody
    String processlogin(HttpSession session, ModelMap mm, HttpServletRequest request, RedirectAttributes ra, @RequestParam String username_login, @RequestParam String password_login) {
        ModelAndView model;
        User user = new User();
        user.setUserName(username_login);
        user.setPassword(password_login);
        boolean result = userModel.checkLoginUser(user);
        if (result) {
            model = new ModelAndView("redirect:home.htm");
            User u = userModel.getUserByUserName(user.getUserName());
            session.setAttribute("username", u.getUserName());
            session.setAttribute("image", u.getImages());
            return "true";
        } else {
            model = new ModelAndView("redirect:login.htm");
            return "false";
        }
    }

    @RequestMapping(value = "/logout-admin")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:login.htm";  //Where you go after logout here.
    }

    @RequestMapping(value = "/profile")
    public ModelAndView profileAdmin(HttpSession session, ModelMap mm, Model md) {
        User u = new User();
        md.addAttribute("u", u);
        ModelAndView model;
        String name = (String) session.getAttribute("username");
        if (name != null) {
            model = new ModelAndView("backend/profile");
            User user = userModel.getUserByUserName(name);
            model.getModelMap().put("profile", user);
            return model;
        } else {
            model = new ModelAndView("redirect:login.htm");
            return model;
        }
    }

    @RequestMapping(value = "/home")
    public ModelAndView homeAdmin(HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/home");
            int productTotalBuy = 0;
            float totalPrice = 0;
            int totalOrder = 0;
            int totalCustomer = 0;
            productTotalBuy = homeModel.getProductTotalBuy();
            totalPrice = homeModel.getTotalPrice();
            totalCustomer = homeModel.getTotalCustomer();
            totalOrder = homeModel.getTotalOrder();
            List<Order> listTopOrder = homeModel.getTopNewOrder();
            List<User> listUser = homeModel.getAllUser();
            List<Product> listTopProduct = homeModel.getTopProduct();
            model.getModelMap().put("productTotalBuy", productTotalBuy);
            model.getModelMap().put("totalCustomer", totalCustomer);
            model.getModelMap().put("totalPrice", totalPrice);
            model.getModelMap().put("totalOrder", totalOrder);
            model.getModelMap().put("listUser", listUser);
            model.getModelMap().put("listTopProduct", listTopProduct);
            model.getModelMap().put("listTopOrder", listTopOrder);
            return model;
        } else {
            ModelAndView model = new ModelAndView("redirect:login.htm");
            return model;
        }
    }

    @RequestMapping(value = "/listproduct")
    public ModelAndView listProductAdmin(HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/listproduct");
            List<Product> listAllProduct = productModel.getAllProduct();
            model.getModelMap().put("listAllProduct", listAllProduct);
            return model;
        } else {
            ModelAndView model = new ModelAndView("redirect:login.htm");
            return model;
        }
    }

    @RequestMapping(value = "/productdetail")
    public ModelAndView productDetailAdmin(@RequestParam("Id") int id, HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/productdetail");
            Product product = productModel.getProductById(id);
            List<Category> listCategory = categoryModel.getAllCategory();
            List<Provider> listProvider = providerModel.getAllProvider();
            List<ImageLink> listImage = productModel.getImageProduct(id);//danh sách ảnh liên quan, ảnh mô tả cho sản phảm
            model.getModelMap().put("product", product);
            model.getModelMap().put("listImage", listImage);
            model.getModelMap().put("listProvider", listProvider);
            model.getModelMap().put("listCategory", listCategory);
            return model;
        } else {
            ModelAndView model = new ModelAndView("redirect:login.htm");
            return model;
        }
    }

    @RequestMapping(value = "/product-update", method = RequestMethod.POST)
    public @ResponseBody
    String updateProduct(@RequestParam int productId,
            @RequestParam String name,
            @RequestParam String content,
            @RequestParam String images,
            @RequestParam String view,
            @RequestParam String buyitem,
            @RequestParam String quantity,
            @RequestParam String priceinput,
            @RequestParam String priceoutput,
            @RequestParam String discount,
            @RequestParam String categoryId,
            @RequestParam String providerId,
            @RequestParam String status,
            @RequestParam String showhome,
            HttpServletRequest request, HttpSession session) {

        String name_sesion = (String) session.getAttribute("username");
        if (name_sesion != null) {
            Product product = new Product();
            product.setProductId(productId);
            product.setName(name);
            product.setContentDetail(content);
            product.setImages(images);
            product.setView(Integer.parseInt(view));
            product.setBuyItem(Integer.parseInt(buyitem));
            product.setQuantity(Integer.parseInt(quantity));
            product.setPriceInput(Float.parseFloat(priceinput));
            product.setPriceOutput(Float.parseFloat(priceoutput));
            product.setDiscount(Float.parseFloat(discount));
            product.setCategoryId(Integer.parseInt(categoryId));
            product.setProviderId(Integer.parseInt(providerId));
            product.setStatus(Boolean.parseBoolean(status));
            product.setShowHome(Boolean.parseBoolean(showhome));
            if (productModel.updateProduct(product)) {
                return "true";
            }
            return "false";
        } else {
            return "redirect:login.htm";
        }
    }

    @RequestMapping(value = "/create-product")
    public ModelAndView createProduct(HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/createproduct");
            List<Category> listCategory = categoryModel.getAllCategory();
            List<Provider> listProvider = providerModel.getAllProvider();
            model.getModelMap().put("listProvider", listProvider);
            model.getModelMap().put("listCategory", listCategory);
            return model;
        } else {
            ModelAndView model = new ModelAndView("redirect:login.htm");
            return model;
        }
    }

    @RequestMapping(value = "/create-product-process", method = RequestMethod.POST)
    public @ResponseBody
    String insertProduct(@RequestParam String name,
            @RequestParam String content,
            @RequestParam String images,
            @RequestParam String quantity,
            @RequestParam String priceinput,
            @RequestParam String priceoutput,
            @RequestParam String discount,
            @RequestParam String categoryId,
            @RequestParam String providerId,
            HttpServletRequest request, HttpSession session) {
        String name_session = (String) session.getAttribute("username");
        if (name != null) {
            Product product = new Product();
            product.setName(name);
            product.setContentDetail(content);
            product.setImages(images);
            product.setQuantity(Integer.parseInt(quantity));
            product.setPriceInput(Float.parseFloat(priceinput));
            product.setPriceOutput(Float.parseFloat(priceoutput));
            product.setDiscount(Float.parseFloat(discount));
            product.setCategoryId(Integer.parseInt(categoryId));
            product.setProviderId(Integer.parseInt(providerId));
            if (productModel.insertProduct(product)) {
                return "true";
            }
            return "false";
        } else {
            return "redirect:login.htm";
        }
    }
    @RequestMapping(value = "/delete-product", method = RequestMethod.POST)
    public @ResponseBody String deleteProduct(@RequestParam int productid, HttpSession session) {
        String name_sesion = (String) session.getAttribute("username");
        if (name_sesion != null) {
            ModelAndView model = new ModelAndView("backend/categoryproduct");
            boolean result = productModel.updateProductStatus(productid);
            if(result){
                return "true";
            }
            return "false";
        } else {
            return "redirect:login.htm";
        }
    }

    @RequestMapping(value = "/list-category-product")
    public ModelAndView categoryProductAdmin(HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/listcategory");
            List<Category> listAllCategory = categoryModel.getAllCategory();
            model.getModelMap().put("listAllCategory", listAllCategory);
            return model;
        } else {
            ModelAndView model = new ModelAndView("redirect:login.htm");
            return model;
        }
    }
    @RequestMapping(value = "/categorydetail")
    public ModelAndView categoryDetail(@RequestParam("Id") int id, HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/categorydetail");
            Category category = categoryModel.getCategoryByCategoryId(id);
            List<Product> listProduct = productModel.getAllProductByCategory(id);
            
            model.getModelMap().put("category", category);
            model.getModelMap().put("listProduct", listProduct);
            return model;
        } else {
            ModelAndView model = new ModelAndView("redirect:login.htm");
            return model;
        }
    }
    @RequestMapping(value = "/category-update", method = RequestMethod.POST)
    public @ResponseBody String updateCategory(@RequestParam int categoryId,
            @RequestParam String name,
            @RequestParam String descriptions,
            @RequestParam int parentid,
            @RequestParam int displaynumber,
            @RequestParam String status,
            HttpServletRequest request, HttpSession session) {

        String name_sesion = (String) session.getAttribute("username");
        if (name_sesion != null) {
            Category category = new Category();
            category.setCategoryId(categoryId);
            category.setName(name);
            category.setDescriptions(descriptions);
            category.setParentId(parentid);
            category.setDisplayNumber(displaynumber);
            category.setStatus(Boolean.parseBoolean(status));
            if (categoryModel.updateCategory(category)) {
                return "true";
            }
            return "false";
        } else {
            return "redirect:login.htm";
        }
    }

    @RequestMapping(value = "/listuser")
    public ModelAndView listUserAdmin(HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/listuser");
            List<User> listUser = homeModel.getAllUser();
            model.getModelMap().put("listUser", listUser);
            return model;
        } else {
            ModelAndView model = new ModelAndView("redirect:login.htm");
            return model;
        }
    }

    @RequestMapping(value = "/listcustomer")
    public ModelAndView listCustomerAdmin(HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/listcustomer");
            List<Customer> listCustomer = customerModel.getAllCustomer();
            model.getModelMap().put("listCustomer", listCustomer);
            return model;
        } else {
            ModelAndView model = new ModelAndView("redirect:login.htm");
            return model;
        }
    }
    @RequestMapping(value = "/customer-detail")
    public ModelAndView customerDetail(HttpSession session,@RequestParam("Id") int id) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/customerdetail");
            List<Customer> listCustomer = customerModel.getAllCustomer();
            Customer customer = customerModel.getCustomerByCustomerId(id);
            List<Order> listOrder = orderModel.getOrderByUserId(id);
            
            model.getModelMap().put("listOrder", listOrder);
            model.getModelMap().put("customer", customer);
            return model;
        } else {
            ModelAndView model = new ModelAndView("redirect:login.htm");
            return model;
        }
    }
    
    @RequestMapping(value = "/listorder")
    public ModelAndView getAllOrder(HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/listorder");
            List<Order> listOrder = orderModel.getAllOrder();
            List<Delivery> delivery = deliveryModel.getAllDelivery();
            model.getModelMap().put("listOrder", listOrder);
            model.getModelMap().put("listDelivery", delivery);
            return model;

        } else {
            ModelAndView model = new ModelAndView("redirect:login.htm");
            return model;
        }
    }

    @RequestMapping(value = "/orderdetail")
    public ModelAndView orderDetailAdmin(@RequestParam("Id") int id, HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {

            ModelAndView model;
            List<OrderDetail> orderDetail = orderDetailModel.getOrderDetailById(id);
            List<PaymentType> paymentType = paymentTypeModel.getALlPaymentType();
            List<Delivery> delivery = deliveryModel.getAllDelivery();
            model = new ModelAndView("backend/orderdetail");
            Order order = orderModel.getOrdeDetailrByOrderId(id);
            Customer cus = customerModel.getCustomerByCustomerId(order.getCustomerId());
            model.getModelMap().put("cus", cus);
            model.getModelMap().put("order", order);
            model.getModelMap().put("listOrderDetail", orderDetail);
            model.getModelMap().put("listPaymentType", paymentType);
            model.getModelMap().put("listDelivery", delivery);
            return model;
        } else {
            ModelAndView model = new ModelAndView("redirect:login.htm");
            return model;
        }
    }

    @RequestMapping(value = "/sendOrder", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView sendOrder(@RequestParam int orderId, @RequestParam int deliveryId, HttpServletRequest request, HttpSession session) {
        ModelAndView model;
        String name = (String) session.getAttribute("username");
        if (name != null) {
            model = new ModelAndView("backend/listorder");
            Order order = new Order();
            order.setOrderId(orderId);
            order.setDeliveryId(deliveryId);
            orderModel.sendOrderToDelivery(order);
//      cap nhat sl sp
            List<OrderDetail> listOrderDetail = orderDetailModel.getOrderDetailById(orderId);
            for (OrderDetail listOd : listOrderDetail) {
                Product pro = new Product();
                pro.setProductId(listOd.getProductId());
                pro.setQuantity(listOd.getQuantity());
                productModel.updateQuantity(pro);
                productModel.updateBuyItem(pro);
            }
            return model;
        } else {
            model = new ModelAndView("redirect:login.htm");
            return model;
        }

    }

    @RequestMapping(value = "/listbanner")
    public ModelAndView listBannerAdmin(HttpSession session) {
        ModelAndView model;
        String name = (String) session.getAttribute("username");
        if (name != null) {
            model = new ModelAndView("backend/listbanner");
            List<Banner> listBanner = bannerModel.getAllBanner();
            model.getModelMap().put("listBanner", listBanner);
            return model;
        } else {
            return new ModelAndView("redirect:login.htm");
        }
    }
    @RequestMapping(value = "/delete-banner", method = RequestMethod.POST)
    public @ResponseBody String deleteBanner(@RequestParam int bannerid, HttpSession session) {
        String name_sesion = (String) session.getAttribute("username");
        if (name_sesion != null) {
            boolean result = bannerModel.updateBannerStatus(bannerid);
            if(result){
                return "true";
            }
            return "false";
        } else {
            return "redirect:login.htm";
        }
    }

    @RequestMapping(value = "/listpost")
    public ModelAndView listPostAdmin(HttpSession session) {
        ModelAndView model;
        String name = (String) session.getAttribute("username");
        if (name != null) {
            model = new ModelAndView("backend/listpost");
            List<Blog> listPost = postModel.getAllBlog();
            model.getModelMap().put("listPost", listPost);
            return model;

        } else {
            return model = new ModelAndView("redirect:login.htm");
        }
    }
    @RequestMapping(value = "/delete-post", method = RequestMethod.POST)
    public @ResponseBody String deletePost(@RequestParam int postid, HttpSession session) {
        String name_sesion = (String) session.getAttribute("username");
        if (name_sesion != null) {
            boolean result = postModel.updatePostStatus(postid);
            if(result){
                return "true";
            }
            return "false";
        } else {
            return "redirect:login.htm";
        }
    }

    @RequestMapping(value = "/listprovider")
    public ModelAndView listProviderAdmin(HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/listprovider");
            List<Provider> listProvider = providerModel.getAllProvider();
            model.getModelMap().put("listProvider", listProvider);
            return model;
        } else {
            return new ModelAndView("redirect:login.htm");
        }
    }
    
    @RequestMapping(value = "/delete-provider", method = RequestMethod.POST)
    public @ResponseBody String deleteProvider(@RequestParam int providerid, HttpSession session) {
        String name_sesion = (String) session.getAttribute("username");
        if (name_sesion != null) {
            boolean result = providerModel.updateProviderStatus(providerid);
            if(result){
                return "true";
            }
            return "false";
        } else {
            return "redirect:login.htm";
        }
    }
    
    
    
    @RequestMapping(value = "/provider-detail")
    public ModelAndView providerDetail(@RequestParam("Id") int id, HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/providerdetail");
            Provider provider = providerModel.getProviderById(id);
            List<Product> listProduct = productModel.getAllProductByProvider(id);
            
            model.getModelMap().put("provider", provider);
            model.getModelMap().put("listProduct", listProduct);
            return model;
        } else {
            ModelAndView model = new ModelAndView("redirect:login.htm");
            return model;
        }
    }
    
//    user
    @RequestMapping(value = "/create-user")
    public ModelAndView createUser(HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/createuser");
            List<LevelUser> listLevelUser= levelUserModel.getAllLevel();
            List<User> listUser = homeModel.getAllUser();
            model.getModelMap().put("listUser", listUser);
            model.getModelMap().put("listLevelUser", listLevelUser);
            return model;
        } else {
            ModelAndView model = new ModelAndView("redirect:login.htm");
            return model;
        }
    }
    @RequestMapping(value = "/create-user-process")
    public @ResponseBody String createUserProcess(HttpSession session,@RequestParam String name,@RequestParam String username,@RequestParam String password,@RequestParam String phone,@RequestParam String email,@RequestParam String address,HttpServletRequest request) {
        String name_session = (String) session.getAttribute("username");
        if (name_session != null) {
            User user = new User();
            user.setName(name);
            user.setUserName(username);
            user.setPassword(password);
            user.setPhone(phone);
            user.setEmail(email);
            user.setAddress(address);
            if(userModel.checkUserName(username)){
                return "false_username";
            }else if(userModel.checkEmail(email)){
                return "false_email";
            }else if(userModel.checkPhone(phone)){
                return "false_phone";     
            }else{
                boolean result = userModel.insertUser(user);
                if(result){
                    return "true";
                }
            }
            return "false";
        } else {
            return "redirect:login.htm";
        }
    }
    @RequestMapping(value = "/update-user")
    public ModelAndView updateUser(HttpSession session) {
        String name = (String) session.getAttribute("username");
        if (name != null) {
            ModelAndView model = new ModelAndView("backend/updateuser");
            List<LevelUser> listLevelUser= levelUserModel.getAllLevel();
            List<User> listUser = homeModel.getAllUser();
            model.getModelMap().put("listUser", listUser);
            model.getModelMap().put("listLevelUser", listLevelUser);
            return model;
        } else {
            ModelAndView model = new ModelAndView("redirect:login.htm");
            return model;
        }
    }
//    @RequestMapping(value = "/create-product-process", method = RequestMethod.POST)
//    public @ResponseBody
//    String insertProduct(@RequestParam String name,
//            @RequestParam String content,
//            @RequestParam String images,
//            @RequestParam String quantity,
//            @RequestParam String priceinput,
//            @RequestParam String priceoutput,
//            @RequestParam String discount,
//            @RequestParam String categoryId,
//            @RequestParam String providerId,
//            HttpServletRequest request, HttpSession session) {
//        String name_session = (String) session.getAttribute("username");
//        if (name != null) {
//            Product product = new Product();
//            product.setName(name);
//            product.setContentDetail(content);
//            product.setImages(images);
//            product.setQuantity(Integer.parseInt(quantity));
//            product.setPriceInput(Float.parseFloat(priceinput));
//            product.setPriceOutput(Float.parseFloat(priceoutput));
//            product.setDiscount(Float.parseFloat(discount));
//            product.setCategoryId(Integer.parseInt(categoryId));
//            product.setProviderId(Integer.parseInt(providerId));
//            if (productModel.insertProduct(product)) {
//                return "true";
//            }
//            return "false";
//        } else {
//            return "redirect:login.htm";
//        }
//    }
//    @RequestMapping(value = "/delete-product", method = RequestMethod.POST)
//    public @ResponseBody String deleteProduct(@RequestParam int productid, HttpSession session) {
//        String name_sesion = (String) session.getAttribute("username");
//        if (name_sesion != null) {
//            ModelAndView model = new ModelAndView("backend/categoryproduct");
//            boolean result = productModel.updateProductStatus(productid);
//            if(result){
//                return "true";
//            }
//            return "false";
//        } else {
//            return "redirect:login.htm";
//        }
//    }
}
