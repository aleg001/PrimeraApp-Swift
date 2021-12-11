//
//  ViewController.swift
//  PruebasIOS
//
//  Created by Alejandro Gomez on 10/12/21.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemCyan
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Siguiente foto aleatoria",for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleShadowColor(.green, for: .normal)
        return button
    }()
    
    let arrayColores: [UIColor] = [
        .systemCyan,
        .systemMint,
        .red,
        .blue,
        .lightGray,
        .magenta,
        .purple,
        .yellow,
        .systemTeal
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)

        getPhoto()
        button.addTarget(self, action: #selector(ApacharBoton), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        button.frame = CGRect(x: 0, y: view.frame.size.height-80, width: view.frame.size.width, height: 40)
    }
    
    @objc func ApacharBoton(){
        getPhoto()
        view.backgroundColor = arrayColores.randomElement()
    }

    func getPhoto (){
        let urlPagina = "https://picsum.photos/200"
        let urlPhoto = URL(string: urlPagina)!
        guard let data = try? Data(contentsOf: urlPhoto) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
    
   
}

