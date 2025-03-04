/*
import SwiftUI
import ActivityKit

struct TrainingWidgetView: View {
    let context: ActivityViewContext<TrainingAttributes>
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(context.attributes.monName)
                    .font(.headline)
                Text("Level \(context.attributes.level)")
                    .font(.subheadline)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                ProgressView(value: Double(context.attributes.currentXP), total: Double(context.attributes.targetXP))
                    .tint(.green)
                Text("\(context.attributes.currentXP)/\(context.attributes.targetXP) XP")
                    .font(.caption)
            }
        }
        .padding()
    }
}

#Preview {
    TrainingWidgetView(context: ActivityViewContext(
        attributes: TrainingAttributes(
            monName: "Yorox",
            level: 1,
            targetXP: 100,
            currentXP: 50
        )
    ))
}
*/ 