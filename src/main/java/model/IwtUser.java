package model;

import java.util.Date;

public class IwtUser {
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private Date dateOfBirth;
    private String mobileNumber;
    private String gender;
    private String address;
    private String state;
    private String city;
    private String country;
    private String pincode;
    private String courseApplied;
    
    // Constructor
    public IwtUser(String firstName, String lastName, String email, String password, Date dateOfBirth,
                String mobileNumber, String gender, String address, String state, String city,
                String country, String pincode, String courseApplied) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.dateOfBirth = dateOfBirth;
        this.mobileNumber = mobileNumber;
        this.gender = gender;
        this.address = address;
        this.state = state;
        this.city = city;
        this.country = country;
        this.pincode = pincode;
        this.courseApplied = courseApplied;
    }
    
    // Getters and setters for each field
    public String getFirstName() {
        return firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String getLastName() {
        return lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public Date getDateOfBirth() {
        return dateOfBirth;
    }
    
    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    
    public String getMobileNumber() {
        return mobileNumber;
    }
    
    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }
    
    public String getGender() {
        return gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    
    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getState() {
        return state;
    }
    
    public void setState(String state) {
        this.state = state;
    }
    
    public String getCity() {
        return city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }
    
    public String getCountry() {
        return country;
    }
    
    public void setCountry(String country) {
        this.country = country;
    }
    
    public String getPincode() {
        return pincode;
    }
    
    public void setPincode(String pincode) {
        this.pincode = pincode;
    }
    
    public String getCourseApplied() {
        return courseApplied;
    }
    
    public void setCourseApplied(String courseApplied) {
        this.courseApplied = courseApplied;
    }
}
