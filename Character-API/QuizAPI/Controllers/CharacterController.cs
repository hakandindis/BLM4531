using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using QuizAPI.Models;

namespace QuizAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CharacterController : ControllerBase
    {

        private static List<Character> characters = new List<Character> {
                new Character {
                    Id = 1,
                    Name = "Spider Man",
                    Url ="test"
                },
                new Character {
                    Id = 2,
                    Name = "Spider2 Man",
                    Url ="test"
                }
            };

        private readonly DataContext context;

        public CharacterController(DataContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public async Task<ActionResult<List<Character>>> Get()
        {
            return Ok(await context.Characters.ToListAsync());
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Character>> Get(int id)
        {
            var hero = await context.Characters.FindAsync(id);
            if (hero == null)
            {
                return BadRequest("Hero not found");
            }
            else
            {
                return Ok(hero);

            }
        }

        [HttpPost]
        public async Task<ActionResult<List<Character>>> AddCharacter(Character hero)
        {
            context.Characters.Add(hero);
            await context.SaveChangesAsync();

            return Ok(await context.Characters.ToListAsync());

        }

        [HttpPut]
        public async Task<ActionResult<List<Character>>> UpdateCharacter(Character request)
        {
            var character = characters.Find(h => h.Id == request.Id);
            if (character == null)
            {
                return BadRequest("Hero not found");
            }
            else
            {
                character.Name = request.Name;
                character.Url = request.Url;

                return Ok(character);

            }

        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<List<Character>>> Delete(int id)
        {
            var character = characters.Find(h => h.Id == id);
            if (character == null)
            {
                return BadRequest("Hero not found");
            }
            else
            {
                characters.Remove(character);
                return Ok(characters);

            }
        }

    }
}