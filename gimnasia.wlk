class ABC {}

class Rutina{
    var property tiempo = 0
    var property descanso = 0    //METODO ABSTRACTO //
    var property intensidad = 0 

    method cantidadDeCaloriasQuemadas(){
        return 100 * (tiempo - descanso) * intensidad
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

    override method cantidadDeCaloriasQuemadas(){
        return self.cantidadDeCaloriasQuemadas()*2
    }


}

class Remo inherits Rutina(intensidad = 1.3){



}




