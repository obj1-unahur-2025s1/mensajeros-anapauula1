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
  method precioTotal() = 50
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
  var acoplados = 1 
  method cantidadAcoplados(unaCantidad){
     acoplados = unaCantidad
  }
  method peso() = acoplados * 500
}
// ----------------- Tercera Parte -------------

object paquetito{
  method precioTotal() = 0
  // porque es gratis
   method estaPago() = true
   // siempre esta pago
   method puedeEntregarse(unMensajero) = true
   // cualquier mensajero lo puede entregar
}
object paquetonViajero{
   const destinos = [ ] // tie
   var importePagado = 0

  // 1) precio de 100 x cada destino
  method precioTotal(){
    return 100 * destinos.size()
    // el tamaño de la lista, multiplicamos
  }
  // 2) pago total para ser enviado
  method estaPago(){
    return importePagado >= self.precioTotal()
    // igual al precio total
  }
  method puedeEntregarse(unMensajero){
    return self.precioTotal() && self.mensajeroPuedepasar(unMensajero)
  }
  // 3) mensajero ---> pasa a todos los destinos
  method mensajeroPuedepasar(unMensajero){
    return destinos.all({p => p.dejaPasar(unMensajero)})
    // dejaPasar ---> metodo que hciimos en la matrix y puente
  }
}
object empresaMensajeria{
  const mensajeros = #{ } // asi se definen los conjuntos
  // a comparacion de las listas que son [ ] entre corchetes
  // la diferencia entre conjunto y listas es que 
  // la lista va ordenadamente
  // los conjuntos no repiten los elementos
  // a diferencia de la lista que puede tener elementos repetidos
  method mensajeros() = mensajeros // para poder preguntar el conjunto
  const paquetesPendientes = []
  const paquetesEnviados = []
   // 1) 
    method contratar(unMensajero){
        return mensajeros.add(unMensajero)
    }
    // 2)
    method despedir(unMensajero){
        return mensajeros.remove(unMensajero)
    }
    // 3)
    method despedirTodos(){
        // elimina a todos los elementos de c
        return mensajeros.clear()
        // no se pasa parametro
    }
    // 4)
    method esGrande(){
      mensajeros.size()  > 2
    // el tamaño de la lista debe de ser mayor a 2 ( de la coleccion)
  }
    // 5) 
    method puedeEntregarsePaquete(){
    // no deberiamos d pasarle el parametro --> porque hay uno solo
      return paquete.puedeEntregarse(mensajeros.first()) 
  }
    // 6)
    method pesoUltimo(){
        return mensajeros.last().peso()
    }

    // --------- ULTIMA PARTE -----------------
    //1)
    method puedeSerEnviado(unPaquete){
      return mensajeros.any({m => unPaquete.puedeEntregarse(m)})
      // aca ponemos m ---> mensajero
      // para ver si el m que es el mensajero que recorre la lista
      // puede entregar el paquete
    }
    // 2)
    method puedenEntregar(unPaquete){
      return mensajeros.filter({m => unPaquete.puedeEntregarse(m)})
    }
    // 3)
    method tieneSobrepeso(){
      return self.pesoDeLosMensajeros() / mensajeros.size() > 500
    }
    method pesoDeLosMensajeros(){
      // sumamos el peso de los mensajeros
        return mensajeros.sum({s => s.peso()})
    }
    method facturacionEmpresa(){
      return mensajeros.sum({s => s.precioTotal()})
    }
    method enviarPaquetes(listaDePaquetes){
      return listaDePaquetes.forEach({x => self.enviar(x)})
    }
    method enviar(unPaquete){
      if (self.puedenEntregar(unPaquete)){
          paquetesEnviados.add(unPaquete)
      }
      else{
        paquetesPendientes.add(unPaquete)
      }
    }
    method pendienteMasCaro(){
      return paquetesPendientes.max({x=> x.precioTotal()})
    }
}
