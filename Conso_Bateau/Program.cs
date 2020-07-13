using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Conso_Bateau
{
    class Program
    {
        static void Main(string[] args)
        {
            const string ConString = @"Data Source=DESKTOP-lgurcco;Initial Catalog=DB_Bateau;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(ConString))
            {
                //Si constructeur sans paramètre
                //connection.ConnectionString = ConString;
                using (SqlCommand command = connection.CreateCommand())
                {
                    //Si utilisation du constructeur de SqlCommand au lieu du CreateCommand()
                    //command.Connection = connection;
                    command.CommandText = "SP_Insert_User";
                    command.CommandType = CommandType.StoredProcedure;
                    SqlParameter Plogin = new SqlParameter();
                    Plogin.Value = "tètè";
                    Plogin.ParameterName = "login";
                    SqlParameter Ppwd = new SqlParameter("password", "test1234=");
                    command.Parameters.Add(Plogin);
                    command.Parameters.Add(Ppwd);
                    command.Parameters.AddWithValue("email", "tètè@ou.titi");
                    connection.Open();
                    Console.WriteLine( (int)command.ExecuteScalar() );
                }
            }

            Console.ReadLine();
        }
    }
}
