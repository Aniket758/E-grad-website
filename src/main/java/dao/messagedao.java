package dao;

import java.sql.*;
import java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.Message;
import connection.DbCon;

public class messagedao {

    // Get all messages from the database
    public List<Message> getAllMessages() {
        List<Message> messages = new ArrayList<Message>();
        try {
            Connection conn = DbCon.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM message");

            SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss dd-MM-yyyy");

         
            while (rs.next()) {
                Message message = new Message();
                message.setMessageId(rs.getInt("id"));
                message.setTitle(rs.getString("title"));
                message.setContent(rs.getString("content"));
             // format the timestamp using the SimpleDateFormat object
                String formattedTimestamp = formatter.format(rs.getTimestamp("created_at"));
                message.setDatePosted(formattedTimestamp);
                

                
                messages.add(message);
            }
//            DbCon.closeConnection(conn);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return messages;
    }

    // Get a message by ID
//    public Message getMessageById(int id) {
//        Message message = null;
//        try {
//            Connection conn = DbCon.getConnection();
//            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM message WHERE id = ?");
//            stmt.setInt(1, id);
//            ResultSet rs = stmt.executeQuery();
//            if (rs.next()) {
//                message = new Message();
//                message.setMessageId(rs.getInt("id"));
//                message.setTitle(rs.getString("title"));
//                message.setContent(rs.getString("content"));
//                message.setDatePosted(rs.getDate("posted_at"));
//            }
//            DbCon.closeConnection(conn);
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//        return message;
//    }

    // Create a new message
//    public void createMessage(Message message) {
//        try {
//            Connection conn = DbCon.getConnection();
//            PreparedStatement stmt = conn.prepareStatement("INSERT INTO message (title, content, posted_at) VALUES (?, ?, ?)");
//            stmt.setString(1, message.getTitle());
//            stmt.setString(2, message.getContent());
//            stmt.setDate(3, new java.sql.Date(message.getDatePosted().getTime()));
//            stmt.executeUpdate();
//            DbCon.closeConnection(conn);
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//    }

    // Update an existing message
    /*
    public void updateMessage(Message message) {
        try {
            Connection conn = DbCon.getConnection();
            PreparedStatement stmt = conn.prepareStatement("UPDATE message SET title = ?, content = ?, posted_at = ? WHERE id = ?");
            stmt.setString(1, message.getTitle());
            stmt.setString(2, message.getContent());
            stmt.setDate(3, new java.sql.Date(message.getDatePosted().getTime()));
            stmt.setInt(4, message.getMessageId());
            stmt.executeUpdate();
            DbCon.closeConnection(conn);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    */
    public void addMessage(Message message) throws SQLException {
        String sql = "INSERT INTO message (title, content, user_id) VALUES (?, ?, ?)";
        Connection conn = DbCon.getConnection();
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, message.getTitle());
            stmt.setString(2, message.getContent());
            stmt.setInt(3, message.getMessageId());
            
//            stmt.setTimestamp(4, new Timestamp(message.getDatePosted().getTime()));
            stmt.executeUpdate();
        }
    }

    // Delete a message by ID
    public void deleteMessage(int id) {
        try {
            Connection conn = DbCon.getConnection();
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM message WHERE id = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            DbCon.closeConnection(conn);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
