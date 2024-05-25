

import UIKit

class ViewController: UIViewController {
    
    let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]

    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GreenBackground")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var middleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var diceSteckView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 100
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DiceeLogo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    lazy var leftDiceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DiceOne")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var rightDiceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DiceTwo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var rollButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Roll", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 151/255, green: 27/255, blue: 30/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstarints()
    }
    
    func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(stackView)
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(diceSteckView)
        stackView.addArrangedSubview(rollButton)
        diceSteckView.addArrangedSubview(rightDiceImageView)
        diceSteckView.addArrangedSubview(leftDiceImageView)
    }
    
    @objc func rollButtonPressed() {
        leftDiceImageView.image = diceArray.randomElement()
        rightDiceImageView.image = diceArray.randomElement()
    }
}

extension ViewController {
    
    func setConstarints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            
            
            diceSteckView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            diceSteckView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
        
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            
            rollButton.heightAnchor.constraint(equalToConstant: 45),
            rollButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
