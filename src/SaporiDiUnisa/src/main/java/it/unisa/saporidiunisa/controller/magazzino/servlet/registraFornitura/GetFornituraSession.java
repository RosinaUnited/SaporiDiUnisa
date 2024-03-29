package it.unisa.saporidiunisa.controller.magazzino.servlet.registraFornitura;

import it.unisa.saporidiunisa.model.entity.Fornitura;
import it.unisa.saporidiunisa.utils.Patterns;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.val;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;

/**
 * Servlet, invocata tramite AJAX, che ritorna l'oggetto fornitura in sessione
 * @author Salvatore Ruocco
 */
@WebServlet(name = "GetFornituraSession", value = "/GetFornituraSession")
public class GetFornituraSession extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        final HttpSession session = req.getSession();
        val fornitura = (Fornitura) session.getAttribute("fornitura");

        val jsonArray = new JSONArray();
        for(val l : fornitura.getLotti()){
            val json = new JSONObject();
            json.put("nome", l.getProdotto().getNome());
            json.put("marchio", l.getProdotto().getMarchio());
            json.put("prezzo", String.format("%.2f €", l.getCosto() / l.getQuantita()));
            json.put("quantita", l.getQuantita());
            json.put("dataScadenza", l.getDataScadenza().format(Patterns.DATE_TIME_FORMATTER));
            jsonArray.put(json);
        }
        resp.setContentType("application/json");
        resp.getWriter().write(jsonArray.toString());
    }
}
