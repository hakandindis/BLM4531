namespace QuizAPI.Models;
using System.Text.Json.Serialization;
public class User
{
    public int Id { get; set; }
    public string Username { get; set; }
    public string PassHash { get; set; }

}

