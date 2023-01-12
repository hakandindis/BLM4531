using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using QuizAPI.Models;

namespace QuizAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuestionController : ControllerBase
    {

        private static List<Question> questions = new List<Question> {

            };
        private readonly DataContext context;

        public QuestionController(DataContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public async Task<ActionResult<List<Question>>> Get()
        {
            return Ok(await context.Questions.ToListAsync());
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Question>> Get(int id)
        {
            var question = await context.Questions.FindAsync(id);
            if (question == null)
            {
                return BadRequest("Hero not found");
            }
            else
            {
                return Ok(question);

            }
        }

        [HttpPost]
        public async Task<ActionResult<List<Question>>> AddQuestion(Question hero)
        {
            context.Questions.Add(hero);
            await context.SaveChangesAsync();

            return Ok(await context.Questions.ToListAsync());

        }

        [HttpPut]
        public async Task<ActionResult<List<Question>>> UpdateQuestion(Question request)
        {
            var Question = questions.Find(h => h.Id == request.Id);
            if (Question == null)
            {
                return BadRequest("Hero not found");
            }
            else
            {
                /* Question.Name = request.Name;
                 Question.Url = request.Url;

                 return Ok(Question);
                */
                return BadRequest("Hero not found");
            }

        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<List<Question>>> Delete(int id)
        {
            var question = questions.Find(h => h.Id == id);
            if (question == null)
            {
                return BadRequest("Hero not found");
            }
            else
            {
                questions.Remove(question);
                return Ok(questions);

            }
        }

    }
}