
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        // declaracion de variables
        double [] VectorAlturas = new double[15]; // yendo del 0..14, acá tendría que arrancar de 1 si fuese un programa operado por un ser humano?
        int i;
        double total = 0, promedio = 0, cantTotalMayoresPromedio = 0;
        
        // carga del vector
        
        for(i=0; i<VectorAlturas.length; i++){
            VectorAlturas[i] = GeneradorAleatorio.generarDouble(300);
            System.out.println("Posicion: " + i);
            System.out.println("Altura generada: " + VectorAlturas[i]);
            total += VectorAlturas[i];
            System.out.println("----------");
        }
        
        promedio = (double) total / VectorAlturas.length;
        System.out.println("Promedio de Alturas: " + promedio);
        
        for(i=0; i < VectorAlturas.length; i++)
            if(VectorAlturas[i] > promedio)
                cantTotalMayoresPromedio++;
        
        System.out.println("Cantidad total de Mayores al promedio: " + cantTotalMayoresPromedio);
    }
    
}
