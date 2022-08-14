package com.stef.login.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.stef.login.models.LoginUser;
import com.stef.login.models.User;
import com.stef.login.repositories.UserRepository;

@Service
public class UserService {
		

		// injete os repositorios aqui 
		@Autowired
		private UserRepository userRepo;
		
		// aqui voce acha todos os users 
		
		
		
		public List<User> allUsers() {
			return userRepo.findAll();
		}
		
		//
		// Find One User
		//
		public User findbyId(Long id) {
			Optional<User> optionalUser = userRepo.findById(id);
			if(optionalUser.isPresent()) {
				System.out.println("udugcdsjdhsbd");
				return optionalUser.get();
				
			} else {
				System.out.println("IIIIIII");
				return null;
			}
		}
		
		// TO-DO: Write register and login methods!

			// This method will be called from the controller
			// whenever a user submits a registration form.
			public User register(User newUser, BindingResult result) {

				// TO-DO: Additional validations!
				// TO-DO - Reject values or register if no errors:

				// Reject if email is taken (present in database)
				if (userRepo.findByEmail(newUser.getEmail()).isPresent()) {
					result.rejectValue("email", "Unique",
							"There is already a user registered with this email, must use a different email!");
				}
				// Reject if password doesn't match confirmation
				if (!newUser.getPassword().equals(newUser.getConfirm())) {
					result.rejectValue("confirm", "Matches", "Passwords must match!");
				}

				// Return null if result has errors
				if (result.hasErrors()) {
					return null;
				}

				// Hash and set password, save user to database
				String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
				newUser.setPassword(hashed);
				return userRepo.save(newUser);

			}

			// This method will be called from the controller
			// whenever a user submits a login form.
			public User login(LoginUser newLogin, BindingResult result) {

				// TO-DO: Additional validations!
				// TO-DO - Reject values:
				
				// Find user in the DB by email
				Optional<User> potentialUser = userRepo.findByEmail(newLogin.getEmail());
				
				// Reject if NOT present
				if (!potentialUser.isPresent()) {
					result.rejectValue("email", "Unique", "Email does not exist in the database!");
					return null;
				}
				User user = potentialUser.get();

				// Reject if BCrypt password match fails
				if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
					result.rejectValue("password", "Matches", "Password does not match the password for this email!");
					return null;
				}
				// Return null if result has errors
				if (result.hasErrors()) {
					return null;
				} else {
					
				// Otherwise, return the user object
					return user;
				}

			}

			public static User findUser(Long user_id) {
				// TODO Auto-generated method stub
				return null;
			}


	}	


