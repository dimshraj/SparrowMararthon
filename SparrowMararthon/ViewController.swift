//
//  ViewController.swift
//  SparrowMararthon
//
//  Created by Dmitriy Shrayber on 01.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let gradientView: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureConstraints()
    }
    override func viewDidLayoutSubviews() {
        setupLayers()
    }
    
    private func setupViews() {
        self.view.addSubview(gradientView)
        self.view.backgroundColor = .white
    }
    
    private func configureConstraints() {
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gradientView.widthAnchor.constraint(equalToConstant: 100),
            gradientView.heightAnchor.constraint(equalToConstant: 100),
            gradientView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
            gradientView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    func setupLayers() {
        gradientView.clipsToBounds = true
        gradientView.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        gradientView.layer.shadowOffset = .init(width: 5, height: 10)
        gradientView.layer.shadowRadius = 12
        gradientView.layer.cornerRadius = 12
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.systemCyan.cgColor, UIColor.systemPink.cgColor]
        gradient.frame = gradientView.layer.bounds
        gradientView.layer.insertSublayer(gradient, at: 0)
    }
}

