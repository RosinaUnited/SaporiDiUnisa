package it.unisa.saporidiunisa.controller.scaffale.servlet;

import it.unisa.saporidiunisa.controller.scaffale.ScaffaleController;
import it.unisa.saporidiunisa.model.entity.Dipendente;
import it.unisa.saporidiunisa.utils.Messages;
import it.unisa.saporidiunisa.utils.Utils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.val;

import java.io.IOException;

/**
 * La servlet <code>EliminaScaduti</code> elimina gli scaduti dallo scaffale
 * @author Simone Vittoria
 */
@WebServlet(name = "EliminaScaduti", value = "/EliminaScaduti")
public class EliminaScaduti extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        val session = req.getSession();

        val dipendente = (Dipendente)session.getAttribute("dipendente");
        if (dipendente == null || dipendente.getRuolo() != Dipendente.Ruolo.MAGAZZINIERE)
        {
            Utils.dispatchError(Messages.NO_PERMISSIONS, req, resp);
            return;
        }

        ScaffaleController.eliminaScadutiScaffale();

        Utils.dispatchSuccess(Messages.SUCCESS, req, resp);
    }

}
