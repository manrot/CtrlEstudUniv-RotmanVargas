using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CtrlEstudUniv_RotmanVargas.Startup))]
namespace CtrlEstudUniv_RotmanVargas
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
