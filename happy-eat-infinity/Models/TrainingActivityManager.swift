/*
import ActivityKit
import Foundation

@MainActor
class TrainingActivityManager: ObservableObject {
    static let shared = TrainingActivityManager()
    
    private var currentActivity: Activity<TrainingAttributes>?
    
    func startTrainingActivity(monName: String, level: Int, xp: Int) {
        let targetXP = level * 100
        let attributes = TrainingAttributes(
            monName: monName,
            level: level,
            targetXP: targetXP,
            currentXP: xp
        )
        
        do {
            let activity = try Activity.request(
                attributes: attributes,
                pushType: nil
            )
            currentActivity = activity
        } catch {
            print("Error starting training activity: \(error)")
        }
    }
    
    func updateTrainingActivity(xp: Int) {
        guard let activity = currentActivity else { return }
        
        let attributes = TrainingAttributes(
            monName: activity.attributes.monName,
            level: activity.attributes.level,
            targetXP: activity.attributes.targetXP,
            currentXP: xp
        )
        
        Task {
            await activity.update(using: attributes)
        }
    }
    
    func stopTrainingActivity() {
        guard let activity = currentActivity else { return }
        
        Task {
            await activity.end(dismissalPolicy: .immediate)
            currentActivity = nil
        }
    }
}
*/ 
