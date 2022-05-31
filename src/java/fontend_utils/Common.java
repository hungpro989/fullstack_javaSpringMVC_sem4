/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_utils;

import fontend_entities.Product;
import fontend_model.ProductModel;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Currency;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class Common {

    // chuyển từ kiểu float định dạnh tiền việt
    public static String formatNumber(float number) {
        if (number < 1000) {
            return String.valueOf(number);
        }
        try {
            NumberFormat formatter = new DecimalFormat("###,###");
            String resp = formatter.format(number);
            resp = resp.replaceAll(",", ".");
            return resp;
        } catch (Exception e) {
            return "";
        }
    }

    /**
     * chuyển từ chuỗi có định dạng tiền ex: 1.000.000 sang float -> 1000000
     *
     * @param price
     * @return
     */

    public static String fomatMonney(float price) {
        Locale locale = new Locale("vi", "VN");
        Currency currency = Currency.getInstance("VND");

        DecimalFormatSymbols df = DecimalFormatSymbols.getInstance(locale);
        df.setCurrency(currency);
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
        numberFormat.setCurrency(currency);
        return numberFormat.format(price);
    }

    public static float convertToFloat(String number) {
        float result = 0;

        return Float.parseFloat(number.replaceAll("[.]", ""));
    }

    public static int convertToInt(String number) {
        int result = 0;

        return Integer.parseInt(number);
    }

    public static int runDom() {
        return new Random().nextInt(9999 - 1000) + 1000;
    }

    public static String getRandomString(int length) {
        char[] chars = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRST!@#$%^&*()-_".toCharArray();

        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            char c = chars[random.nextInt(chars.length)];
            sb.append(c);
        }
        String randomStr = sb.toString();

        return randomStr;
    }
    
}
