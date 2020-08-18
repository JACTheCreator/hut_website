using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace hut_website
{
    public class Product
    {
        private String name;
        private String description;
        private String category;
        private String image;

        public Product() { }

        public Product(int id, String name, String description, String category, float price, String image)
        {
            Id = id;
            Name = name;
            Description = description;
            Category = category;
            Price = price;
            Image = image;
        }

        public Product Get(int id)
        {
            using (SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HutConnection"].ToString()))
            {
                try
                {
                    sqlConnection.Open();
                    SqlCommand sqlCommand = new SqlCommand("Products_Get", sqlConnection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    //Add your parameters
                    sqlCommand.Parameters.AddWithValue("@id", id);

                    //Just execute the Query directly
                    sqlCommand.ExecuteNonQuery();

                    DataTable dataTable = new DataTable();
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCommand);
                    dataAdapter.Fill(dataTable);

                    List<Product> products = new List<Product>();

                    foreach (DataRow dataRow in dataTable.Rows)
                    {
                        Product product = new Product()
                        {
                            Id = int.Parse(dataRow["id"].ToString()),
                            Name = (dataRow["name"].ToString()),
                            Description = (dataRow["desription"].ToString()),
                            Category = (dataRow["category"].ToString()),
                            Price = float.Parse(dataRow["unit_price"].ToString()),
                            Image = (dataRow["image_link"].ToString()),
                        };
                        products.Add(product);
                    }

                    if (products.Count >= 1)
                    {
                        return products[0];
                    }
                    return null;
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

        public void Add()
        {
            using (SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HutConnection"].ToString()))
            {
                try
                {
                    sqlConnection.Open();
                    SqlCommand sqlCommand = new SqlCommand("Products_Add", sqlConnection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    //Add your parameters
                    sqlCommand.Parameters.AddWithValue("@name", Name);
                    sqlCommand.Parameters.AddWithValue("@desription", Description);
                    sqlCommand.Parameters.AddWithValue("@unit_price", Price);
                    sqlCommand.Parameters.AddWithValue("@category", Category);
                    sqlCommand.Parameters.AddWithValue("@image_link", Image);

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

        public void Delete(int id)
        {
            using (SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HutConnection"].ToString()))
            {
                try
                {
                    sqlConnection.Open();
                    SqlCommand sqlCommand = new SqlCommand("Products_Delete", sqlConnection)
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

        public void Update()
        {
            using (SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HutConnection"].ToString()))
            {
                try
                {
                    sqlConnection.Open();
                    SqlCommand sqlCommand = new SqlCommand("Products_Update", sqlConnection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    //Add your parameters
                    sqlCommand.Parameters.AddWithValue("@id", Id);
                    sqlCommand.Parameters.AddWithValue("@name", Name);
                    sqlCommand.Parameters.AddWithValue("@desription", Description);
                    sqlCommand.Parameters.AddWithValue("@unit_price", Price);
                    sqlCommand.Parameters.AddWithValue("@category", Category);
                    sqlCommand.Parameters.AddWithValue("@image_link", Image);

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

        public List<Product> GetAllProducts()
        {
            using (SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HutConnection"].ToString()))
            {
                try
                {
                    sqlConnection.Open();
                    SqlCommand sqlCommand = new SqlCommand("Products_List", sqlConnection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    //Just execute the Query directly
                    sqlCommand.ExecuteNonQuery();

                    DataTable dataTable = new DataTable();
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCommand);
                    dataAdapter.Fill(dataTable);

                    List<Product> products = new List<Product>();
                    foreach (DataRow dataRow in dataTable.Rows)
                    {
                        Product product = new Product()
                        {
                            Id = int.Parse(dataRow["id"].ToString()),
                            Name = dataRow["name"].ToString(),
                            Description = dataRow["desription"].ToString(),
                            Category = dataRow["category"].ToString(),
                            Price = float.Parse(dataRow["unit_price"].ToString()),
                            Image = dataRow["image_link"].ToString(),
                        };
                        products.Add(product);
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

        public int Id { get; set; }

        public String Name
        {
            get { return name; }
            set
            {
                if (value.Length <= 255)
                {
                    name = value;
                }
                else
                {
                    throw new Exception();
                }
            }
        }

        public String Description { get; set; }


        public String Category { get; set; }


        public float Price { get; set; }


        public String Image
        {
            get { return image; }
            set
            {
                if (value.Length <= 255)
                {
                    image = value;
                }
                else
                {
                    throw new Exception();
                }
            }
        }
    }
}