package servlet;
import com.lzw.SocketClient;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControlPower
 */
@WebServlet("/ControlPower")
public class ControlPower extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter writer;
	Socket socket; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlPower() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   String parameter=null;
		   parameter=request.getParameter("power");
	  if(parameter == null || parameter.length() <= 0)
		{  
		//  response.sendRedirect("modefiyfail.html");
		}else{
			  SocketClient client = new SocketClient("192.168.0.1",12345);
	          client.sendMsg("p"+parameter);
	          client.closeSocket();
	          response.sendRedirect("modefiysuccess.html");
		}
		
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

