//
//  StartView.swift
//  RockPaperScissorXIB
//
//  Created by Diplomado on 04/05/24.
//

import UIKit

class StartView: UIView {
    private lazy var stackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        // spacing es el espaciado entre los elementos hijos
        stackView.spacing = 16
        // insents es el margen entre los elementos vecinos
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        // la linea de abajo es para que nos respete los margenes que le estamos poniendo
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    var ResultGame: String = ""
    var labelWin = UILabel()
    
    lazy var gameButton: UIButton = {
        let button = UIButton()
        button.setTitle("GAME", for: .normal)
        // la linea de abajo es por el boton se hace gigante
        //button.setContentHuggingPriority(.required, for: .vertical)
        var configuration = UIButton.Configuration.plain()
        configuration.cornerStyle = .large
        configuration.background.backgroundColor = .systemMint
        configuration.baseForegroundColor = .systemGray6
        button.configuration = configuration
        button.addTarget(self, action: #selector(gameButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setStackContainer()
        addConfigurationsToContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConfigurationsToContainer() {
        stackViewContainer.addArrangedSubview(createBasicLabel(text: "Rounds: ", useTamic: true))
        stackViewContainer.addArrangedSubview(createBasicLabel(text: "🤖", useTamic: true))
        stackViewContainer.addArrangedSubview(createBasicLabel(text: "Player: ", useTamic: true))
        stackViewContainer.addArrangedSubview(createBasicLabel(text: "🙆", useTamic: true))
        stackViewContainer.addArrangedSubview(createBasicLabel(text: ResultGame, useTamic: true))
        stackViewContainer.addArrangedSubview(labelWin)
        stackViewContainer.addArrangedSubview(gameButton)
    }
    
    private func setStackContainer() {
        addSubview(stackViewContainer)
        NSLayoutConstraint.activate([
            stackViewContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackViewContainer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackViewContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackViewContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    @objc func gameButtonClicked() {
        // Función que se llama cuando se hace clic en el botón
        print("¡Se hizo clic en el botón GAME!")
        
        // Llamar a tu función aquí
        game()
    }
    
    func game() {
        var selectComputer: Int = 0
        var selectUser: Int = 0
        
        selectComputer = Int.random(in: 0...2)
        selectUser = Int.random(in: 0...2)
        
        switch selectComputer {
        case 0:
            if selectUser == 0 {
                print("empate")
                ResultGame = "empate"
                //labelWin.text = ResultGame
                //createBasicLabel(text: "Empate", useTamic:true)
            } else if selectUser == 1 {
                print("gana usuario")
                ResultGame = "ganaste"
                //labelWin.text = ResultGame
                //createBasicLabel(text:"gana usuario", useTamic:true)
            } else if selectUser == 2 {
                print("gana maquina")
                ResultGame = "perdiste"
                //labelWin.text = ResultGame
                //createBasicLabel(text: "gana maquina", useTamic:true)
            }
        case 1:
            if selectUser == 0 {
                print("gana maquina")
                ResultGame = "perdiste"
                //labelWin.text = ResultGame
                //createBasicLabel(text: "gana maquina", useTamic: true)
            } else if selectUser == 1 {
                print("empate")
                ResultGame = "empate"
                //labelWin.text = ResultGame
                //createBasicLabel(text: "Empate", useTamic: true)
            } else if selectUser == 2 {
                print("gana usuario")
                ResultGame = "ganaste"
                //labelWin.text = ResultGame
                //createBasicLabel(text: "gana usuario",  useTamic: true)
            }
        case 2:
            if selectUser == 0 {
                printContent("gana usuario")
                ResultGame = "ganaste"
                //labelWin.text = ResultGame
                //createBasicLabel(text: "gana usuario", useTamic: true)
            } else if selectUser == 1 {
                print("gana maquina")
                ResultGame = "perdiste"
                //labelWin.text = ResultGame
                //createBasicLabel(text: "gana maquina", useTamic: true)
            } else if selectUser == 2 {
                print("empate")
                ResultGame = "empate"
                //labelWin.text = ResultGame
                //createBasicLabel(text: "Empate", useTamic: true)
            }
        default:
            print("default")
        }
    }

    private func createBasicLabel(text: String, useTamic: Bool = false) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = useTamic
        label.text = text
        return label
    }
}
