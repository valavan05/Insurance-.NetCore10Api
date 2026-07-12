namespace Insurance_API.DTO
{
    public class PagedResulDto<T>
    {
        public IEnumerable<T> Data { get; set; } = new List<T>();
        public int TotalRecords { get; set; }
    }
}
