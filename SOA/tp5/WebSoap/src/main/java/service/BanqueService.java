package service;
import org.example.Compte;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebService(name = "BanqueWS")
public class BanqueService {
    @WebMethod(operationName = "conversioneurodinars")
    public double conversion(@WebParam(name = "montant") double montant) {
        return montant * 3.5;
    }

    @WebMethod
    public Compte getCompte(@WebParam(name = "code") Long code) {
        return new Compte(code, Math.random() * 90000, new Date());
    }

    @WebMethod
    public List<Compte> listComptes() {
        List<Compte> comptes = new ArrayList<>();
        comptes.add(new Compte(1L, Math.random() * 90000, new Date()));
        return comptes;
    }
}