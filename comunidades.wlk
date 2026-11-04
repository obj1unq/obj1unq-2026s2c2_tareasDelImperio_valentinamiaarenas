//Punto 3
class Ayllu {
    var property colcas = #{}

    method laMejorColcaPara(habitante) {
        return colcas.max({colcaActual => colcaActual.recursosProducidos(habitante)})
    }

    method colcasSuavesPara(habitante) {
        return colcas.filter({colcaActual => colcaActual.tieneAlgunaTareaSuave(habitante)})
    }

    method tareasMasDificilesPara(habitante) {
        return colcas.map({colcaActual => colcaActual.tareaMasExigentePara(habitante)})
    }
}

class Colca {
    var property tareas = #{}

    method recursosProducidos(habitante) {
        return tareas.sum({tareaActual => tareaActual.recursosProducidos(habitante.tiempo())})
    }

    method tieneAlgunaTareaSuave(habitante) {
        return tareas.any({tareaActual => tareaActual.recursosProducidos(habitante.tiempo()) < 200})
    }

    method tareaMasExigentePara(habitante) {
        return tareas.max({tareaActual => tareaActual.recursosProducidos(habitante.tiempo())})
    }
}