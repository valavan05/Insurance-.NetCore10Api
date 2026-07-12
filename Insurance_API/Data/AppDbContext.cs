using Insurance_API.Entities;
using Microsoft.EntityFrameworkCore;
using System.Numerics;
namespace Insurance_API.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
    }

    public DbSet<InsuranceMaster> InsuranceMasters { get; set; }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
    }
}
