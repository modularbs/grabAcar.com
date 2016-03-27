using System;
using System.Linq;
using System.Web.Security;

#pragma warning disable 618

namespace CarRental
{
    /// <summary>
    /// Users logic - contains logic for the users table.
    /// </summary>
    public class UsersLogic : BaseLogic
    {
        /// <summary>
        /// Register new user.
        /// </summary>
        /// <param name="username">The user's username.</param>
        /// <param name="password">The user's password.</param>
        public int Register(User newUser)
        {
            // Need to add reference to: System.Web (Framework 4.0)
            newUser.Password = FormsAuthentication.HashPasswordForStoringInConfigFile(newUser.Password, "sha1");
            DB.Roles.FirstOrDefault(r => r.RoleID == 5).Users.Add(newUser); // Set this user the "User" Role (RoleID = 5).
            DB.Users.Add(newUser);
            DB.SaveChanges();
            return newUser.UserID;
        }

        /// <summary>
        /// Check if username already taken.
        /// </summary>
        /// <param name="username">The username to check.</param>
        /// <returns>Returns true if username already taken.</returns>
        public bool IsUsernameTaken(string username)
        {
            return DB.Users.Any(u => u.Username == username);
        }

        /// <summary>
        /// Check if user exists.
        /// </summary>
        /// <param name="username">The user's username.</param>
        /// <param name="password">The user's password.</param>
        /// <returns>Returns true if user exist.</returns>
        public User IsUserExist(string username, string password)
        {
            string encryptPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "sha1");
            return DB.Users.FirstOrDefault(u => u.Username == username && u.Password == encryptPassword);
        }
        /// <summary>
        /// Get all users.
        /// </summary>
        /// <returns>Returns all usernames.</returns>
        public string[] GetAllUsers()
        {
            return DB.Users.Select(u => u.Username).ToArray();
        }
    }
}