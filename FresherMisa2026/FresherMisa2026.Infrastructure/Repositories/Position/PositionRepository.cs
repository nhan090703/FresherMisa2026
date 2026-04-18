using Dapper;
using FresherMisa2026.Application.Extensions;
using FresherMisa2026.Application.Interfaces.Repositories;
using FresherMisa2026.Entities.Department;
using FresherMisa2026.Entities.Position;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;

namespace FresherMisa2026.Infrastructure.Repositories
{
    public class PositionRepository : BaseRepository<Position>, IPositionRepository
    {
        public PositionRepository(IConfiguration configuration) : base(configuration)
        {
        }

        public async Task<Position> GetPositionByCode(string code)
        {
            string query = SQLExtension.GetQuery("Position.GetByCode");
            var param = new Dictionary<string, object>
            {
                {"@PositionCode", code }
            };
            return await _dbConnection.QueryFirstOrDefaultAsync<Position>(query, param, commandType: System.Data.CommandType.Text);
        }

        public async Task<bool> HasEmployeeAsync(Guid PositionId)
        {
            string query = SQLExtension.GetQuery("Employee.HasByPositionId");
            var param = new Dictionary<string, object>
                {
                    { "@PositionID", PositionId }
                };
            return await _dbConnection.ExecuteScalarAsync<bool>(query, param, commandType: System.Data.CommandType.Text);
        }
    }
}