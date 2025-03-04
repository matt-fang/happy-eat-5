@Relationship(deleteRule: .cascade) var strategies: [Strategy] = [Strategy(
    name: "Prepare a balanced meal that fuels me",
    instructions: "Before your next meal, choose ingredients that deliver balanced nutrition. Which plan fits your next meal?",
    content: [
        "Make a hearty breakfast with eggs, whole grain toast, and fruit",
        "Prepare a vibrant salad with lean protein for lunch",
        "Mix a nutrient-rich smoothie for a mid-day boost",
        "Cook a dinner featuring vegetables, protein, and whole grains"
    ],
    eatingStyles: [.selfCare]
), /* and many more... */]

// Add this method to check strategies after initialization
func printStrategies() {
    print("\n=== Strategies After Initialization ===")
    for (index, strategy) in strategies.enumerated() {
        print("Strategy \(index): \(strategy.name ?? "unnamed")")
        print("Eating styles: \(strategy.eatingStyles.map { $0.rawValue })")
        print("---")
    }
}

@Model
class User {
    // ... existing properties ...

    // Default initializer
    init() {
        self.eatingStyle = EatingStyle.selfCare
        self.monName = "Yorox"
        print("User initialized with default values.")
        printStrategies() // Check strategies after initialization
    }

    // Existing initializer
    init(eatingStyle: EatingStyle, monName: String) {
        self.eatingStyle = eatingStyle
        self.monName = monName
        print("User initialized with custom values.")
        printStrategies() // Check strategies after initialization
    }

    // ... existing methods ...
} 