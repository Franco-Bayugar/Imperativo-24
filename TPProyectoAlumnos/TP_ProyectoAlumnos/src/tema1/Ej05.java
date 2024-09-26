/*
5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto.
 */
package tema1;

import PaqueteLectura.Lector;

public class Ej05 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int clientes = 2, aspectos = 4, i, j;
        int [][] reviews = new int[clientes][aspectos]; // 5x4
        double [] vectorPromedios = new double[5];
        
        
        //Carga Matriz
        for(i = 0; i < clientes; i++){
            for(j = 0; j < aspectos; j++){
                System.out.println("Cliente numero "+ (i+1) + ", ingrese su reseña del aspecto "+(j)); // CORRECCION PARA CLIENTE
                reviews[i][j] = Lector.leerInt(); // OJO ACA NO VA CORRECION, ESTOY GUARDANDO UN VALOR NO ESTOY MODIFICACION EL INGRESO A UNA POSICION
            }
        }
        
        //Carga Vector - me clavo en j (columna) y me voy moviendo en i (fila o cliente)
        for(j = 0; j<aspectos; j++){
            for(i = 0; i< clientes; i++){
                vectorPromedios[j] += reviews[i][j];
            }
            
            vectorPromedios[j] = (double) vectorPromedios[j] / clientes;
        }
        
        
        
        for (i = 0; i < clientes; i++) {
            System.out.println("Promedio aspecto " + (i+1) + ": " + vectorPromedios[i]); // CORRECION PARA CLIENTE
        }
  }
    
}
