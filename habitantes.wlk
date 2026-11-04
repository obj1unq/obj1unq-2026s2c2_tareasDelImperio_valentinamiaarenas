import imperio.*
//Punto 2
class Persona{
    var property energia

    method realizarTarea(tarea) {
        self.validarTarea(tarea)
        self.perderEnergia(tarea)

    }
    
    method validarTarea(tarea) {
        if(self.condicion(tarea)) {
            self.error("No tiene suficiente energia para realizar la tarea")
        }
    }

    method energiaPerdida(tarea) {
        return tarea.recursosProducidos(self.tiempo()) / self.indiceDeRecistencia()
    }

    method perderEnergia(tarea){
        energia -= self.energiaPerdida(tarea)
    }

    method condicion(tarea) {
        return energia - self.energiaPerdida(tarea) < 0
    }
    
    method indiceDeRecistencia()
    method tiempo()
}

class Campesina inherits Persona {
    var property tiempo 
    override method indiceDeRecistencia() {
        return 10
    }
}

class Elite inherits Persona {
    override method indiceDeRecistencia() {
        return 12
    }

    override method energiaPerdida(tarea) {
        return super(tarea) - 5
    }

    override method tiempo() {
        return 10
    }

    override method validarTarea(tarea) {
        if(self.condicion(tarea)) {
            self.error("Los recursos generados no son suficientes para realizar la tarea")
        }
    }

    override method condicion(tarea) {
        return super(tarea) && tarea.recursosProducidos(self.tiempo()) > 500
    }
}