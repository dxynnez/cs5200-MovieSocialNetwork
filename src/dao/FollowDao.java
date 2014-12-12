package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import object.*;

@Path("/follow/")
public class FollowDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("movieProject");
	EntityManager em = null;
	
	@GET
	@Path("/follower/{username}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<User> findFollower(@PathParam("username") String username) {
		List<User> userFollows = new ArrayList<User>();
		em = factory.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createQuery("SELECT f.follower FROM Follow f WHERE f.user = :user");
		User user = new User();
		user.setUsername(username);
		query.setParameter("user", user);
		userFollows = query.getResultList();
		em.getTransaction().commit();
		em.close();

		return userFollows;
	}
	
	@GET
	@Path("/user/{username}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<User> findUser(@PathParam("username") String username) {
		List<User> followerFollows = new ArrayList<User>();
		em = factory.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createQuery("SELECT u.user FROM Follow f WHERE f.follower = :follower");
		User follower = new User();
		follower.setUsername(username);
		query.setParameter("follower", follower);
		followerFollows = query.getResultList();
		em.getTransaction().commit();
		em.close();

		return followerFollows;
	}
	
	@DELETE
	@Path("/delete/{followId}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Follow> removeFollow(@PathParam("followId") int followId) {
		List<Follow> follows = new ArrayList<Follow>();

		Follow follow = null;
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		follow = em.find(Follow.class, followId);
		em.remove(follow);
		
		Query query = em.createNamedQuery("findAllFollows");
		follows = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		
		return follows;	
	}
	
	@POST
	@Path("/create/{username}&{followername}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Follow> createFollow(@PathParam("username") String username, @PathParam("followername") String followername) {
		List<Follow> follows = new ArrayList<Follow>();

		em = factory.createEntityManager();
		em.getTransaction().begin();
		User user = new User();
		user.setUsername(username);
		User follower = new User();
		follower.setUsername(followername);
		
		Follow follow = new Follow(1,user,follower);
		em.persist(follow);
		Query query = em.createNamedQuery("findAllFollows");
		follows = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return follows;
	}
	
	/*public static void main(String[] args){
		FollowDao dao = new FollowDao();

		dao.createFollow("ZC","Deng");
	}*/
}
