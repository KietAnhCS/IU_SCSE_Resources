import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import java.util.*;

public class MyUtil {
    public static String printCookie(Cookie c){
        String name = c.getName();
        String value = c.getValue();
        return "Name: " + name + "<br>Value: " + value + "<br>";
    }

    public static String printSession(HttpSession session, Integer accessNum){
        String id = session.getId();
        Date createTime = new Date(session.getCreationTime());
        Date lastAccessTime = new Date(session.getLastAccessedTime()) ;
        String out = "<table>";
        out += "<tr><td>"+"ID"+"</td><td>"+id+"</td></tr>";
        out += "<tr><td>"+"CreateTime"+"</td><td>"+createTime.toString()+"</td></tr>";
        out += "<tr><td>"+"LastAccessTime"+"</td><td>"+lastAccessTime.toString()+"</td></tr>";
        out += "<tr><td>"+"Access Count"+"</td><td>"+accessNum.toString()+"</td></tr>";
        out += "</table>";
        return out;
    }
}
