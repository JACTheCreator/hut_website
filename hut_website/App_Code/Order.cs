using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace hut_website
{
    public class Order
    {
        private int id;
        private String email;
        private String status;
        private String date;
        private float total_cost;

        public Order() { }

        public int Id { get; set; }

        public String Email { get; set; }

        public int ProductId { get; set; }

        public String Date { get; set; }

        public int Quantity { get; set; }

        public float TotalCost { get; set; }

        public void Add()
        {
            using (SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HutConnection"].ToString()))
            {
                try
                {
                    sqlConnection.Open();
                    SqlCommand sqlCommand = new SqlCommand("Orders_Add", sqlConnection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    //Add your parameters
                    sqlCommand.Parameters.AddWithValue("@product_id", ProductId);
                    sqlCommand.Parameters.AddWithValue("@email", Email);
                    sqlCommand.Parameters.AddWithValue("@quantity", Quantity);
                    sqlCommand.Parameters.AddWithValue("@total_cost", TotalCost);

                    //Just execute the Query directly
                    sqlCommand.ExecuteNonQuery();
                }
                catch (Exception exception)
                {
                    throw new Exception(exception.ToString());
                }
                finally
                {
                    sqlConnection.Close();
                }
            }
        }

        public List<Order> List(String email)
        {
            using (SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HutConnection"].ToString()))
            {
                try
                {
                    sqlConnection.Open();
                    SqlCommand sqlCommand = new SqlCommand("Orders_List", sqlConnection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    //Add your parameters
                    sqlCommand.Parameters.AddWithValue("@email", email);

                    //Just execute the Query directly
                    sqlCommand.ExecuteNonQuery();

                    DataTable dataTable = new DataTable();
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCommand);
                    dataAdapter.Fill(dataTable);

                    List<Order> orders = new List<Order>();
                    foreach (DataRow dataRow in dataTable.Rows)
                    {
                        Order order = new Order()
                        {
                            Id = int.Parse(dataRow["id"].ToString()),
                            ProductId = int.Parse(dataRow["product_id"].ToString()),
                            Email = dataRow["email"].ToString(),
                            Date = dataRow["date"].ToString(),
                            Quantity = int.Parse(dataRow["quantity"].ToString()),
                            TotalCost = float.Parse(dataRow["total_cost"].ToString())
                        };
                        orders.Add(order);
                    }

                    return orders;
                }
                catch (Exception exception)
                {
                    throw new Exception(exception.ToString());
                }
                finally
                {
                    sqlConnection.Close();
                }
            }
        }
    }
}