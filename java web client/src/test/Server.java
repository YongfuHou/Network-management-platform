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
			System.out.println("�����ɹ�");
			while(true){
				System.out.println("�ȴ�����");
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
		// TODO �Զ����ɵķ������
		Server server = new Server();
		server.getsever();
	}

}
