/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Vo Duy Khoi
 */


import java.io.*;
import org.xml.sax.*;
import org.xml.sax.helpers.*;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;

public class PrintBookData extends DefaultHandler {
    private String currentElement = "";
   public void startElement( String uri, String eleName,
      String raw, Attributes attributes ) throws SAXException
   {
       if (eleName.equals("id")) 
           currentElement = "id";
   }

   // method called at the end tag of an element
   public void endElement( String uri, String eleName,
      String raw ) throws SAXException
   {
      currentElement = "";
   }

   // method called when characters are found
    @Override
   public void characters( char buffer[], int offset,
      int length ) throws SAXException
   {
      if (( length > 0 ) && currentElement.equals("id")) {
         String temp = new String( buffer, offset, length );

         int value = Integer.parseInt(temp.trim());
         System.out.print("Old value: " + value);
         System.out.println("New value: " + (value + 1));
      }
   }

   // main method
   public static void main( String args[] )
   {

     try {
         XMLReader saxParser = ( XMLReader ) Class.forName(
            "org.apache.xerces.parsers.SAXParser" ).newInstance();

         saxParser.setContentHandler( new PrintBookData() );
         FileReader reader = new FileReader( "BookData.xml" );
         saxParser.parse( new InputSource( reader ) );
      }
      catch ( SAXParseException spe ) {
         System.err.println( "Parse Error: " + spe.getMessage() );
      }
      catch ( SAXException se ) {
         se.printStackTrace();
      }
      catch ( Exception e ) {
         e.printStackTrace();
      }

      System.exit( 0 );
   }
}