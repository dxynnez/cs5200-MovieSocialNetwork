package object;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@NamedQueries(value = { @NamedQuery(
		name = "findAllComments",
		query = "select comment from Comment comment") })
@XmlRootElement
@XmlAccessorType(value = XmlAccessType.FIELD)
public class Comment implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@XmlAttribute
	private int id;
	
	@XmlAttribute
	private String comment;
	
	@XmlAttribute
	private String username;
	
	@ManyToOne
	@JoinColumn(name="movie")
	@XmlTransient
	private Movie commentMovie;
	


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Movie getCommentMovie() {
		return commentMovie;
	}

	public void setCommentMovie(Movie commentMovie) {
		this.commentMovie = commentMovie;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Comment(int id, String comment, Movie commentMovie, String username) {
		super();
		this.id = id;
		this.comment = comment;
		this.commentMovie = commentMovie;
		this.username = username;
	}

	public Comment() {
		super();
	}
	
}
