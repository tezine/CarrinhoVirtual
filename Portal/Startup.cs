#region Imports
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Syncfusion.Blazor;
using CarrinhoVirtual.Data;
using Microsoft.IdentityModel.Tokens;
using CarrinhoVirtual.Codes;
using System.Text;
using Microsoft.AspNetCore.Mvc;
using CarrinhoVirtual.Services;
using Microsoft.Extensions.Options;
using Microsoft.AspNetCore.ResponseCompression;
using CarrinhoVirtual.Controllers;
using Frontend.Services;
#endregion

namespace CarrinhoVirtual {
    public class Startup {
        readonly string MyAllowSpecificOrigins = "_myAllowSpecificOrigins";
        public IConfiguration Configuration { get; }

        #region Constructor
        public Startup(IConfiguration configuration) {
            Configuration = configuration;
        } 
        #endregion

        #region ConfigureServices
        public void ConfigureServices(IServiceCollection services) {
            // requires using Microsoft.Extensions.Options
            //doc aqui https://docs.microsoft.com/pt-br/aspnet/core/tutorials/first-mongo-app?view=aspnetcore-3.1&tabs=visual-studio
            services.Configure<DatabaseSettings>(Configuration.GetSection(nameof(DatabaseSettings)));
            services.AddSingleton<IBlazorAppDatabaseSettings>(sp => sp.GetRequiredService<IOptions<DatabaseSettings>>().Value);
            services.AddCors(options => {
                options.AddPolicy(MyAllowSpecificOrigins,
                    builder => {
                        builder.AllowAnyOrigin()
                            .AllowAnyHeader()
                            .AllowAnyMethod();
                    });
            });
            SetupJwt(services);
            services.AddMvc(options => {
                options.Filters.Add(typeof(SGlobalExceptionHandler));
                options.EnableEndpointRouting = false;
            }).AddJsonOptions(options =>
             {
                 options.JsonSerializerOptions.PropertyNameCaseInsensitive = true;
                 //options.JsonSerializerOptions.PropertyNamingPolicy = null;
             }); ;//adicionado para suportar webapi
            services.AddSwaggerDocument(config => {
                config.PostProcess = document => {
                    document.Info.Version = "v1";
                    document.Info.Title = "Carrinho Virtual API";
                    document.Info.Description = "A simple ASP.NET Core web API";
                    document.Info.TermsOfService = "None";
                    document.Info.Contact = new NSwag.OpenApiContact {
                        Name = "Bruno Tezine",
                        Email = string.Empty,
                        Url = "https://test.com"
                    };
                    document.Info.License = new NSwag.OpenApiLicense {
                        Name = "Use under LICX",
                        Url = "https://example.com/license"
                    };
                };
            });
            services.Configure<GzipCompressionProviderOptions>(options => options.Level = System.IO.Compression.CompressionLevel.Optimal);
            services.AddResponseCompression();
            services.AddDistributedMemoryCache(); // Adds a default in-memory implementation of IDistributedCache
            SetupApiVersioning(services);
            services.AddSyncfusionBlazor();
            services.AddRazorPages();
            services.AddServerSideBlazor();
            services.AddHttpClient();
            AddClientSingletons(services);
            AddServerSingletons(services);
        } 
        #endregion

        #region Configure
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env) {
            Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("MjM4MjcwQDMxMzgyZTMxMmUzMENJUDllQU5FZXRXd1NubmNiU2NoamFmRGtWUkdCVHpZWktGUW1DTFdDTkU9");
            if (env.IsDevelopment()) {
                app.UseDeveloperExceptionPage();
            } else {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseCors(MyAllowSpecificOrigins);
            app.UseResponseCompression();
            //app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseOpenApi();
            app.UseSwaggerUi3();
            app.UseRouting();
            app.UseMvcWithDefaultRoute();//adicionado para suportar webapi
            app.UseAuthentication();
            app.UseEndpoints(endpoints => {
                endpoints.MapBlazorHub();
                endpoints.MapFallbackToPage("/_Host");
            });
            SDefines.ConnectionString = Configuration["ConnectionStrings:SampleConnection"];
        } 
        #endregion

        #region SetupJwt
        private void SetupJwt(IServiceCollection services) {
            services.AddAuthentication()
                //.AddCookie(cfg => cfg.SlidingExpiration = true)
                .AddJwtBearer(cfg => {
                    cfg.RequireHttpsMetadata = false;
                    cfg.SaveToken = false;
                    cfg.TokenValidationParameters = new TokenValidationParameters() {
                        ValidIssuer = SDefines.TokenIssuer,
                        ValidAudience = SDefines.TokenAudience,
                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(SDefines.Token))
                    };
                });
        }
        #endregion

        #region SetupApiVersioning
        private void SetupApiVersioning(IServiceCollection services) {
            services.AddApiVersioning(
                o => {
                    o.AssumeDefaultVersionWhenUnspecified = true;
                    o.DefaultApiVersion = new ApiVersion(1, 0);
                });
        }
        #endregion

        #region AddClientSingletons
        private void AddClientSingletons(IServiceCollection services) {
            services.AddHttpClient<SUsersBlazorService>(httpClient => httpClient.BaseAddress = new Uri(SDefines.BaseURL));
            services.AddHttpClient<SProductsBlazorService>(httpClient => httpClient.BaseAddress = new Uri(SDefines.BaseURL));
            services.AddHttpClient<SCompaniesAdminUsersBlazorService>(httpClient => httpClient.BaseAddress = new Uri(SDefines.BaseURL));
        } 
        #endregion

        #region AddServerSingletons
        private void AddServerSingletons(IServiceCollection services) {
            services.AddSingleton<WeatherForecastService>();
            services.AddSingleton<SUsersService>();
            services.AddSingleton<SAdminUsersService>();
            services.AddSingleton<SProductsService>();
            services.AddSingleton<SSearchService>();
            services.AddSingleton<SCompaniesService>();
            services.AddSingleton<SUsersCompaniesService>();
            services.AddSingleton<SCompaniesAdminUsersService>();
        } 
        #endregion
    }
}
