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
import javax.persistence.Entity;

@Path("/userlike/")
public class UserLikeDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("movieProject");
	EntityManager em = null;
	
	@GET
	@Path("/user/{username}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Movie> findUserLike(@PathParam("username") String username) {
		List<Movie> movies = new ArrayList<Movie>();
		em = factory.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createQuery("SELECT u.movie FROM UserLike u WHERE u.userL = :username");
		User user = new User();
		user.setUsername(username);
		query.setParameter("username", user);
		movies = query.getResultList();
		em.getTransaction().commit();
		em.close();

		return movies;
	}
	
	@GET
	@Path("/movie/{name}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<User> findMovieLike(@PathParam("name") String movieName) {
		List<User> users = new ArrayList<User>();
		em = factory.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createQuery("SELECT u.userL FROM UserLike u WHERE u.movie = :movieName");
		Movie movie = new Movie();
		movie.setName(movieName);
		query.setParameter("movieName", movie);
		users = query.getResultList();
		em.getTransaction().commit();
		em.close();

		return users;
	}
	
	@PUT
	@Path("/update/{userLikeId}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<UserLike> updateUserLike(@PathParam("userLikeId") int userLikeId, UserLike userLike) {
		List<UserLike> userLikes = new ArrayList<UserLike>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		userLike.setId(userLikeId);
		em.merge(userLike);
		
		Query query = em.createNamedQuery("findAllUserLikes");
		userLikes = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return userLikes;
	}
	
	@DELETE
	@Path("/delete/{userLikeId}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<UserLike> removeUserLike(@PathParam("userLikeId") String userLikeId) {
		List<UserLike> userLikes = new ArrayList<UserLike>();

		UserLike userLike = null;
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		userLike = em.find(UserLike.class, userLikeId);
		em.remove(userLike);
		
		Query query = em.createNamedQuery("findAllUserLikes");
		userLikes = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		
		return userLikes;	
	}
	
	@POST
	@Path("/create/{moviename}&{username}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<UserLike> createUserLike(@PathParam("moviename") String moviename,@PathParam("username") String username, UserLike userLike) {
		List<UserLike> userLikes = new ArrayList<UserLike>();

		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Movie movie = new Movie();
		movie.setName(moviename);
		User user = new User();
		user.setUsername(username);
		userLike.setMovie(movie);
		userLike.setUserL(user);
		em.persist(userLike);
		Query query = em.createNamedQuery("findAllUserLikes");
		userLikes = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return userLikes;
	}
	
	/*public static void main(String[] args){
		UserLikeDao dao = new UserLikeDao();
		UserLike userLike = new UserLike(1,null,null);
		dao.createUserLike("Avengers: Age of Ultron","Deng",userLike);
	}*/
}
