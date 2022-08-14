package com.stef.login.services;

import java.util.List;
import java.util.Optional;

import com.stef.login.models.Books;
import com.stef.login.repositories.BookRepository;

public class BookService {

	
	
	// Book Repo
	
		private final BookRepository bookRepo;

		public BookService(BookRepository bookRepo) {
			super();
			this.bookRepo = bookRepo;
		}
		
		
		//
		// Find All Books
		//
		public List<Books> allBooks() {
			return bookRepo.findAll();
		}
		
		//
		// Create Book
		//
		public Books createBook(Books books) {
			return bookRepo.save(books);
			
		}
		
		//
		// Find One Book
		//
		public Books findBook(Long id) {
			Optional<Books> optionalBook = bookRepo.findById(id);
			if(optionalBook.isPresent()) {
				return optionalBook.get();
			} else {
				return null;
			}
		}
		
		//
		// Update Book
		//
		public Books updateBook(Books book) {
			return bookRepo.save(book);
			
		}
		
		
		//
		// Delete Book
		//
		public void deleteBook(Long id) {
			bookRepo.deleteById(id);
			
		}

	}

