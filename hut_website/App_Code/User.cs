using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace hut_website
{
    public class User
    {
        private String email;
        private String firstName;
        private String lastName;
        private String phoneNumber;
        private DateTime dob;

        public User() { }

        public User(String email, String firstName, String lastName, String phoneNumber, DateTime dob, String role)
        {
            Email = email;
            FirstName = firstName;
            LastName = lastName;
            PhoneNumber = phoneNumber;
            Dob = dob;
            Role = role;
        }

        public User Get(String email)
        {
            using (SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HutConnection"].ToString()))
            {
                try
                {
                    sqlConnection.Open();
                    SqlCommand sqlCommand = new SqlCommand("Users_Get", sqlConnection)
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

                    List<User> users = new List<User>();

                    foreach (DataRow dataRow in dataTable.Rows)
                    {
                        User user = new User()
                        {
                            Email = dataRow["email"].ToString(),
                            FirstName = dataRow["first_name"].ToString(),
                            LastName = (dataRow["last_name"].ToString()),
                            Dob = DateTime.Parse(dataRow["dob"].ToString()),
                            PhoneNumber = dataRow["phone_number"].ToString(),
                            Role = dataRow["role"].ToString(),
                        };
                        users.Add(user);
                    }

                    if (users.Count >= 1)
                    {
                        return users[0];
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
                    SqlCommand sqlCommand = new SqlCommand("Users_Add", sqlConnection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    //Add your parameters
                    sqlCommand.Parameters.AddWithValue("@email", Email);
                    sqlCommand.Parameters.AddWithValue("@first_name", FirstName);
                    sqlCommand.Parameters.AddWithValue("@last_name", LastName);
                    sqlCommand.Parameters.AddWithValue("@phone_number", PhoneNumber);
                    sqlCommand.Parameters.AddWithValue("@dob", Dob.ToString("yyyy-MM-dd"));
                    sqlCommand.Parameters.AddWithValue("@role", Role);

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

        public String Email
        {
            get { return email; }
            set
            {
                if (value.Length <= 320)
                {
                    email = value;
                }
                else
                {
                    throw new Exception();
                }
            }
        }

        public String FirstName
        {
            get { return firstName; }
            set
            {
                if (value.Length <= 255)
                {
                    firstName = value;
                }
                else
                {
                    throw new Exception();
                }
            }
        }

        public String LastName
        {
            get { return lastName; }
            set
            {
                if (value.Length <= 255)
                {
                    lastName = value;
                }
                else
                {
                    throw new Exception();
                }
            }
        }

        public String PhoneNumber
        {
            get { return phoneNumber; }
            set
            {
                if (value.Length <= 255)
                {
                    phoneNumber = value;
                }
                else
                {
                    throw new Exception();
                }
            }
        }

        public DateTime Dob
        {
            get;
            set;
        }

        public String Role
        {
            get;
            set;
        }
    }
}