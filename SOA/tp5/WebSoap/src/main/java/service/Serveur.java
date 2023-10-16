package service;
import javax.xml.ws.Endpoint;


public class Serveur {
    public static void main(String[] args) {
        String url = "http://localhost:8086/";
        Endpoint.publish(url, new BanqueService());
        System.out.println("Web Service déployé sur " + url);
    }
}