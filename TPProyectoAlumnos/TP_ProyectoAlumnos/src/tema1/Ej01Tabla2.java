/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dimf=11;  
        int [] tabla2 = new int[dimf]; // Como mi vector arranca del 0, y quiero hasta el 10, son 11dimf.
        int i;
        for (i=0; i<dimf ;i++) 
            tabla2[i]=2*i;
        
        for(i= 0; i < dimf; i++)
            System.out.print("Pos" + i + ": " + tabla2[i] + "|");
        
        System.out.println();
        int randomNumber = GeneradorAleatorio.generarInt(12); // Genero hasta el 11, pero incluye el 0.
        while(randomNumber != 11){
            System.out.println("Random Number generado: " + randomNumber);
            System.out.println("Random Number * 2: " + tabla2[randomNumber]);
            System.out.println("----------------");
            randomNumber = GeneradorAleatorio.generarInt(12);
        }
        
        System.out.println("numero " + randomNumber + " generado. Finalizando.");
    }
    
}
