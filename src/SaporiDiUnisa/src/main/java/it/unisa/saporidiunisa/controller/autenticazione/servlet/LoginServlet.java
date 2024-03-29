package it.unisa.saporidiunisa.controller.autenticazione.servlet;

import it.unisa.saporidiunisa.controller.autenticazione.AutenticazioneController;
import it.unisa.saporidiunisa.utils.Messages;
import it.unisa.saporidiunisa.utils.Patterns;
import it.unisa.saporidiunisa.utils.Utils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.val;

import java.io.IOException;

/**
 * La servlet <code>loginServlet</code> consente di effettuare il login al sistema con un account
 * @author Antonio Facchiano, Gianmarco Riviello
 */
@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        val pin = request.getParameter("pin");
        if (pin == null)
        {
            Utils.dispatchError(Messages.INVALID_FIELD.formatted("pin"), request, response);
            return;
        }

        val matcherPin = Patterns.LOGIN_PIN.matcher(pin);
        if (!matcherPin.matches())
        {
            Utils.dispatchError(Messages.INVALID_FORMAT.formatted("pin"), request, response);
            return;
        }

        val dipendente = AutenticazioneController.login(pin);
        if (dipendente == null)
        {
            Utils.dispatchError(Messages.NOT_FOUND.formatted("dipendente"), request, response);
            return;
        }

        request.getSession().setAttribute("dipendente", dipendente);
        response.sendRedirect("view/select/" + switch (dipendente.getRuolo())
        {
            case ADMIN -> "admin.jsp";
            case CASSIERE -> "cassiere.jsp";
            case MAGAZZINIERE -> "magazziniere.jsp";
            case FINANZE -> "finanze.jsp";
        });
    }
}

