/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int filas = 5, columnas = 5, i, j, filaSuma = 0;
        int [][] MatrizRandoms = new int[filas][columnas];
        
        
        //Cargar Matriz random
        for(i = 0; i < filas; i++){
            for(j = 0; j < columnas; j++){
                MatrizRandoms[i][j] = GeneradorAleatorio.generarInt(10);
            }
        }
        
        //Imprimir Matriz
        for(i= 0; i < filas; i++){
            for(j = 0; j < columnas; j++){
                    System.out.print(MatrizRandoms[i][j] + "|");
                }
            System.out.println();
        }
        
        // Informar suma de la fila 1.. recordar que arranca por la [0.0]
        for(j = 0; j < columnas; j++){
            filaSuma += MatrizRandoms[1][j];
        }
        
        System.out.println("Suma fila 1: " + filaSuma);
        
        
        // Sumar columna correspondiente a la posicion de un vector contador
        int [] VectorContador = new int[5];
        
        
        for(j = 0; j < VectorContador.length; j++){
            for(i = 0; i < filas; i++){
                VectorContador[j] += MatrizRandoms[i][j];
            }
        }
        
        System.out.println("Vector contador actualizado");
        for(i = 0; i < VectorContador.length; i++){
            System.out.println(VectorContador[i]);
        }
        
        // Leer y si se encuentra informar fila y columna
        System.out.println("Ingrese int a buscar: ");
        int IntABuscar = Lector.leerInt();
        boolean flag = false;
        
        for(i = 0; i < filas; i ++) {
            for(j = 0; j < columnas; j++){
                if(IntABuscar == MatrizRandoms[i][j]) {
                  flag = true;
                  System.out.println("Encontrado en fila "+ i +" columna "+ j);
                }
            }
        }
        if(!flag){
            System.out.println("No se encontro el elemento");
        }
    }
}
            
            
