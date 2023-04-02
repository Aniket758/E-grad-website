package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Reply;
import connection.DBUtil;

public class ReplyDao {

	// Get a list of replies for a given message ID
	public static List<Reply> getRepliesByMessageId(int messageId) throws SQLException {
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Reply> replies = new ArrayList<Reply>();

		try {
			stmt = conn.prepareStatement("SELECT * FROM reply WHERE message_id = ?");
			stmt.setInt(1, messageId);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Reply reply = new Reply();
				reply.setReplyId(rs.getInt("id"));
				reply.setReplyContent(rs.getString("content"));
				reply.setReplyDate(rs.getTimestamp("created_at"));
				reply.setMessageId(rs.getInt("message_id"));
				replies.add(reply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//            DBUtil.closeResultSet(rs);
//            DBUtil.closeStatement(stmt);
			DBUtil.closeConnection(conn);
		}

		return replies;
	}

	// Add a new reply to the database
	public static boolean addReply(Reply reply) throws SQLException {
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		int rowsAffected = 0;

		try {
			stmt = conn.prepareStatement("INSERT INTO reply (content, message_id) VALUES (?,?)");
			stmt.setString(1, reply.getReplyContent());
//            stmt.setTimestamp(2, reply.getReplyDate());
			stmt.setInt(3, reply.getMessageId());
			rowsAffected = stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//            DBUtil.closeStatement(stmt);
			DBUtil.closeConnection(conn);
		}

		return rowsAffected > 0;
	}
}
