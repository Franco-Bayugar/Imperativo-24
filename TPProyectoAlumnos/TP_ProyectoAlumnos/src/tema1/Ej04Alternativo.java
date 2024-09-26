/*
4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido.
*/
package tema1;

import PaqueteLectura.Lector;

public class Ej04Alternativo {
    public static void main(String[] args) {
        //deficion de matriz y variables
        
        /*
        NOTA: YO CUENTO DEL 1-8, LA COMPUTADORA DEL 0-7 -> AMBOS CONTAMOS 8 ELEMENTOS
        
        POR ENDE, YO HUMANO, VOY A INGRESAR 1-8 PERO TENGO QUE HACER QUE LA COMPUTADORA LO RECIBA COMO 0-7
        PARA ESO HAGO QUE IMPLICITAMENTE LA COMPUTADORA RECIBA MI VALOR Y LE RESTE 1.
        
        SI INGRESO:
        
          1 LA COMPUTADORA RECIBE 1 Y LO TRABAJA COMO 0.
          8 LA COMPUTADORA RECIBE 7, LE RESTA 1 Y LO TRABAJA COMO 7.
        
        PARA IMPRIMIR, COMO LOS FOR TRABAJAN IMPLICITAMENTE, TENGO QUE USAR DESDE EL 0 AL TOPE.
        Y LUEGO CORREGIR LA INFORMACION QUE SALE, PARA ELLO SUMO 1 A LAS VARIABLES I/J.
        
        POR QUE? PORQUE I TOMA 0, PERO QUIERO QUE EL USUARIO LO VEA COMO 1.
        */
        int pisos = 8, oficinas = 4, PisoDeseado, OficinaDeseada;
        int [][] MatrizEdificio = new int [pisos][oficinas];
        
        System.out.print("Ingrese Piso (1-8): ");
        PisoDeseado = Lector.leerInt();
        System.out.print("Ingrese Oficina (1-4): ");
        OficinaDeseada = Lector.leerInt();
        System.out.println();
        
        while(PisoDeseado != 9) {
            MatrizEdificio[PisoDeseado - 1][OficinaDeseada - 1]++; // correccion para la pc, ACA MODIFICO UNA POSICION NO VALOR, POR ESO LA CORRECION
            
            System.out.print("Ingrese Piso (1-8): ");
            PisoDeseado = Lector.leerInt();
            System.out.print("Ingrese Oficina (1-4): ");
            OficinaDeseada = Lector.leerInt();
            System.out.println();
        }
        
        for(int i = 0; i < pisos; i++){ // i = 0 siempre porque matrices y vectores son indexados desde 0s
            for(int j = 0; j < oficinas; j++){
                System.out.println("Piso " + (i+1) + " Oficina " + (j+1) + ": " + MatrizEdificio[i][j]); // correccion para el usuario
            }
        }
        
    }
    
    
    // RECIBO DATA DEL USUARIO -> CORRIJO CON -1
    // DEVUELVO DATA AL USUARIO -> +1
    
}
