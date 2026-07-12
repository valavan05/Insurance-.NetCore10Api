using Insurance_API.Contracts;
using Insurance_API.Data;
using Insurance_API.Mapper;
using Insurance_API.Repositories;
using Insurance_API.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi;
using System.Text;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContext<AppDbContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
builder.Services.AddScoped<IInsuranceRepository, InsuranceRepositories>();
builder.Services.AddScoped<IInsuranceService, InsuranceService>();
builder.Services.AddAutoMapper(cfg => cfg.AddMaps(typeof(InsuranceProfile).Assembly));

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
//builder.Services.AddOpenApi();
builder.Services.AddEndpointsApiExplorer();
var jwtKey = builder.Configuration["Jwt:Key"] ?? "v2UJQxTrwUCqqJkehkxvSUZKQCX6gNmRWq7q1bWa3Jw=";

var jwtIssuer = builder.Configuration["Jwt:Issuer"] ?? "yourapiissuer";

builder.Services.AddAuthentication(options =>

{

    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme; ;

    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;

}).AddJwtBearer(options =>

{

    options.TokenValidationParameters = new TokenValidationParameters

    {

        ValidateIssuer = true,

        ValidateAudience = false,

        ValidateLifetime = true,

        ValidateIssuerSigningKey = true,

        ValidIssuer = jwtIssuer,

        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtKey))

    };

});

builder.Services.AddSwaggerGen(c => {

    c.EnableAnnotations();
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme

    {
        In = ParameterLocation.Header,
        Description = "Insert JWT like: Bearer {your token}",
        Name = "Authorization",
        Type = SecuritySchemeType.ApiKey,
        Scheme = "Bearer"
    });

    c.AddSecurityRequirement(document => new OpenApiSecurityRequirement

    {
        [new OpenApiSecuritySchemeReference("Bearer", document)] = new List<string>()
    });
});

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();

// Configure the HTTP request pipeline.
//if (app.Environment.IsDevelopment())
/*{
    app.MapOpenApi();
}*/

app.UseAuthorization();

app.MapControllers();

app.Run();
