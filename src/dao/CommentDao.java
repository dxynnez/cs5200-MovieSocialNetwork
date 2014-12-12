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
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import object.*;

@Path("/comment/")
public class CommentDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("movieProject");
	EntityManager em = null;
	
	@GET
	@Path("/{moviename}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Comment> movieComment(@PathParam("moviename") String moviename) {
		
		List<Comment> comments = new ArrayList<Comment>();
		em = factory.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createQuery("SELECT c FROM Comment c WHERE c.commentMovie = :movie");
		Movie movie = new Movie();
		movie.setName(moviename);
		query.setParameter("movie", movie);
		comments = query.getResultList();
		em.getTransaction().commit();
		em.close();

		return comments;
	}
	
	@DELETE
	@Path("/delete/{commentId}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Comment> removeComment(@PathParam("commentId") int commentId) {
		List<Comment> comments = new ArrayList<Comment>();

		Comment comment = null;
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		comment = em.find(Comment.class, commentId);
		em.remove(comment);
		
		Query query = em.createNamedQuery("findAllComments");
		comments = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		
		return comments;	
	}
	
	@POST
	@Path("/create/{moviename}&{username}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Comment> createComment(@PathParam("moviename") String moviename, @PathParam("username") String username, Comment comment) {
		List<Comment> comments = new ArrayList<Comment>();

		em = factory.createEntityManager();
		em.getTransaction().begin();
		Movie movie = new Movie();
		movie.setName(moviename);
		comment.setUsername(username);
		comment.setCommentMovie(movie);
		em.persist(comment);
		Query query = em.createNamedQuery("findAllComments");
		comments = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return comments;
	}
	
	/*public static void main(String[] args){
		CommentDao dao = new CommentDao();
		Comment comment = new Comment(1,"this movie is awesome2233!",null, null);
		dao.createComment("stupid","Deng",comment);
	}*/
}
