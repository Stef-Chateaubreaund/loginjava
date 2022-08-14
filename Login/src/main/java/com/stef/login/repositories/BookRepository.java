package com.stef.login.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.stef.login.models.Books;

@Repository
public interface BookRepository extends CrudRepository<Books, Long> {
	
	List<Books> findAll();

}
