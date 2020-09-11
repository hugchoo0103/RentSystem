package pojo;

public class login {
    private int idLogin;
    private String userName;
    private String password;
    private int power;

    public int getIdLogin() {
        return idLogin;
    }

    public void setIdLogin(int idLogin) {
        this.idLogin = idLogin;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }

    @Override
    public String toString() {
        return "login{" +
                "idLogin=" + idLogin +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", power=" + power +
                '}';
    }
}
