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
		name = "findAllFollows",
		query = "select follow from Follow follow") })
@XmlRootElement
@XmlAccessorType(value = XmlAccessType.FIELD)
public class Follow implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@XmlAttribute
	private int id;
	
	@ManyToOne
	@JoinColumn(name="user")
	@XmlTransient
	private User user;
	
	@ManyToOne
	@JoinColumn(name="follower")
	@XmlTransient
	private User follower;

	public Follow(int id, User user, User follower) {
		super();
		this.id = id;
		this.user = user;
		this.follower = follower;
	}

	public Follow() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getFollower() {
		return follower;
	}

	public void setFollower(User follower) {
		this.follower = follower;
	}

}
