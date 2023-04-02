package model;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Message {
    private int messageId;
    private String title;
    private String content;
    private String datePosted;
    public Message() {
    	
    }
    public Message(String title, String content,int id,String dt) {
        this.title = title;
        this.content = content;
        this.messageId =id;
        this.datePosted=dt;
    }
    public Message(String title, String content,int id) {
        this.title = title;
        this.content = content;
        this.messageId =id;
        
    }

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
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

    public String getDatePosted() {
        return datePosted;
    }

	public void setDatePosted(String datePosted2) {
        this.datePosted = datePosted2;
    }
}
