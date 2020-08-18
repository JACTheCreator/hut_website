using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace hut_website
{
    public class CartItem
    {
        public CartItem() { }

        public int Id { get; set; }

        public int ProductId { get; set; }

        public int Quantity { get; set; }

        public float TotalCost { get; set; }

        public String Email { get; set; }

        public void Add()
        {
            using (SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HutConnection"].ToString()))
            {
                try
                {
                    sqlConnection.Open();
                    SqlCommand sqlCommand = new SqlCommand("Cart_Items_Add", sqlConnection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    //Add your parameters
                    sqlCommand.Parameters.AddWithValue("@product_id", ProductId);
                    sqlCommand.Parameters.AddWithValue("@quantity", Quantity);
                    sqlCommand.Parameters.AddWithValue("@total_cost", TotalCost);
                    sqlCommand.Parameters.AddWithValue("@email", Email);

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

        public List<CartItem> List(String email)
        {
            using (SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HutConnection"].ToString()))
            {
                try
                {
                    sqlConnection.Open();
                    SqlCommand sqlCommand = new SqlCommand("Cart_Items_List", sqlConnection)
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

                    List<CartItem> products = new List<CartItem>();
                    foreach (DataRow dataRow in dataTable.Rows)
                    {
                        CartItem cartItem = new CartItem()
                        {
                            Id = int.Parse(dataRow["id"].ToString()),
                            ProductId = int.Parse(dataRow["product_id"].ToString()),
                            Quantity = int.Parse(dataRow["quantity"].ToString()),
                            TotalCost = float.Parse(dataRow["total_cost"].ToString()),
                        };
                        products.Add(cartItem);
                    }

                    return products;
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

        public void Delete(int id)
        {
            using (SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HutConnection"].ToString()))
            {
                try
                {
                    sqlConnection.Open();
                    SqlCommand sqlCommand = new SqlCommand("Cart_Items_Delete", sqlConnection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    //Add your parameters
                    sqlCommand.Parameters.AddWithValue("@id", id);

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


        public void DeleteAll(String email)
        {
            using (SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HutConnection"].ToString()))
            {
                try
                {
                    sqlConnection.Open();
                    SqlCommand sqlCommand = new SqlCommand("Cart_Items_Delete_All", sqlConnection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    // Add your parameters
                    sqlCommand.Parameters.AddWithValue("@email", email);

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
    }
}