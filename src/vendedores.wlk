import ciudad.*

class Vendedor {

var property certificaciones = #{}

method puedeTrabajar(c)

method esVersatil() = certificaciones.size() >= 3 and certificaciones.any({ c => c.esProducto() }) and certificaciones.any({ c => not c.esProducto() })

method esFirme()= certificaciones.sum({c=>c.puntos()})>=30
method esInfluyente()
}

class VendedorFijo inherits Vendedor {

var property ciudad

override method puedeTrabajar(c) = ciudad == c
override method esInfluyente()=false
}

class VendedorViajante inherits Vendedor {

var property puedeTrabajarEn = #{}

override method puedeTrabajar(c) = puedeTrabajarEn.contains(c)
override method esInfluyente()= puedeTrabajarEn.sum({c=>c.poblacion()})>=10000000
}

class ComercioCorresponsal inherits Vendedor {

var property sucursales = #{}
method agregarSucursal(ciudad){
	sucursales.add(ciudad)
}
override method puedeTrabajar(c) = sucursales.contains(c)
override method esInfluyente(){
var map=sucursales.map({c=>c.provincia()})

return sucursales.size()>=5 or map.asSet().size()>=3
}
}

class Certificaciones {

var property esProducto = false
var property puntos = 0

}