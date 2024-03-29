package it.unisa.saporidiunisa.model.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Prodotto
{
    private int id;
    private String nome;
    private String marchio;
    private float prezzo;
    private float prezzoScontato;
    private LocalDate inizioSconto;
    private LocalDate fineSconto;
    private byte[] foto;

    public boolean isSconto()
    {
        return this.fineSconto != null && this.fineSconto.isAfter(LocalDate.now());
    }


    public String getInfo() {
        return "Nome prodotto: " + nome +
                ", marchio: " + marchio +
                ", prezzo prodotto: " + prezzo;
    }
}