//
//  GameScene.swift
//  Seven00
//
//  Created by geee3 on 2023/03/28.
//

import Foundation
import SpriteKit
import GameKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let background = SKSpriteNode(imageNamed: "bg")
    let paddel = SKSpriteNode(imageNamed: "paddel")
    let ball = SKSpriteNode(imageNamed: "ball")
    
    enum bitmasks: UInt32 {
        case frame = 0b1
        case paddel = 0b10
        case stone = 0b100
        case ball = 0b1000
    }
    override func didMove(to view: SKView) {
        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        // 게임 배경 및 설정
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.zPosition = 1
        background.setScale(0.65)
        addChild(background)
        backgroundColor = .black
        
        // 플레이어 설정
        paddel.position = CGPoint(x: size.width / 2, y: 60)
        paddel.zPosition = 10
        paddel.size = CGSize(width: 100, height: 20)
        paddel.physicsBody = SKPhysicsBody(rectangleOf: paddel.size)
        paddel.physicsBody?.friction = 0
        paddel.physicsBody?.allowsRotation = false
        paddel.physicsBody?.restitution = 1
        paddel.physicsBody?.isDynamic = false
        paddel.physicsBody?.categoryBitMask = bitmasks.paddel.rawValue
        paddel.physicsBody?.contactTestBitMask = bitmasks.ball.rawValue
        paddel.physicsBody?.collisionBitMask = bitmasks.ball.rawValue
        addChild(paddel)
        
        // 공 설정
        ball.position.x = paddel.position.x
        ball.position.y = paddel.position.y + 30
        ball.zPosition = 10
        ball.size = CGSize(width: 60, height: 60)
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.height / 2)
        ball.physicsBody?.friction = 0
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.angularDamping = 0
        
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.categoryBitMask = bitmasks.ball.rawValue
        ball.physicsBody?.contactTestBitMask = bitmasks.paddel.rawValue | bitmasks.frame.rawValue | bitmasks.stone.rawValue
        ball.physicsBody?.collisionBitMask = bitmasks.paddel.rawValue | bitmasks.frame.rawValue | bitmasks.stone.rawValue
        addChild(ball)
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))
        
        // Frame
        let frame = SKPhysicsBody(edgeLoopFrom: self.frame)
        frame.friction = 0
        frame.categoryBitMask = bitmasks.frame.rawValue
        frame.contactTestBitMask = bitmasks.ball.rawValue
        frame.collisionBitMask = bitmasks.ball.rawValue
        self.physicsBody = frame
        
        // Stones
        makeStones(reihe: 6, bitmask: 0b10, y: 600, name: "block_blue")
        makeStones(reihe: 6, bitmask: 0b10, y: 620, name: "block_blue")
        makeStones(reihe: 6, bitmask: 0b10, y: 640, name: "block_purple")
        makeStones(reihe: 6, bitmask: 0b10, y: 660, name: "block_purple")
        makeStones(reihe: 6, bitmask: 0b10, y: 680, name: "block_red")
        makeStones(reihe: 6, bitmask: 0b10, y: 700, name: "block_red")
    }
    
    // Paddel 터치 조작
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            paddel.position.x = location.x
        }
    }
    
    // Paddel 범위 설정
    override func update(_ currentTime: TimeInterval) {
        if paddel.position.x < 50 {
            paddel.position.x = 50
        }
        if paddel.position.x > self.size.width - paddel.size.width / 2 {
            paddel.position.x = self.size.width - paddel.size.width / 2
        }
    }
    
    func makeStones(reihe: Int, bitmask: UInt32, y: Int, name: String) {
        for i in 1...reihe {
            let stone = SKSpriteNode(imageNamed: name)
            stone.size = CGSize(width: 55, height: 20)
            stone.position = CGPoint(x: 5 + i * Int(stone.size.width), y: y)
            stone.zPosition = 10
            stone.name = "Stone" + String(i)
            stone.physicsBody = SKPhysicsBody(rectangleOf: stone.size)
            stone.physicsBody?.friction = 0
            stone.physicsBody?.allowsRotation = false
            stone.physicsBody?.restitution = 1
            stone.physicsBody?.isDynamic = false
            stone.physicsBody?.categoryBitMask = bitmasks.stone.rawValue
            stone.physicsBody?.contactTestBitMask = bitmasks.ball.rawValue
            stone.physicsBody?.collisionBitMask = bitmasks.ball.rawValue
            addChild(stone)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactA: SKPhysicsBody
        let contactB: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            contactA = contact.bodyA
            contactB = contact.bodyB // ball
        } else {
            contactA = contact.bodyB
            contactB = contact.bodyA // ball
        }
        
        if contactA.categoryBitMask == bitmasks.stone.rawValue && contactB.categoryBitMask == bitmasks.ball.rawValue {
            contactA.node?.removeFromParent() // contactA = stone
        }
        
        if contactA.categoryBitMask == bitmasks.paddel.rawValue && contactB.categoryBitMask == bitmasks.ball.rawValue {
            if contactB.node!.position.x <= contactA.node!.frame.midX - 5 {
                contactB.node?.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                contactB.node?.physicsBody?.applyImpulse(CGVector(dx: -10, dy: 10))
            }
            if contactB.node!.position.x > contactA.node!.frame.midX + 5 {
                contactB.node?.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                contactB.node?.physicsBody?.applyImpulse(CGVector(dx: 10, dy: -10))
            }
        }
    }
}
