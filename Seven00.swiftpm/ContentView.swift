import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene = GameScene()
    
    
    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}
