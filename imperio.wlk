//Punto 1
class Tarea{

    method recursosProducidos(tiempo) {
        return 50 * (tiempo - self.desgaste(tiempo)) * self.nvlEsfuerzo()
    }

    method desgaste(tiempo)
    method nvlEsfuerzo()
}

class Siembra inherits Tarea {
    var property nvlEsfuerzo

    override method desgaste(tiempo) {
        return 1.max(1 + tiempo - self.jornada())
    }

    method jornada()
}

class SiembraEnElValle inherits Siembra {
    var property mes
    override method jornada() {
        return 8
    }

    override method recursosProducidos(tiempo) {
        return if(mes.between(6, 12)) 0 else super(tiempo)
    }
}

class SiembraEnTerrazas inherits Siembra {
    override method jornada() {
        return 6
    }

    override method recursosProducidos(tiempo) {
        return 3 * super(tiempo)
    }
}

class Mensaje inherits Tarea {

    override method nvlEsfuerzo(){
        return 1.4
    }

    override method desgaste(tiempo) {
        return tiempo / 4 
    }


}

class MensajeImperial inherits Mensaje {
    override method nvlEsfuerzo() {
        return 1.8
    }

    override method desgaste(tiempo) {
        return (super(tiempo) - 2).max(1)
    }
}