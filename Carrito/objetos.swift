//
//  objetos.swift
//  Carrito
//
//  Created by user on 04/08/19.
//  Copyright © 2019 Lòpez Estrada Arturo. All rights reserved.
//

import Foundation
import UIKit
class objetos{
    var portada: UIImage
    var titulo: String
    var precio: Int
    
    init(portada: UIImage, titulo: String, precio: Int) {
        self.portada = portada
        self.titulo = titulo
        self.precio = precio
    }
}
