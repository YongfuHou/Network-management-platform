package test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
	
	private BufferedReader reader;
	private ServerSocket server;
	private Socket socket;
	
	void getsever(){
		try {
			
			server=new ServerSocket(8881);
			System.out.println("创建成功");
			while(true){
				System.out.println("等待连接");
				socket=server.accept();
				reader=new BufferedReader(new InputStreamReader(socket.getInputStream()));
			getClientMessage();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	private void getClientMessage(){
		try{
			while (true){
				System.out.println(reader.readLine());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		try{
			if (reader!=null){
				reader.close();
			}
			if (socket!=null){
				socket.close();
			}
			
		}catch(IOException e){
			e.printStackTrace();
		}
		
	}
	public static void main(String[] args) {
		// TODO 自动生成的方法存根
		Server server = new Server();
		server.getsever();
	}

}
