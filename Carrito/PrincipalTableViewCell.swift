//
//  PrincipalTableViewCell.swift
//  Carrito
//
//  Created by user on 05/08/19.
//  Copyright © 2019 Lòpez Estrada Arturo. All rights reserved.
//

import UIKit

class PrincipalTableViewCell: UITableViewCell {
    @IBOutlet weak var portadaDisco: UIImageView!
    @IBOutlet weak var tituloDisco: UILabel!
    @IBOutlet weak var precioDisco: UILabel!
    func objetoSeleccionado(objetos: objetos){
        self.portadaDisco.image = objetos.portada
        self.tituloDisco.text = objetos.titulo
        self.precioDisco.text = "$" + String(objetos.precio) + ".00"
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
