using QuizAPI.Models;
using QuizAPI.Repositories.Interface;

namespace QuizAPI.Repositories.Implementation
{
    public class UserRepository : IUserRepository
    {
        public Task<Movie> AddEmployee(Movie movie)
        {
            throw new NotImplementedException();
        }

        public void DeleteEmployee(int movieId)
        {
            throw new NotImplementedException();
        }

        public Task<Movie> GetEmployee(int movieId)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Movie>> GetEmployees()
        {
            throw new NotImplementedException();
        }

        public Task<Movie> UpdateEmployee(Movie movie)
        {
            throw new NotImplementedException();
        }
    }
}
