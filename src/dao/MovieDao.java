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

@Path("/movie/")
public class MovieDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("movieProject");
	EntityManager em = null;
	
	@GET
	@Path("/{name}")
	@Produces(MediaType.APPLICATION_JSON)
	public Movie findMovie(@PathParam("name") String name) {
		Movie movie = null;
		em = factory.createEntityManager();
		em.getTransaction().begin();	
		movie = em.find(Movie.class, name);
		em.getTransaction().commit();
		em.close();
		
		return movie;
	}
	
	@GET
	@Path("/")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Movie> findAllMovies() {
		List<Movie> movies = new ArrayList<Movie>();
		em = factory.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("findAllMovies");
		movies = query.getResultList();
		em.getTransaction().commit();
		em.close();

		return movies;
	}
	
	@PUT
	@Path("/{name}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Movie> updateMovie(@PathParam("name") String name, Movie movie) {
		List<Movie> movies = new ArrayList<Movie>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		movie.setName(name);
		em.merge(movie);
		
		Query query = em.createNamedQuery("findAllMovies");
		movies = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return movies;
	}
	
	@DELETE
	@Path("/{name}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Movie> removeMovie(@PathParam("name") String name) {
		List<Movie> movies = new ArrayList<Movie>();

		Movie movie = null;
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		movie = em.find(Movie.class, name);
		em.remove(movie);
		
		Query query = em.createNamedQuery("findAllMovies");
		movies = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		
		return movies;	
	}
	
	@POST
	@Path("/create/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Movie> createMovie(Movie movie) {
		List<Movie> movies = new ArrayList<Movie>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(movie);
		Query query = em.createNamedQuery("findAllMovies");
		movies = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return movies;
		
	}
	
	/*public static void main(String[] args){
		MovieDao dao = new MovieDao();
		Movie movie = new Movie();
		movie.setName("stupid");
		dao.createMovie(movie);
		movie.setName("idiot");
		dao.createMovie(movie);
	}*/
}