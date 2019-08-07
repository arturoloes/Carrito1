//
//  PrincipalViewController.swift
//  Carrito
//
//  Created by user on 01/08/19.
//  Copyright © 2019 Lòpez Estrada Arturo. All rights reserved.
//

import UIKit

class PrincipalViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var compraCarro: UIImageView!
    @IBOutlet weak var objetosCantidad: UILabel!
    @IBOutlet weak var precioTotalCompra: UILabel!
    @IBOutlet weak var reportePreliminar: UIView!
    var objeto: [objetos] = []
    var cantidad = compra()
    var totalDiscos = Int()
    var precioTotal = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        objeto = creaObjeto()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        totalDiscos = cantidad.cantidadObjetos(cantidad: cantidad)
        precioTotal = cantidad.cantidadPrecio(cantidad: cantidad)
        objetosCantidad.text = "Objetos:  " + String(totalDiscos)
        precioTotalCompra.text = "Pago:  " + String(precioTotal)
    }
    func creaObjeto() -> [objetos]{
        var temp: [objetos] = []
        let disco1 = objetos(portada: UIImage(named: "d1")!, titulo: "MPLLETC (MIX PA LLORAR EN TU CUARTO)", precio: 99)
        let disco2 = objetos(portada: UIImage(named: "d2")!, titulo: "TRANSICIONES", precio: 88)
        let disco3 = objetos(portada: UIImage(named: "d3")!, titulo: "CONEXION (CD + DVD)", precio: 154)
        let disco4 = objetos(portada: UIImage(named: "d4")!, titulo: "SE HABLA ESPAÑOL (CD + DVD)", precio: 119)
        let disco5 = objetos(portada: UIImage(named: "d5")!, titulo: "HOMERUN", precio: 132)
        let disco6 = objetos(portada: UIImage(named: "d6")!, titulo: "OASIS", precio: 106)
        let disco7 = objetos(portada: UIImage(named: "d7")!, titulo: "EMILIO", precio: 116)
        let disco8 = objetos(portada: UIImage(named: "d8")!, titulo: "ESTO SI ES CUMBIA (CD + DVD)", precio: 154)
        let disco9 = objetos(portada: UIImage(named: "d9")!, titulo: "90'S POP TOUR 3 (2 CD'S + DVD)", precio: 164)
        let disco10 = objetos(portada: UIImage(named: "d10")!, titulo: "NO. 6 COLLABORATIONS PROJECT", precio: 176)
        let disco11 = objetos(portada: UIImage(named: "d11")!, titulo: "TRENCH", precio: 176)
        let disco12 = objetos(portada: UIImage(named: "d12")!, titulo: "WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?", precio: 198)
        let disco13 = objetos(portada: UIImage(named: "d13")!, titulo: "MADAME X", precio: 123)
        let disco14 = objetos(portada: UIImage(named: "d14")!, titulo: "AMOEBA GIG", precio: 157)
        let disco15 = objetos(portada: UIImage(named: "d15")!, titulo: "HAPPINESS BEGINS", precio: 123)
        let disco16 = objetos(portada: UIImage(named: "d16")!, titulo: "SIMPLY THE BEST 80S (2 CD'S + DVD)", precio: 172)
        let disco17 = objetos(portada: UIImage(named: "d17")!, titulo: "THANK U, NEXT", precio: 123)
        let disco18 = objetos(portada: UIImage(named: "d18")!, titulo: "PAUL IS LIVE (RMST)", precio: 157)
        let disco19 = objetos(portada: UIImage(named: "d19")!, titulo: "DIAMONDS (2 CD'S)", precio: 119)
        let disco20 = objetos(portada: UIImage(named: "d20")!, titulo: "GREATEST HITS 1 (REMASTERED + BOOKLET)", precio: 123)
        let disco21 = objetos(portada: UIImage(named: "d21")!, titulo: "ROMANTIC MOMENTS II / LOVE IN MAASTRICHT (CD + DVD)", precio: 237)
        let disco22 = objetos(portada: UIImage(named: "d22")!, titulo: "GRANDES COROS", precio: 51)
        
        temp.append(disco1)
        temp.append(disco2)
        temp.append(disco3)
        temp.append(disco4)
        temp.append(disco5)
        temp.append(disco6)
        temp.append(disco7)
        temp.append(disco8)
        temp.append(disco9)
        temp.append(disco10)
        temp.append(disco11)
        temp.append(disco12)
        temp.append(disco13)
        temp.append(disco14)
        temp.append(disco15)
        temp.append(disco16)
        temp.append(disco17)
        temp.append(disco18)
        temp.append(disco19)
        temp.append(disco20)
        temp.append(disco21)
        temp.append(disco22)
        return temp
    }
    func setupUI(){
        navigationItem.title = "Productos Disponibles"
        tableView.backgroundColor = .clear
        objetosCantidad.text = "Objetos:  " + String(totalDiscos)
        precioTotalCompra.text = "Pago:  " + String(precioTotal)
        compraCarro.image = UIImage(named: "bolsacompra")
        reportePreliminar.backgroundColor = .clear
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "objetoDetalle":
            let indexPath = tableView.indexPathForSelectedRow
            let objetoView = segue.destination as? ObjetoDetalleViewController
            objetoView?.objeto = objeto[indexPath!.row]
            objetoView?.objetoSeleccion = self
        case "compraCarro":
            let compraView = segue.destination as? ListaCompraViewController
            compraView?.objetoSeleccionado = self
        default:
            print("no exixte")
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
extension PrincipalViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objeto.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let objetos = objeto[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "principalTableViewCell") as! PrincipalTableViewCell
        cell.objetoSeleccionado(objetos: objetos)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
