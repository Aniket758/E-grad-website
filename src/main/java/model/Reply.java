package model;
import java.util.Date;

public class Reply {
    private int replyId;
    private int messageId;
    private String replyContent;
    private Date replyDate;
    public Reply() {
  
    }

    public Reply(int replyId, int messageId, String replyContent, Date replyDate) {
        this.replyId = replyId;
        this.messageId = messageId;
        this.replyContent = replyContent;
        this.replyDate = replyDate;
    }

    public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
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

    public Date getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(Date replyDate) {
        this.replyDate = replyDate;
    }
}
