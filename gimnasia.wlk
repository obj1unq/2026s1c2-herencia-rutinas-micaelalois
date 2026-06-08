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



/*


Las personas hacen distintas rutinas de ejercicios.

El tiempo que ejercitan una rutina depende del tipo de persona en cuestión

Cuidado, no siempre pueden hacer una rutina, cada tipo de persona tiene su regla

Cuando realizan una rutina su peso baja una cantidad de kilos que dependerá de la cantidad de calorías que quema la rutina durante el tiempo en que la persona la practica, y de la cantidad de kilos por caloría que que depende tipo de persona:

Peso que pierde al hacer una rutina: calorias que baja la rutina en el tiempo que la practica / kilosPorCaloríaQuePierde

Mientras que la primera parte de la fórmula se resolvió en el punto anterior, la segunda se detalla para cada tipo de persona:

Requerimientos:

Saber cuanto peso perdería una persona al aplicar una rutina
Que una persona aplique una rutina alterando su peso
Personas sedentarias:
La cantidad de kilosPorCaloría de las personas sedentarias es 7000

El tiempo que ejercita una rutina se establece para cada persona sedentaria

solo aplican una rutina si su peso es mayor a 50

Ejemplos

Calamardo es una persona sedentaria de peso 60 y usa 5 minutos por rutina

Al practicar las rutinas del punto anterior el peso final es:

Correr en la playa: 60 - (360/7000) = 59.948
Correr la Maraton de BA: 60 - (900/7000) = 59.871
Remar en el delta: 60 - (520/7000) = 59.925
Remar en el camino de los remeros: 60 - (510/7000) = 59.927
Pero si le cambiamos el peso a calamardo para que sea 40, entonces no podría practicar ninguna de esas rutinas, por ejemplo correr en la playa y el peso se mantendría en 40.

Nota: Todos los resultados estan truncados a 3 decimales. usar miNumero.truncate(3) en los tests

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






