package com.stef.login.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="books")
public class Books {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@Size(min=3, message="Title must be at least 3 characters")
	private String title;
	
	@NotNull
	@Size(min=3, message="Must have a review ")
	private String review;
	
	@NotNull
	@Min (value=3, message=" escreve maisss")
	private Double rating;
	
	@NotNull
	@Size(min=3, message="Author must also be 3 ")
	private String author;
	
	@NotNull
	@Min(value = 3, message="Please inform the number of pages ")
	private Integer NumOfPages;
	
	@NotNull
	@Size(min=3, message=" Please informe the genre of the book ")
	private String genre;
	
	
	
	
	
	// CreatedAt and UpdatedAt
	// This will not allow the createdAt column to be updated after creation
	@Column(updatable = false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;

	// Relationships connections
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;

	
	

	public Books() {
		
	}
	
	
	
	




	

	public Long getId() {
		return id;
	}










	public void setId(Long id) {
		this.id = id;
	}










	public String getTitle() {
		return title;
	}










	public void setTitle(String title) {
		this.title = title;
	}










	public String getReview() {
		return review;
	}










	public void setReview(String review) {
		this.review = review;
	}










	public Double getRating() {
		return rating;
	}










	public void setRating(Double rating) {
		this.rating = rating;
	}










	public String getAuthor() {
		return author;
	}










	public void setAuthor(String author) {
		this.author = author;
	}










	public Integer getNumOfPages() {
		return NumOfPages;
	}










	public void setNumOfPages(Integer numOfPages) {
		NumOfPages = numOfPages;
	}










	public String getGenre() {
		return genre;
	}










	public void setGenre(String genre) {
		this.genre = genre;
	}










	public Date getCreatedAt() {
		return createdAt;
	}










	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}










	public Date getUpdatedAt() {
		return updatedAt;
	}










	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}










	public User getUser() {
		return user;
	}










	public void setUser(User user) {
		this.user = user;
	}










	// PrePersist and PreUpdate
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
}