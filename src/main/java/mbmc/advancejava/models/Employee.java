package mbmc.advancejava.models;

public class Employee {
    private int Id;
    private String Name;
    private String Gender;
    private String Department;
    private int Salary;
    private String Address;
    private byte[] ProfilePic;

    public Employee(){}

    public Employee(int id, String name, String gender, String department, int salary, String address, byte[] profilePic) {
        Id = id;
        Name = name;
        Gender = gender;
        Department = department;
        Salary = salary;
        Address = address;
        ProfilePic = profilePic;
    }

    public Employee(String name, String gender, String department, int salary, String address, byte[] profilePic) {
        Name = name;
        Gender = gender;
        Department = department;
        Salary = salary;
        Address = address;
        ProfilePic = profilePic;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String gender) {
        Gender = gender;
    }

    public String getDepartment() {
        return Department;
    }

    public void setDepartment(String department) {
        Department = department;
    }

    public int getSalary() {
        return Salary;
    }

    public void setSalary(int salary) {
        Salary = salary;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public byte[] getProfilePic() {
        return ProfilePic;
    }

    public void setProfilePic(byte[] profilePic) {
        ProfilePic = profilePic;
    }
}
