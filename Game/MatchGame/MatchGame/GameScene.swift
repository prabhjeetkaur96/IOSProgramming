//
//  GameScene.swift
//  MatchGame
//
//  Created by MacStudent on 2018-08-15.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import SpriteKit

enum PlayColors{
 static let colors = [
                     UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0),
                     UIColor(red: 241/255, green: 196/255, blue: 15/255, alpha: 1.0),
                     UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0),
                     UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
                     ]
                 }

enum SwitchState: Int {
    case red, yellow, green, blue
}

class GameScene: SKScene {
    
       var colorSwitch: SKSpriteNode!
       var switchState = SwitchState.red
       var currentColorIndex: Int?
    let scoreLabel = SKLabelNode(text: "0")
    var score = 0
    
    override func didMove(to view: SKView) {
       setupPhysics()
       layoutScene()
        
    }
    func setupPhysics(){
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -1.0)
        
        physicsWorld.contactDelegate = self
    }
    
    override func update(_ currentTime: TimeInterval) {
       
    }
    
    func layoutScene(){
    
       backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        colorSwitch = SKSpriteNode(imageNamed: "b4")
        colorSwitch.size = CGSize(width: frame.size.width/3, height:frame.size.width/3)
        colorSwitch.position = CGPoint(x: frame.midX, y: frame.minY + colorSwitch.size.height)
        colorSwitch.zPosition = ZPosition.colorSwitch
        colorSwitch.physicsBody = SKPhysicsBody(circleOfRadius: colorSwitch.size.width/2)
        
        colorSwitch.physicsBody?.categoryBitMask = UInt32(PhysicsCategories.switchCategory)
        colorSwitch.physicsBody?.isDynamic = false
        addChild(colorSwitch)
        
        scoreLabel.fontName = "AvenirNext-Bold"
        scoreLabel.fontSize = 60.0
        scoreLabel.fontColor = UIColor.white
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        colorSwitch.zPosition = ZPosition.label
        addChild(scoreLabel)
        spawnBall()
    }
    
    func updateScoreLabel() {
        scoreLabel.text = "\(score)"
    }
    func spawnBall(){
        
        currentColorIndex = Int(arc4random_uniform(UInt32(4)))
        
        let ball = SKSpriteNode(texture: SKTexture(imageNamed: "w3"), color: PlayColors.colors[currentColorIndex!],size: CGSize(width: 30.0,height:30.0))
        ball.colorBlendFactor = 1.0
        ball.name = "W3"
        ball.position = CGPoint(x: frame.midX, y: frame.maxY)
        colorSwitch.zPosition = ZPosition.ball
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        ball.physicsBody?.categoryBitMask = UInt32(PhysicsCategories.ballCategory)
        ball.physicsBody?.contactTestBitMask = UInt32(PhysicsCategories.switchCategory)
        ball.physicsBody?.collisionBitMask = PhysicsCategories.none
        addChild(ball)
    }
    
    func turnWheel(){
        if let newState = SwitchState(rawValue: switchState.rawValue + 1){
        switchState = newState
        }else{
            switchState = .red
        }
        colorSwitch.run(SKAction.rotate(byAngle: .pi/2, duration: 0.25))
    }
   
    func gameOver(){
    
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        turnWheel()
    }
}
extension GameScene: SKPhysicsContactDelegate{
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask |
        contact.bodyB.categoryBitMask
        
        if contactMask == PhysicsCategories.ballCategory |
            PhysicsCategories.switchCategory{
            
            if let ball = contact.bodyA.node?.name == "W3" ? contact.bodyA.node as? SKSpriteNode : contact.bodyB.node as? SKSpriteNode {
                
                if  currentColorIndex == switchState.rawValue{
                score += 1
                updateScoreLabel()
                    ball.run(SKAction.fadeOut(withDuration: 0.25), completion: {
                        ball.removeFromParent()
                        self.spawnBall()
                    })
                } else {
                    gameOver()
                }
             }
        }
    }
}





