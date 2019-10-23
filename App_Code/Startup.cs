using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PeiChengWorkCollections.Startup))]
namespace PeiChengWorkCollections
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
