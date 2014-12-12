package object;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@NamedQueries(value = { @NamedQuery(
		name = "findAllMovies",
		query = "select movie from Movie movie") })
@XmlRootElement
@XmlAccessorType(value = XmlAccessType.FIELD)
public class Movie implements Serializable{
	
	@Id
	@XmlAttribute
	private String name;
	
	@XmlAttribute
	private String src;
	
	@OneToMany(mappedBy="movie", cascade=CascadeType.ALL, orphanRemoval=true)
	@XmlElement(name="userLike")
	private List<UserLike> userLikes;
	
	@OneToMany(mappedBy="commentMovie", cascade=CascadeType.ALL, orphanRemoval=true)
	@XmlElement(name="comment")
	private List<Comment> comments;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public List<UserLike> getUserLikes() {
		return userLikes;
	}

	public void setUserLikes(List<UserLike> userLikes) {
		this.userLikes = userLikes;
	}

	public Movie(String name, String src) {
		super();
		this.name = name;
		this.src = src;
	}

	public Movie() {
		super();
	}
	
	
}
