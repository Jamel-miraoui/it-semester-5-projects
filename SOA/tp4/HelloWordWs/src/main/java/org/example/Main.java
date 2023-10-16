package org.example;
import javax.xml.ws.Endpoint;

public class Main {
    public static void main(String[] args) {
        String url = "http://localhost:8585/";
        Endpoint.publish(url, new HelloWS());
        System.out.println(url);
    }
}