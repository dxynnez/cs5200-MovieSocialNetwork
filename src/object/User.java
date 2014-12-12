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
		name = "findAllUsers",
		query = "select user from User user") })
@XmlRootElement
@XmlAccessorType(value = XmlAccessType.FIELD)
public class User implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@XmlAttribute
	private String username;
	
	@XmlAttribute
	private String password;
	
	@XmlAttribute
	private String email;
	
	@XmlAttribute
	private String description;
	
	@XmlAttribute
	private String src;
	
	@OneToMany(mappedBy="user", cascade=CascadeType.ALL, orphanRemoval=true)
	@XmlElement(name="followUser")
	private List<Follow> followUsers;
	
	@OneToMany(mappedBy="follower", cascade=CascadeType.ALL, orphanRemoval=true)
	@XmlElement(name="followFollower")
	private List<Follow> followFollowers;
	
	@OneToMany(mappedBy="userL", cascade=CascadeType.ALL, orphanRemoval=true)
	@XmlElement(name="userLike")
	private List<UserLike> userLikes;
	
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public User() {
		super();
	}
	
	public User(String username, String password, String email) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
	}

	public User(String username, String password, String email,
			String description, String src) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.description = description;
		this.src = src;
	}
	
}