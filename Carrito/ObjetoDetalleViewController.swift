//
//  ObjetoDetalleViewController.swift
//  Carrito
//
//  Created by user on 05/08/19.
//  Copyright © 2019 Lòpez Estrada Arturo. All rights reserved.
//

import UIKit

class ObjetoDetalleViewController: UIViewController {
    @IBOutlet weak var portadaDisco: UIImageView!
    @IBOutlet weak var tituloDisco: UILabel!
    @IBOutlet weak var precioDisco: UILabel!
    @IBOutlet weak var contadorObjetos: UITextField!
    @IBOutlet weak var regreso: UIButton!
    var objeto = objetos(portada: UIImage(named: "Disco de prueba")!, titulo: "Disco de prueba para el titulo", precio: 99)
    var objetoSeleccion: PrincipalViewController!
    var contar: Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        portadaDisco.image = objeto.portada
        tituloDisco.text = objeto.titulo
        precioDisco.text = "$" + String(objeto.precio) + ".00"
        //navigationController?.isNavigationBarHidden = true
        //regreso.setTitle("x", for: .normal)
        contadorObjetos.text = String(contar)

        // Do any additional setup after loading the view.
    }
    @IBAction func regresoView(_ sender: Any){
        navigationController?.isNavigationBarHidden = false
        navigationController?.popViewController(animated: true)
    }
    @IBAction func agregarCarro(_ sender: compraagregarCarrito){
    objetoSeleccion.cantidad.objetoseleccionado.append((objeto, contar, objeto.precio * contar))
        navigationController?.isNavigationBarHidden = false
        navigationController?.popViewController(animated: true)
    }
    @IBAction func masUno(_ sender: Any){
        if contar < 99{
            contar += 1
            contadorObjetos.text = String(contar)
            precioDisco.text = "$" + String(objeto.precio * contar) + ".00"
        }
    }
    @IBAction func menosUno(_ sender: Any){
        if contar > 1{
            contar -= 1
            contadorObjetos.text = String(contar)
            precioDisco.text = "$" + String(objeto.precio * contar) + ".00"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
