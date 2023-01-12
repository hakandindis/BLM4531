namespace QuizAPI.Models;
using System.Text.Json.Serialization;
public class Question
{
    public int Id { get; set; }
    public string Category { get; set; }
    public string Answer { get; set; }
    public string userAnswer { get; set; }
    public string optionA { get; set; }
    public string optionB { get; set; }
    public string optionC { get; set; }
    public string optionD { get; set; }




}

