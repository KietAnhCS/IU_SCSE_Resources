

import javax.servlet.http.*;

public class CookieUtilities {
    public static String getCookieValue
            (HttpServletRequest request,
            String cookieName,
            String defaultValue){
        Cookie[] cookies=request.getCookies();
        if(cookies!=null){
            for(int i=0;i<cookies.length; i++){
                Cookie cookie= cookies[i];
                if(cookieName.equals(cookie.getName())){
                    return(cookie.getValue());
                }
            }

        }
    return(defaultValue);
    }
        public static Cookie getCookie(HttpServletRequest request,
                String cookieName){
      Cookie[] cookies=request.getCookies();
      if(cookies!=null){
          for(int i=0; i<cookies.length; i++){
              Cookie cookie= cookies[i];
              if(cookieName.equals(cookie.getName())){
                 return (cookie);
              }
          }
        }
      return (null);
    }
}
