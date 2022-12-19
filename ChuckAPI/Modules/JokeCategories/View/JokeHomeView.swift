import UIKit


protocol JokeHomeViewDelegate: AnyObject {
    func homeButtonDidTapped(sender: UIButton)
}

class JokeHomeView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let globalStackView = UIStackView(arrangedSubviews: [animalCareerStackView, celebrityDevStackView])
        globalStackView.axis = .vertical
        globalStackView.spacing = 8
        globalStackView.distribution = .fillEqually
        addSubview(globalStackView)
        globalStackView.superviewCenter(size: .init(width: 250, height: 250))
        backgroundColor = .white
    }
    
    weak var delegate: JokeHomeViewDelegate?
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    lazy var animalButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.setTitle("Animal", for: .normal)
        button.addTarget(self, action: #selector(categorieButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var careerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(categorieButtonTapped), for: .touchUpInside)
        button.setTitle("Career", for: .normal)
        return button
    }()
    
    lazy var celebrityButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(categorieButtonTapped), for: .touchUpInside)
        button.setTitle("Celebrity", for: .normal)
        return button
    }()
    
    lazy var devButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(categorieButtonTapped), for: .touchUpInside)
        button.setTitle("Dev", for: .normal)
        return button
    }()
    
    
    @objc func categorieButtonTapped(sender: UIButton) {
        delegate?.homeButtonDidTapped(sender: sender)
    }

    private lazy var animalCareerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [animalButton, careerButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var celebrityDevStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [celebrityButton, devButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
}
