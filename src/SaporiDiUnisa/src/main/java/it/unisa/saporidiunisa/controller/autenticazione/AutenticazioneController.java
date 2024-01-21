package it.unisa.saporidiunisa.controller.autenticazione;

import it.unisa.saporidiunisa.model.dao.DipendenteDAO;
import it.unisa.saporidiunisa.model.entity.Dipendente;

/**
 * @author Riviello Gianmarco
 * Un oggetto <code>AutenticazioneController</code> mette il relazione il dabatabase con tutti i metodi messi a disposizione per l'autenticazione. Da richiamare nelle servlet
 */
public class AutenticazioneController
{
    /**
     * Effettua il login dei dipendenti verificando i propri pìn
     * @param pin pin del dipendente
     * @return Dipendente loggato oppure null nel caso non esista nel db
     */
    public static Dipendente login(String pin)
    {
        return DipendenteDAO.findDipendenteByPin(pin);
    }

    /**
     * Effettua la modifica del pin in un ruolo da parte dell'admin.
     * @param newPin pin nuovo da modificare nel dipendente
     * @param ruolo ruolo al quale modificare il pin
     * @return booleano di conferma
     */
    public static boolean modificaPin(String newPin, Dipendente.Ruolo ruolo)
    {
        return DipendenteDAO.updatePin(newPin,ruolo);
    }
}
