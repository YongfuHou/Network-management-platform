package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import strategy.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;


/**
 * Servlet implementation class DoStrategy
 */
@WebServlet("/DoStrategy")
public class DoStrategy extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static String srategy_num = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoStrategy() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void deley(int deleytime){        //延迟函数
    	try {
			Thread.sleep(deleytime);
		} catch (InterruptedException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("utf-8");   
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		One one  = new One();
		Two two = new Two();
		Three three = new Three();
	
		srategy_num=request.getParameter("strategy");
		
		while(srategy_num!=null){
			
			if (srategy_num.equals("1")){
									
				one.function();	
				deley(80000);
											
			}else if(srategy_num.equals("2")){
					
				two.function();
				deley(80000);
			
			}else if (srategy_num.equals("3")){
					
				three.function();
				deley(8000);
				
								
			}else if(srategy_num.equals("stop")){
				
				out.println("策略运行停止，您可手动调节AP配置");
				break;
				
			}
			
	    //  srategy_num=request.getParameter("strategy");		
		
	   }
	}
}
