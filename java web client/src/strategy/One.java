package strategy;

import com.lzw.*;

public class One {
	
	public  One(){
		
	}
	
	public void function(){
		Getinfo getinfo = new Getinfo("test","root","yongfu");
	    int p1 = getinfo.getmsg("select * from AP1_user_num order by time desc limit 1");
	    int p2 = getinfo.getmsg("select * from AP1_user_num order by time desc limit 2");
	    int p3 = getinfo.getmsg("select * from AP1_user_num order by time desc limit 3");
		int power = getinfo.getmsg("select * from AP1_power order by time desc limit 1");
		
	    if(p1<=20 && p2<=20 && p3<=20&& power!=16){
	    SocketClient client = new SocketClient("192.168.0.1",12345);
	    client.sendMsg("p"+16);
	    client.closeSocket();
	    } 
		
		System.out.println("11111111");
	}
	
	public static void main(String[] args) {
		One one = new One();
		one.function();
		
		
	}

}
