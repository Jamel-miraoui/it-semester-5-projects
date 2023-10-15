package org.example;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.File;

public class Main {
    public static void main(String[] args) throws JAXBException {
// création d'un contexte JAXB sur la classe Message
        JAXBContext context = JAXBContext.newInstance(Message.class) ;
// création d'un unmarshaller
        Unmarshaller unmarshaller = context.createUnmarshaller() ;
        Message message= (Message)unmarshaller.unmarshal(new File("message.xml"));
        System.out.println("From = " + message.getFrom());
        System.out.println("To = " + message.getTo()) ;
        System.out.println("Text = " + message.getText()) ;
    }
}