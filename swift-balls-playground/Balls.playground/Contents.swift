import PlaygroundSupport
import UIKit

var greeting = " Hello "

public class Balls: UIView {
    // color list
    private var colors: [UIColor]
    // balls
    private var balls: [UIView] = []
    // width and height
    private var ballSize: CGSize = CGSize(width: 40, height: 40)
    // animation grafics elements
    private var animator: UIDynamicAnimator?
    // handling of displaced sites
    private var snapBehavior: UISnapBehavior?
    
    public init(colors: [UIColor]) {
        self.colors = colors
        super.init(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        backgroundColor = UIColor.blue
        // connect animator with pointer to the class itself
        animator = UIDynamicAnimator(referenceView: self)
        // call a func for drawing balls
        ballsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // for display balls
    func ballsView () {
        // enumeration pass colors for amount balls
        for (index, color) in colors.enumerated() {
            let ball = UIView(frame: CGRect.zero)
            ball.backgroundColor = color
            addSubview(ball)
            balls.append(ball)
            /* calculate the ball’s indentation along the X and Y axes, each
            subsequent ball should be right and below the previous
             */
            let origin = 40 * index + 100
            // show ball as rect
            ball.frame = CGRect(x: origin, y: origin, width: Int(ballSize.width), height: Int(ballSize.height))
            // corner radius
            ball.layer.cornerRadius = ball.bounds.width / 2.0
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            for ball in balls {
                if (ball.frame.contains(touchLocation)) {
                    snapBehavior = UISnapBehavior(item: ball, snapTo: touchLocation)
                    snapBehavior?.damping = 0.5
                    animator?.addBehavior(snapBehavior!)
                }
            }
        }
    }
    
}

let balls = Balls(colors: [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.8272281289, green: 0.8619112372, blue: 0.8180854321, alpha: 1), #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)])
PlaygroundPage.current.liveView = balls
