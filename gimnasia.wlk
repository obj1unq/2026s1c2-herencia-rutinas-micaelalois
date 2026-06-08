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

//Problemas con el tiempo 
class Club {
    var property predios = []

    method mejorPredioPara(persona){
        return predios.max({predio => predio.rutinas().cantidadDeCaloriasQuemadas()})

    }

    method prediosTranquisPara(persona){
        return predios.any({predio => predio.rutinas().cantidadDeCaloriasQuemadas()<500})

    }

    method rutinaMasExigentePara(persona){
        return predios.map({rutina => rutina.max({predios.rutinas().cantidadDeCaloriasQuemadas()})})
    }

   
}

class Predio{
    var property rutinas = []

    
}
/*
Un club tiene varios predios De un predio se conoce las rutinas que se pueden practicar Se pide:

El mejor predio de un club para una persona: Es el predio que más calorías le haría quemar a esa persona si ésta practicara
 todas las rutinas una vez.

Los predios tranquis de un club para una persona: Es el conjunto de predios que tienen al menos una rutina que le hace gastar menos
 de 500 calorias a la persona

Las rutinas más exigentes del club para una persona: Es el conjunto formado por la rutina más exigente de cada predio para esa persona.
 La rutina más exigente es la que más calorías le hace quemar a esa persona

** Ejemplos **

El club barrial tiene dos predios. El náutico, desde dónde se puede remar en el delta y en el camino de los remeros, y el recreo, dónde se puede correr por la playa y correr la maratón de buenos aires.

El mejor predio del club barrial para bob es el recreo. Ya que le hace gastar 35700 mientras que náutico le hace gastar 22110

El mejor predio del club barrial para calamardo es el recreo. Ya que le hace gastar 1260 mientras que náutico le hace gastar 1030

Para bob no hay predios tranquis en el club barrial,

Para calamardo, el conjunto de predios tranquis solo tiene a el recreo, ya que ahí puede correr por la playa gastando solo 360 calorías

-para bob las rutinas más exigentes del club barrial son la maratón de buenos aires y remar en el camino de los remeros.

-para calamardo las rutinas más exigentes del club barrial son la maratón de buenos aires y remar en el delta.

*/





