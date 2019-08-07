//
//  ListaCompraViewController.swift
//  Carrito
//
//  Created by user on 05/08/19.
//  Copyright © 2019 Lòpez Estrada Arturo. All rights reserved.
//

import UIKit

class ListaCompraViewController: UIViewController {
    @IBOutlet weak var tableCompra: UITableView!
    @IBOutlet weak var compraagregarCarrito: compraagregarCarrito!
    var objetoSeleccionado: PrincipalViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    func setupUI(){
        tableCompra.delegate = self
        tableCompra.dataSource = self
        if objetoSeleccionado.cantidad.cantidadObjetos(cantidad: objetoSeleccionado.cantidad) == 0{
            compraagregarCarrito.isHidden = true
        }
        tableCompra.separatorColor = .clear
    }
    @IBAction func quitarObjeto(_ sender: UIButton){
        let mensaje = UIAlertController(title: "Alerta", message: "¿Quiere quitar este objeto?", preferredStyle: .alert)
        self.present(mensaje, animated: true, completion: nil)
        mensaje.addAction(UIAlertAction(title: "Quitar", style: .default, handler: { (action) in
            self.objetoSeleccionado.cantidad.objetoseleccionado.remove(at: sender.tag)
            self.tableCompra.reloadData()
            self.setupUI()
        }))
        mensaje.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action) in
        }))
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
extension ListaCompraViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objetoSeleccionado.cantidad.objetoseleccionado.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let objeto = self.objetoSeleccionado.cantidad.objetoseleccionado[indexPath.row]
        let cell = tableCompra.dequeueReusableCell(withIdentifier: "listaCompraCell") as! ListaCompraTableViewCell
        cell.ObjetoenLista(objetoCarro: objeto.0, cantidad: objeto.1)
        cell.quitarObjeto.tag = indexPath.row
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
