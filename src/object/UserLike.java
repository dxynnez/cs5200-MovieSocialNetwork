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
		name = "findAllUserLikes",
		query = "select userLike from UserLike userLike") })
@XmlRootElement
@XmlAccessorType(value = XmlAccessType.FIELD)
public class UserLike implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@XmlAttribute
	private int id;
	
	@ManyToOne
	@JoinColumn(name="moive")
	@XmlTransient
	private Movie movie;
	
	@ManyToOne
	@JoinColumn(name="username")
	@XmlTransient
	private User userL;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	

	public User getUserL() {
		return userL;
	}

	public void setUserL(User userL) {
		this.userL = userL;
	}

	public UserLike(int id, Movie movie, User userL) {
		super();
		this.id = id;
		this.movie = movie;
		this.userL = userL;
	}

	public UserLike() {
		super();
	}
}
