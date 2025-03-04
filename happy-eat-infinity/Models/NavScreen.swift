import SwiftUI

enum NavScreen: Hashable {
    case discover
    case doIt(Strategy, String)
    case reflect(Strategy)
    case strategy(Strategy)
    case reflectionDetail(Reflection)
    case strategyChoice(Strategy)
} 
