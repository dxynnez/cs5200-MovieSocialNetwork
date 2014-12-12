package dao;

import java.io.*;
import java.util.*;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.*;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import javax.persistence.*;
import javax.print.attribute.standard.Media;

import object.*;

@Path("/user/")
public class UserDao {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("movieProject");
	EntityManager em = null;
	
	public boolean verifyUser(User user)
	{
		boolean checkUser = false;
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		User temp = em.find(User.class, user.getUsername());
		
		if(temp != null && temp.getPassword().equals(user.getPassword())){
			checkUser = true;
		}

		em.getTransaction().commit();
		em.close();
		return checkUser;
	}
	
	@GET
	@Path("/{username}")
	@Produces(MediaType.APPLICATION_JSON)
	public User findUser(@PathParam("username") String username) {
		User user = null;
		em = factory.createEntityManager();
		em.getTransaction().begin();	
		user = em.find(User.class, username);
		em.getTransaction().commit();
		em.close();
		
		return user;
	}
	
	@GET
	@Path("/")
	@Produces(MediaType.APPLICATION_JSON)
	public List<User> findAllUsers() {
		List<User> users = new ArrayList<User>();
		em = factory.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("findAllUsers");
		users = query.getResultList();
		em.getTransaction().commit();
		em.close();

		return users;
	}
	
	@PUT
	@Path("/update/{username}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<User> updateUser(@PathParam("username") String username, User user) {
		List<User> users = new ArrayList<User>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		user.setUsername(username);
		em.merge(user);
		
		Query query = em.createNamedQuery("findAllUsers");
		users = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return users;
	}
	
	@DELETE
	@Path("/{username}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<User> removeUser(@PathParam("username") String username) {
		List<User> users = new ArrayList<User>();

		User user = null;
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		user = em.find(User.class, username);
		em.remove(user);
		
		Query query = em.createNamedQuery("findAllSites");
		users = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		
		return users;	
	}
	
	@POST
	@Path("/create/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<User> createUser(User user) {
		List<User> users = new ArrayList<User>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(user);
		Query query = em.createNamedQuery("findAllUsers");
		users = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return users;
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UserDao dao = new UserDao();
		User user = new User("Deng", "5698081", "deng.xia@husky.neu.edu", "I am a big fan of 'The Fast and the Furious'! Follow me if you like it!", "style/images/user/xiangyideng.png");
		User user2 = new User("ZC", "02115", "hu.zi@husky.neu.edu", "I am a fan of movies. Follow me if you have any great recommendations!", "style/images/user/zichenhu.jpg"); 
		dao.createUser(user);
		dao.createUser(user2);
	}

}
