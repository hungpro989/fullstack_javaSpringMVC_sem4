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
public class MailCustomer {
    private int mailId;
    private String title;
    private String content;
    private String customer;
    private int countMail;
    private int countMailSuccess;
    private String created;
    private boolean status;

    public int getMailId() {
        return mailId;
    }

    public void setMailId(int mailId) {
        this.mailId = mailId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }


    public int getCountMail() {
        return countMail;
    }

    public void setCountMail(int countMail) {
        this.countMail = countMail;
    }

    public int getCountMailSuccess() {
        return countMailSuccess;
    }

    public void setCountMailSuccess(int countMailSuccess) {
        this.countMailSuccess = countMailSuccess;
    }

    public String getCreated() {
        return created;
    }

    public void setCreated(String created) {
        this.created = created;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
}
