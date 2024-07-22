import UIKit

class ThunderstormView: UIView {
        
    // MARK: - Properties

    var isAnimationRunning : Bool = true
    var image : UIImageView = UIImageView()
    
    var remove : (() -> Void?)?
    
    // MARK: - Initializators
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        isAnimationRunning = true
        animateLightning()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    deinit {
    }
    
    // MARK: - Setup view
    
    func setupView(){
        image = UIImageView(image: UIImage(named: "10"))
        image.image!.withTintColor(UIColor.gray)
        
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        image.contentMode = .scaleAspectFit

        
        alpha = 0.0
    }
    
}

    // MARK: - Animations

extension ThunderstormView {
    
    func stopAnimation(){
        isAnimationRunning = false
    }
    
    func animateLightning() {
        
        
        guard isAnimationRunning else {
            self.removeFromSuperview()
            self.remove?()
            return
        }
        
        let randomXPosition = CGFloat.random(in: -UIScreen.main.bounds.width / 2...(UIScreen.main.bounds.width / 2))
        let randomDuration = CGFloat.random(in: 0.1...0.3)
        let randomDelay = CGFloat.random(in: 0.2...0.4)
        let randomMainDelay = CGFloat.random(in: 4...6)
        
        self.frame.origin.x = randomXPosition
        self.frame.origin.y = -frame.size.height
        
        
        UIView.animate(withDuration: randomDuration, delay: randomMainDelay, options: [.curveEaseInOut], animations: {
            self.alpha = 1.0
            self.frame.origin.y = 0
            
        }) { _ in

            
            UIView.animate(withDuration: randomDuration, delay: randomDelay, options: [.curveEaseInOut], animations: {
                self.alpha = 0.0
                
            }, completion: { _ in

                if self.isAnimationRunning {
                    self.animateLightning()
                } else {
                    self.remove?()
                    self.removeFromSuperview()
                }
            })
        }
    }
    
}
