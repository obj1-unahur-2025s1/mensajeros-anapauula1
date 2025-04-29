object paquete{
  var estaPago = false
  var destino = laMatrix // inicializo
  method estaPago() = estaPago
  // muestro la variable
  method pagarPaquete() {estaPago = true} 
  // modifico la variable
  method puedeEntregarse(unMensajero) {
   return destino.dejaPasar(unMensajero) && self.estaPago()
  }
}
object puenteDeBrooklyn{
  method dejaPasar(unMensajero){
    unMensajero.peso() < 1000
    // al mensajero le tenemos que preguntar el peso
  }
  // > <
}
object laMatrix{
  method dejaPasar(unMensajero){
      unMensajero.puedeLlamar()
  }
}
object roberto{
  var trasporte = bicicleta
  method cambiarTrasporte(nuevoTrasporte){
      trasporte = nuevoTrasporte
  }
   method peso() = 90 + trasporte.peso()// metodo vacio
  // trasporte es la variable que esta arriba inicializada en bicicleta
  method puedeLlamar() = false 
}
object chuckNorris{
   method peso() = 80
   method puedeLlamar() = true
}
object neo{
  var tieneCredito = false
  method cambiarCredito(nuevoCredito){
      tieneCredito = nuevoCredito
      // me permite cambiar el estado de la variable
  }
  method peso() = 0
  method puedeLlamar() = tieneCredito
}
object bicicleta{
   method peso() = 5 // la bici pesa siempre cinco
}
object camion{
  var acoplados = 1 // debe conocer la cantidad de acoplados que tienee
  // puede inicializarse en cero o en cualquier numero
  // ponemos 1 porque tenemos qque probarlo en los test
  method cantidadAcoplados(unaCantidad){
     acoplados = unaCantidad
  }
  method peso() = acoplados * 500
  // metodo de consulta(pido que me retorne algo)
}
object empresaMensajeria{
  const mensajeros = #{ } // asi se definen los conjuntos
  // a comparacion de las listas que son [ ] entre corchetes
  // la diferencia entre conjunto y listas es que 
  // la lista va ordenadamente
  // los conjuntos no repiten los elementos
  // a diferencia de la lista que puede tener elementos repetidos
  method mensajeros() = mensajeros // para poder preguntar el conjunto
  method contratar(unMensajero){
      mensajeros.add(unMensajero)
  } 
  method despedir(unMensajero){
      mensajeros.remove(unMensajero)
  }
  method despedirTodos(){
      mensajeros.removeAll(mensajeros)
  }
  method esGrande(){
    mensajeros.size()  > 2
    // el tamaño de la lista debe de ser mayor a 2 ( de la coleccion)
  }
  method puedeEntregarsePaquete(){
    // no deberiamos d pasarle el parametro --> porque hay uno solo
    return paquete.puedeEntregarse(mensajeros.first()) 
    // metodo de consulta, le pregunto si puede entregarse
    // por el primer mensajero de la lista
  }
  method pesoUltimoMensajero() = mensajeros.last().peso()
  // para saber el ultimo mensajero de la empresa
}
