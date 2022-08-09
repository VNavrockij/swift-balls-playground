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
    
    public init(colors: [UIColor]) {
        self.colors = colors
        super.init(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        backgroundColor = UIColor.blue
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
    
}


let balls = Balls(colors: [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
PlaygroundPage.current.liveView = balls
