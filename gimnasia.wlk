class ABC {}

class Rutina{
    var property tiempo = 0
    var property descanso = 0
    var property intensidad =0

    method cantidadDeCaloriasQuemadas(){
        return 100 * (tiempo - self.descanso()) * self.intensidad()
    }
}

class Running inherits Rutina{

   override method descanso(){
        if(tiempo > 20){
            return 5
        } else {return  2 }
    }

}

class Maraton inherits Running{

   override  method cantidadDeCaloriasQuemadas(){
        return super()*2
    }


}

class Remo inherits Rutina(intensidad = 1.3){

    

   override method descanso(){
        return tiempo/5
   }


}


class RemoDeCompeticion inherits Remo (intensidad = 1.7){
    

   override method descanso(){
        return (super() - 3).max(2)
   }
    
}

class Persona{
    var property kilosPorCalorias = 2
    var property tiempo = 0
    var property peso = 3

method cantidadDeKilosPerdidos(rutina){
    return rutina.cantidadDeCaloriasQuemadas()/ kilosPorCalorias
}

method aplicarRutina(rutina){
    self.validarSiPuedeRealizarLaRutina(rutina)
    peso= peso- self.cantidadDeKilosPerdidos(rutina)
}

method validarSiPuedeRealizarLaRutina(rutina) //METODO ABSTRACTO




}
class Sedentaria inherits Persona(kilosPorCalorias = 7000){


override method validarSiPuedeRealizarLaRutina(rutina){
    if(peso< 50){
        self.error("No es posible aplicar la rutina ya que el peso es menor a 50 kg")
    }
}


}

class Atleta inherits Persona (kilosPorCalorias= 8000, tiempo = 90){

    override method cantidadDeKilosPerdidos(rutina){
         return (rutina.super()-1)
}

    override method validarSiPuedeRealizarLaRutina(rutina){
        if(rutina.cantidadDeCaloriasQuemadas() < 10000){
            self.error("La rutina tiene un gasto menor a diez mil calorias")
        }
    }



}

/*


Personas atletas
Las personas atletas tienen una variación en su fórmula para calcular el peso al practicar una rutina, porque siempre pierden un kilo menos que el resto de las personas

Formula de peso que se pierde al hacer una rutina: (calorias que baja la rutina / kilosPorCaloría) - 1 Nota: La primera parte es igual que la fórmula para todas las personas

La cantidad de kilosPorCaloría de las personas atletas es 8000

El tiempo que ejercita una rutina es siempre 90.

Solo realizan una rutina si las calorías que consumiría al realizarla es mayor a 10000

Ejemplos:

Bob es una persona atleta de peso 40

Al practicar las rutinas del punto anterior peso final es:

Correr en la playa: 40 - ((10200/8000) - 1) = 39.725
Correr la Maraton de BA: 40 - ((25500/8000) - 1) = 37.812
Remar en el delta: No se puede porque las calorías de esta rutina es menor a 10000, el peso se mantiene en 40
Remar en el camino de los remeros: 40 - ((12750/8000) - 1) = 39.406 Nota: Todos los resultados estan truncados a 3 decimales. usar miNumero.truncate(3) en los tests

*/






