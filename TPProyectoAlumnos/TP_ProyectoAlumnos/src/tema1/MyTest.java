/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema1;

/**
 *
 * @author kas
 */
import PaqueteLectura.Lector;
public class MyTest {
    public static void main(String[] args) {

        System.out.println("Ingrese su Nombre: ");
        String name = Lector.leerString();
        
        System.out.println("Ingrese su DNI: ");
        int dni = Lector.leerInt();
        
        System.out.println("Su informacion ingresada es: NOMBRE: " + name + ", DNI: " + dni);
        
        System.out.println(++dni);
        
        int Resto = 16 % 3;
        System.out.println("Resto: " + Resto);
        
        int Division = 11 / 2;
        System.out.println("Division: " + Division); 
        
        double DivisionReales = 11.0 / 2.0;
        System.out.println("Division reales: " + DivisionReales);
    }
}
