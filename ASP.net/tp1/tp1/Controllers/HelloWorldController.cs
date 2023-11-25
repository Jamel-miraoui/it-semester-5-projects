using Microsoft.AspNetCore.Mvc;

namespace tp1.Controllers
{
    public class HelloWorldController : Controller
    {
        public string Index()
        {
            return View();
        }

        public string Welcome(string name , int numTimes=1)
        {
            return "hello" + name + "your NumTimes is" + numTimes; 
        }
    }
}
