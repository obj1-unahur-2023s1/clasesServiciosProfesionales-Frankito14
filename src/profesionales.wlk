// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
}


// a esta clase le faltan métodos
class ProfesionalVinculado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() = [universidad.provincia()] 
	method honorariosPorHora() = universidad.honorariosRecomendados()
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var universidad
	var property honorariosPorHora
	var property provinciasDondePuedeTrabajar
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
}

class Universidad{
	const property provincia
	const property honorariosRecomendados
	
}

class Empresa{
	var property honorarios
	const property profesionales = []
	
	method profesionalesDeUniversidad(uni) = profesionales.count({profesional => profesional.universidad()==uni})
	method profesionalesCaros() = profesionales.filter({prof=>prof.honorariosPorHora()>honorarios})
	method universidadesDeProfesionales() = profesionales.map({prof=>prof.universidad()}).asSet()
	method profesionalMasBarato() = profesionales.min({prof=>prof.honorariosPorHora()})
	method genteAcotada() = profesionales.all({prof=>prof.provinciasDondePuedeTrabajar().size()<=3})
	
}
