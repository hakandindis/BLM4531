using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using QuizAPI.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace QuizAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly DataContext context;

        public AuthController(DataContext context)
        {
            this.context = context;
        }

        [HttpPost]
        public async Task<String?> Login([FromBody] LocalUser lu)
        {
            var userTryingToLogIn = context.Users.SingleOrDefault(u => u.Username == lu.Username && u.PassHash == lu.Password);
            if (userTryingToLogIn == null)
            {
                return null;
            }

            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes("hakandindishakandindishakandindishakandindis");
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name,userTryingToLogIn.Username),     
                }),
                Expires = DateTime.UtcNow.AddDays(30),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha384Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            string s = new JwtSecurityTokenHandler().WriteToken(token);

            return s;
        }






    }
}