package model;
import java.util.Date;

public class Reply {
    private int UserId;
    private int messageId;
    private String replyContent;
    private String replyDate;
    public Reply() {
  
    }

    public Reply(int messageId, String replyContent,int UserId) {
        this.UserId = UserId;
        this.messageId = messageId;
        this.replyContent = replyContent;
    }
    
    

    
    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public String getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(String replyDate) {
        this.replyDate = replyDate;
    }
}
