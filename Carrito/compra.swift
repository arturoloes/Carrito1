//
//  compra.swift
//  Carrito
//
//  Created by user on 06/08/19.
//  Copyright © 2019 Lòpez Estrada Arturo. All rights reserved.
//

import Foundation
import UIKit
class compra{
    var objetoseleccionado: [(objetos, Int, Int)]
    var cantidadTotal: Int
    init() {
        self.objetoseleccionado = []
        self.cantidadTotal = 0
    }
    func cantidadObjetos(cantidad: compra) -> Int{
        var cantidadTotal = 0
        for disco in objetoseleccionado{
            cantidadTotal += disco.1
        }
        return cantidadTotal
    }
    func cantidadPrecio(cantidad: compra) -> Int{
        var cantidadTotal = 0
        for objeto in objetoseleccionado{
            cantidadTotal += objeto.1 * objeto.0.precio
        }
        return cantidadTotal
    }
    func mostrarEnCarro(cantidad: compra){
        for objeto in objetoseleccionado{
            print("\(objeto.0.titulo)")
        }
    }
}


