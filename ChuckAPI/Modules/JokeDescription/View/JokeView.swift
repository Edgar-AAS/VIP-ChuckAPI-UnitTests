import UIKit

class JokeView: UIView {
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.tintColor = .lightGray
        ai.hidesWhenStopped = true
        ai.startAnimating()
        return ai
    }()
    
    lazy var jokeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        addSubview(jokeLabel)
        jokeLabel.fillConstraints(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            padding: .init(top: 16, left: 16, bottom: 16, right: 16)
        )
        
        addSubview(activityIndicatorView)
        activityIndicatorView.superviewCenter()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupTextLabel(jokeText: String) {
        jokeLabel.text = jokeText
        activityIndicatorView.stopAnimating()
    }
}
