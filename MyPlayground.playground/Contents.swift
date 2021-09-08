import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

func timmer () {
    
    let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
      print("hi")
    }

}

