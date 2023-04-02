package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.IwtUser;

public class IwtUserDao {
    private Connection connection;

    public IwtUserDao(Connection connect) {
    	super();
        this.connection = connect;
        if(connection==null)
        	System.out.println("here is problem");
    }

    public boolean createUser(IwtUser user) throws SQLException {
        boolean result = false;
        String sql = "INSERT INTO iwt_users (first_name, last_name, email, password, date_of_birth, mobile_number, gender, address, state, city, country, pincode, course_applied) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getFirstName());
            statement.setString(2, user.getLastName());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword());
            statement.setDate(5, new java.sql.Date(user.getDateOfBirth().getTime()));
            statement.setString(6, user.getMobileNumber());
            statement.setString(7, user.getGender());
            statement.setString(8, user.getAddress());
            statement.setString(9, user.getState());
            statement.setString(10, user.getCity());
            statement.setString(11, user.getCountry());
            statement.setString(12, user.getPincode());
            statement.setString(13, user.getCourseApplied());
            result = (statement.executeUpdate() > 0);
            
        }
        return result;
    }

    public boolean updateUser(IwtUser user) throws SQLException {
        boolean result = false;
        String sql = "UPDATE iwt_users SET first_name = ?, last_name = ?, email = ?, password = ?, date_of_birth = ?, mobile_number = ?, gender = ?, address = ?, state = ?, city = ?, country = ?, pincode = ?, course_applied = ? WHERE email = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getFirstName());
            statement.setString(2, user.getLastName());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword());
            statement.setDate(5, new java.sql.Date(user.getDateOfBirth().getTime()));
            statement.setString(6, user.getMobileNumber());
            statement.setString(7, user.getGender());
            statement.setString(8, user.getAddress());
            statement.setString(9, user.getState());
            statement.setString(10, user.getCity());
            statement.setString(11, user.getCountry());
            statement.setString(12, user.getPincode());
            statement.setString(13, user.getCourseApplied());
            statement.setString(14, user.getEmail());
            result = (statement.executeUpdate() > 0);
        }
        return result;
    }

    public IwtUser getUserByEmail(String email) throws SQLException {
        IwtUser user = null;
        String sql = "SELECT * FROM iwt_users WHERE email = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String firstName = resultSet.getString("first_name");
                String lastName = resultSet.getString("last_name");
                String password = resultSet.getString("password");
                Date dateOfBirth = resultSet.getDate("date_of_birth");
                String mobileNumber = resultSet.getString("mobile_number");
                String gender = resultSet.getString("gender");
                String address = resultSet.getString("address");
                String state = resultSet.getString("state");
                String city = resultSet.getString("city");
                String country = resultSet.getString("country");
                String pincode = resultSet.getString("pincode");
                String courseApplied = resultSet.getString("course_applied");
                user = new IwtUser(firstName, lastName, email, password, dateOfBirth, mobileNumber, gender, address, state, city, country, pincode, courseApplied);
            }
        }
        return user;
    }

    public List<IwtUser> getAllUsers() throws SQLException {
        List<IwtUser> users = new ArrayList<>();
        String sql = "SELECT * FROM iwt_users";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String firstName = resultSet.getString("first_name");
                String lastName = resultSet.getString("last_name");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                Date dateOfBirth = resultSet.getDate("date_of_birth");
                String mobileNumber = resultSet.getString("mobile_number");
                String gender = resultSet.getString("gender");
                String address = resultSet.getString("address");
                String state = resultSet.getString("state");
                String city = resultSet.getString("city");
                String country = resultSet.getString("country");
                String pincode = resultSet.getString("pincode");
                String courseApplied = resultSet.getString("course_applied");
                IwtUser user = new IwtUser(firstName, lastName, email, password, dateOfBirth, mobileNumber, gender, address, state, city, country, pincode, courseApplied);
                users.add(user);
            }
        }
        return users;
    }

    public boolean deleteUser(String email) throws SQLException {
        boolean result = false;
        String sql = "DELETE FROM users WHERE email = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            result = (statement.executeUpdate() > 0);
        }
        return result;
    }
}

