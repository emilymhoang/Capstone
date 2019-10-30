using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Login
/// </summary>
public class Login
{
    private int accountID;
    private String email;
    private String password;

    public Login(String email, String password)
    {
        setAccountID(accountID);
        setEmail(email);
        setPassword(password);
    }

    public void setAccountID(int accountID)
    {
        this.accountID = accountID;
    }

    public int getAccountID()
    {
        return accountID;
    }

    public void setEmail(string email)
    {
        this.email = email;
    }

    public String getEmail()
    {
        return email;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public string getPassword()
    {
        return password;
    }
}