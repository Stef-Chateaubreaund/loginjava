package com.stef.login.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.stef.login.models.Books;
import com.stef.login.models.LoginUser;
import com.stef.login.models.User;
import com.stef.login.services.BookService;
import com.stef.login.services.UserService;



@Controller
public class Home {

	
	
	@Autowired
	private UserService userServ;
	private BookService bookServ;
	
	@GetMapping("/")
	public String index(Model model) {
	 
	    // Bind empty User and LoginUser objects to the JSP to capture the form input
	    model.addAttribute("newUser", new User());
	    model.addAttribute("newLogin", new LoginUser());
	    return "detais.jsp";
	    
	}
	 
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
	     
		User user = userServ.register(newUser, result);
		
	    if(result.hasErrors()) {
	        // Be sure to send in the empty LoginUser before re-rendering the page.
	        model.addAttribute("newLogin", new LoginUser());
	        return "index.jsp";
	    }
	    
	    session.setAttribute("userId", user.getId());
	 
	    return "redirect:/books";
	}
	 
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
	     
		User user = userServ.login(newLogin, result);
	 
	    if(result.hasErrors() || user==null) {
	        model.addAttribute("newUser", new User());
	        return "index.jsp";
	    }
	     
	    session.setAttribute("userId", user.getId());
	    session.setAttribute("count", 1);
	    return "redirect:/create";
	}
	
	
	@GetMapping("/books")
	public String welcome(HttpSession session, Model model) {

		// If no userId is found, redirect to logout
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
			
		}
		
		// We get the userId from our session (we need to cast the result to a Long as the 'session.getAttribute("userId")' returns an object
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userServ.findbyId(userId));
		
	    return "books.jsp";
	    
	}
	
//        *      create new book       *      
	
	@GetMapping("/create")
	public String create(@ModelAttribute("book") Books book,
			Model model,
			HttpSession session) {
		
		// check to see if user is logged in

		if (session.getAttribute("userId") == null) {
			// if not in session, redirect to login
			return "redirect:/";
		}
		
//		// send all Users to the JSP
		model.addAttribute("allUsers", userServ.allUsers());
		
		// get logged in user id from session to grab that users info
		Long userId = (Long) session.getAttribute("userId");
		
		// send logged in User to JSP
		User user = UserService.findUser(userId);
		model.addAttribute("user", user);

		return "create.jsp";
	}
	
	// process to create a new book 
	@PostMapping("/createNew")
	public String createNewBookProcess(
			@Valid @ModelAttribute("book") Books book,
			BindingResult result,
			Model model) {
		
		/// check to see if input is valid
		if (result.hasErrors()) {
			model.addAttribute("book", book);
			model.addAttribute("allUsers", userServ.allUsers());
			return "create.jsp";
		} else {
			bookServ.createBook(book);
			return "redirect:/books";
		}
		
		
	//    *    update       *     	
		
	@GetMapping("/update/{id}")
	public String update(
			@PathVariable("id") Long id,
			@ModelAttribute("book") Books books,
			Model model, HttpSession session) {
			
			// check to see if user is logged in
			if (session.getAttribute("user_id") == null) {
				// if not in session, redirect to login
				return "redirect:/createError";
			}
			
			// add all users to the JSP
			model.addAttribute("allUsers", userServ.allUsers());
			
			// add the book to update to the JSP
			model.addAttribute("book", bookServ.findBook(id));

			
			return "updateBook.jsp";
		}
		

//     
	@RequestMapping(value = "/update/{id}", method = RequestMethod.PUT)
	public String updateBookProcess(
			@Valid 
			@ModelAttribute("book") Books books,
				BindingResult result,
				Model model) {

			if (result.hasErrors()) {
				model.addAttribute("allUsers", userServ.allUsers());
				return "update.jsp";
			} else {

				bookServ.updateBook(book);
				return "redirect:/create";
			}
		}
		
	}
	
	
	
	
	

	@GetMapping("/logout")
	public String logout(HttpSession session) {
	 
		// Set userId to null and redirect to login/register page
		session.setAttribute("userId", null);
	     
	    return "redirect:/";
	}


	
}