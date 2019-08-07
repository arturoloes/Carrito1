//
//  ListaCompraTableViewCell.swift
//  Carrito
//
//  Created by user on 05/08/19.
//  Copyright © 2019 Lòpez Estrada Arturo. All rights reserved.
//

import UIKit

class ListaCompraTableViewCell: UITableViewCell {
    @IBOutlet weak var disciPortada: UIImageView!
    @IBOutlet weak var discoTitulo: UILabel!
    @IBOutlet weak var discoPrecio: UILabel!
    @IBOutlet weak var quitarObjeto: UIButton!
    @IBOutlet weak var discoCantidad: UILabel!
    func ObjetoenLista(objetoCarro: objetos, cantidad: Int){
        self.disciPortada.image = objetoCarro.portada
        self.discoTitulo.text = objetoCarro.titulo
        self.discoPrecio.text = "Precio: $" + String(objetoCarro.precio) + ".00"
        self.discoCantidad.text = "Cantidad: " + String(cantidad)
        self.quitarObjeto.imageView?.image = UIImage(named: "tache")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
