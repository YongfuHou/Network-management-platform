package test;
import com.lzw.*;

import java.io.*;
public class TestSocketClient {
	
	      public static void main(String[] args){
	    	  SocketClient client = new SocketClient("127.0.0.1",8881);
	    		  client.sendMsg("p");
	          
	    }
}