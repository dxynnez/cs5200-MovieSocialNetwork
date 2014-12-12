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

@Path("/message/")
public class MessageDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("movieProject");
	EntityManager em = null;
	
	@GET
	@Path("/{receiver}/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Message> comment(@PathParam("receiver") String receiver) {
		
		List<Message> messages = new ArrayList<Message>();
		em = factory.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createQuery("SELECT m FROM Message m WHERE m.receiver = :receiver");
		query.setParameter("receiver", receiver);
		messages = query.getResultList();
		em.getTransaction().commit();
		em.close();

		return messages;
	}
	
	@DELETE
	@Path("/delete/{messageId}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Message> removeMessage(@PathParam("messageId") int messageId) {
		List<Message> messages = new ArrayList<Message>();

		Message message = null;
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		message = em.find(Message.class, messageId);
		em.remove(message);
		
		Query query = em.createNamedQuery("findAllMessages");
		messages = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		
		return messages;
	}
	
	@POST
	@Path("/create/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Message> createMessage(Message message) {
		List<Message> messages = new ArrayList<Message>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(message);
		Query query = em.createNamedQuery("findAllMessages");
		messages = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return messages;
	}
	
	/*public static void main(String[] args){
		MessageDao dao = new MessageDao();
		Message message = new Message(1,"Deng","ZC", "see you tomorrow!");
		dao.createMessage(message);
	}*/
}
