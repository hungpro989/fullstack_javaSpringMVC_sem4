/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_entities;

/**
 *
 * @author ADMIN
 */
public class SendEmail {
    private int sendEmailId;
    private String content;
    private String listEmail;

    public int getSendEmailId() {
        return sendEmailId;
    }

    public void setSendEmailId(int sendEmailId) {
        this.sendEmailId = sendEmailId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getListEmail() {
        return listEmail;
    }

    public void setListEmail(String listEmail) {
        this.listEmail = listEmail;
    }
    
    
}
