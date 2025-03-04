//
//  User.swift
//  happy-eat-5
//
//  Created by Matthew Fang on 2/23/25.
//

import Foundation
import SwiftData

@Model
class User {
    static let schemaVersion = Schema.Version(1, 0, 4)
    @Attribute(.unique) var id = UUID()
    
    // Add a transformable attribute to handle old string values
//    @Attribute(.transformable) private var _eatingStyleString: String? = nil
//    
//    var eatingStyle: EatingStyle {
//        get {
//            if let string = _eatingStyleString {
//                // Handle old string values
//                switch string.lowercased() {
//                case "diethistory", "gentle", "mindful", "intuitive":
//                    return .selfCare
//                case "emotional", "restrictive", "binge":
//                    return .anxious
//                case "bodyimage":
//                    return .unconfident
//                default:
//                    return .selfCare
//                }
//            }
//            return .selfCare
//        }
//        set {
//            _eatingStyleString = newValue.rawValue
//        }
//    }
    
    var eatingStyle: EatingStyle = EatingStyle.selfCare
    var monName: String = "Yorox"  // Default value
    var xp: Int = 0
    var level: Int = 1
    var showXPAnimation: Bool = false
    var showLevelUpAnimation: Bool = false
    
    var streak: Int = 0
    var lastCompletedDate: Date?
    
    var playStreakAnimation: Bool = false
    
    @Relationship(deleteRule: .cascade) var strategies: [Strategy] = [
        Strategy(
            name: "Prepare a balanced meal that fuels me",
            instructions: "Before your next meal, choose ingredients that deliver balanced nutrition. Which plan fits your next meal?",
            content: [
                "Make a hearty breakfast with eggs, whole grain toast, and fruit",
                "Prepare a vibrant salad with lean protein for lunch",
                "Mix a nutrient-rich smoothie for a mid-day boost",
                "Cook a dinner featuring vegetables, protein, and whole grains"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Experiment with a new ingredient for a fun meal",
            instructions: "Today, pick a new ingredient or recipe and incorporate it into your meal. How will you add variety?",
            content: [
                "Try a new spice blend in your dish",
                "Cook a recipe from a different cuisine",
                "Add a unique fruit or vegetable to your meal",
                "Combine traditional ingredients in a new way"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Incorporate a simple nutrition tip into my meal",
            instructions: "At your next meal, choose one nutrition tip to try. How will you implement it?",
            content: [
                "Add an extra serving of greens",
                "Include a protein-rich food",
                "Replace a processed ingredient with a whole food",
                "Swap a sugary drink with water"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Create and follow a simple eating plan",
            instructions: "Plan your meals for today. Which option sounds most doable?",
            content: [
                "Plan three balanced meals with healthy snacks",
                "Schedule specific times to sit down and eat",
                "Map out a plan that emphasizes variety",
                "Decide on portion sizes for each meal"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Break a restrictive diet rule for a day",
            instructions: "Choose one diet rule that limits you and skip it during one meal. What will you do?",
            content: [
                "Skip tracking calories for one meal",
                "Allow a treat you've been avoiding",
                "Eat without stressing about portion sizes",
                "Ignore a no-go food list for a meal"
            ],
            eatingStyles: [.unconfident, .anxious]
        ),
        Strategy(
            name: "Apply one good habit and ditch a bad one",
            instructions: "At your next meal, practice a healthy habit and leave a negative one behind. Which will you try?",
            content: [
                "Include a nutrient-dense food and skip an empty-calorie snack",
                "Drink water before eating to curb overeating",
                "Choose a balanced plate over processed options",
                "Eat slowly and stop when you're satisfied"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Reward myself with a healthy treat when feeling deprived",
            instructions: "When you feel deprived or stressed, choose a nutritious treat. Which treat will work for you?",
            content: [
                "Have a small serving of dark chocolate",
                "Enjoy a fresh fruit salad",
                "Sip herbal tea with a spoon of nut butter",
                "Snack on crunchy veggies with hummus"
            ],
            eatingStyles: [.anxious, .stressed]
        ),
        Strategy(
            name: "Enjoy a meal that breaks conventional diet rules",
            instructions: "At your next meal, ignore a common diet rule and follow your own choice. What's your plan?",
            content: [
                "Choose a food you've been told to avoid",
                "Eat the portion size that feels right for you",
                "Mix foods from different groups without rules",
                "Ignore calorie counting for one meal"
            ],
            eatingStyles: [.unconfident, .anxious]
        ),
        Strategy(
            name: "Choose a meal entirely on my own terms",
            instructions: "Plan your next meal solely based on your cravings—no rules. How will you decide?",
            content: [
                "Pick a meal that feels indulgent yet balanced",
                "Select a dish that satisfies hunger and taste",
                "Choose a comfort food without restrictions",
                "Decide on a meal that excites your taste buds"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Take a day off from diet rules",
            instructions: "Dedicate a day to intuitive eating—ignore strict rules. Which approach will help you enjoy freedom?",
            content: [
                "Turn off diet apps and follow hunger cues",
                "Focus on flavors and enjoyment over numbers",
                "Eat based solely on how you feel",
                "Allow a variety of foods without judgment"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Make one small change in my eating habits",
            instructions: "Today, choose one small change to improve your eating habits. What will you adjust?",
            content: [
                "Replace a sugary snack with a piece of fruit",
                "Add an extra serving of vegetables",
                "Switch soda for water",
                "Choose whole grains over refined ones"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Savor my favorite craving mindfully",
            instructions: "At your next meal, savor a food you truly crave. How will you enjoy it?",
            content: [
                "Take small, mindful bites",
                "Focus on the taste and texture",
                "Pair it with a healthy side",
                "Eat slowly to fully enjoy the flavor"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Reclaim joy by preparing an exciting meal",
            instructions: "Cook or assemble a meal that excites you. Which method will make it joyful?",
            content: [
                "Cook a vibrant, colorful dish",
                "Mix different textures and flavors",
                "Prepare a comfort meal that lifts your mood",
                "Try a new recipe that surprises you"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Experiment with a new dish for a sensory boost",
            instructions: "Try a new dish that excites all your senses. Which approach will you take?",
            content: [
                "Use fresh herbs and spices for aroma",
                "Choose visually appealing ingredients",
                "Incorporate a mix of textures",
                "Select a recipe that balances sweet, savory, and tangy"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Plate my meal in a visually appealing way",
            instructions: "Before eating, arrange your meal attractively. Which presentation style will you choose?",
            content: [
                "Arrange food in a colorful, artistic layout",
                "Garnish with fresh herbs",
                "Mix textures for visual interest",
                "Keep it simple and elegant"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Evaluate my energy after a meal",
            instructions: "After your meal, assess how energized you feel. Which feeling best describes you?",
            content: [
                "I feel energized and alert",
                "There's a slight dip in energy",
                "I feel sluggish or heavy",
                "I feel balanced and satisfied"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Plan a multi-sensory meal",
            instructions: "Design a meal that engages all your senses. Which idea will guide your planning?",
            content: [
                "Include a mix of sweet, sour, and savory flavors",
                "Incorporate crunchy and soft textures",
                "Choose ingredients with vibrant colors",
                "Use aromatic herbs and spices"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Set up a calming dining environment",
            instructions: "Create a peaceful spot for your next meal. How will you set the mood?",
            content: [
                "Turn off screens and minimize distractions",
                "Choose a quiet spot and play soft music",
                "Light a candle or use ambient lighting",
                "Set your table neatly for a calm atmosphere"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Assess my hunger and mood before eating",
            instructions: "Before your meal, gauge your hunger and emotional state. What will you check?",
            content: [
                "Rate your hunger from 1 to 10",
                "Notice if you're stressed, anxious, or calm",
                "Decide based on both physical and emotional cues",
                "Take a deep breath to center yourself"
            ],
            eatingStyles: [.selfCare, .anxious, .stressed]
        ),
        Strategy(
            name: "Calm down before eating",
            instructions: "When feeling stressed, take a moment to relax before your meal. Which technique will you try?",
            content: [
                "Take three deep breaths",
                "Step outside for fresh air",
                "Listen to calming music",
                "Sit quietly for a few minutes"
            ],
            eatingStyles: [.stressed]
        ),
        Strategy(
            name: "Identify what boosts my meal satisfaction",
            instructions: "After eating, pick one aspect that made your meal enjoyable. Which element will you focus on next time?",
            content: [
                "A burst of flavor",
                "A satisfying texture",
                "A pleasing aroma",
                "A balanced portion size"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Set one personal food rule that benefits me",
            instructions: "Decide on one food rule that enhances your well-being. Which rule will you adopt?",
            content: [
                "Only eat when truly hungry",
                "Prioritize nutrient-dense foods",
                "Avoid distractions during meals",
                "Balance portion sizes carefully"
            ],
            eatingStyles: [.selfCare, .anxious]
        ),
        Strategy(
            name: "Evaluate the source of a food rule",
            instructions: "Reflect on a food rule you follow and its origin. Which option will you consider?",
            content: [
                "Reflect on family or cultural origins",
                "Question if it's still relevant for you",
                "Decide to modify it if needed",
                "Keep it if it improves your well-being"
            ],
            eatingStyles: [.selfCare, .anxious]
        ),
        Strategy(
            name: "Discard a food rule that limits me",
            instructions: "At your next meal, let go of one restrictive food rule. How will you break free?",
            content: [
                "Skip a self-imposed calorie limit",
                "Ignore a food elimination rule",
                "Choose a food you've been avoiding",
                "Let go of strict portion sizes"
            ],
            eatingStyles: [.unconfident, .anxious]
        ),
        Strategy(
            name: "Break a mindless eating habit",
            instructions: "Notice when you're eating out of habit and choose a mindful alternative. What will you do?",
            content: [
                "Pause before eating and check your hunger",
                "Swap a habitual snack for a nutritious one",
                "Set a timer to slow down your eating",
                "Focus on savoring each bite"
            ],
            eatingStyles: [.selfCare, .anxious]
        ),
        Strategy(
            name: "Photograph my meals for a week",
            instructions: "Over the next week, photograph each meal to review your choices. Which method will you use?",
            content: [
                "Use a dedicated food journal app",
                "Create a digital album for your meals",
                "Review photos at the end of each day",
                "Share meal photos with a friend for feedback"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Share a meal with a supportive friend",
            instructions: "Plan a meal with a friend who inspires healthy eating. How will you make it engaging?",
            content: [
                "Cook together and exchange recipes",
                "Eat at a favorite healthy restaurant",
                "Plan a picnic with balanced foods",
                "Organize a potluck with nourishing dishes"
            ],
            eatingStyles: [.selfCare, .anxious]
        ),
        Strategy(
            name: "Indulge in my favorite food mindfully",
            instructions: "Treat yourself to your favorite food and savor each bite. Which option will guide you?",
            content: [
                "Indulge in a small serving of a comfort dish",
                "Enjoy a balanced version of your favorite treat",
                "Pair your favorite food with a healthy side",
                "Eat slowly and appreciate every bite"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Challenge a negative food thought",
            instructions: "When a negative food thought arises, counter it with a positive action. What's your approach?",
            content: [
                "Replace it with a positive affirmation",
                "Choose a food that boosts your confidence",
                "Take a moment to reframe the thought",
                "Disregard the negative message and focus on nutrition"
            ],
            eatingStyles: [.unconfident, .stressed]
        ),
        Strategy(
            name: "Replace a negative food thought with a positive action",
            instructions: "At your next meal, swap a negative thought for a positive, nutritious choice. Which option suits you?",
            content: [
                "Choose a nutritious option you love",
                "Focus on the health benefits of your meal",
                "Recall a positive food memory",
                "Opt for a mood-lifting snack"
            ],
            eatingStyles: [.unconfident, .stressed]
        ),
        Strategy(
            name: "Try a flexible food swap",
            instructions: "Replace a food you label as 'bad' with a healthier alternative. Which swap will you try?",
            content: [
                "Swap soda for sparkling water with lemon",
                "Replace white bread with whole grain bread",
                "Choose brown rice over white rice",
                "Trade fried food for a baked version"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Embrace imperfection in my next meal",
            instructions: "Allow yourself to enjoy a meal without aiming for perfection. Which approach will help you celebrate imperfection?",
            content: [
                "Eat without obsessing over calories",
                "Allow extra indulgence without guilt",
                "Focus on enjoyment rather than perfection",
                "Accept that not every meal must be flawless"
            ],
            eatingStyles: [.unconfident]
        ),
        Strategy(
            name: "Adopt a 'mostly healthy' meal approach",
            instructions: "Plan a meal that's mostly healthy while still allowing a small treat. Which option will you try?",
            content: [
                "Plan a balanced meal with a tiny dessert",
                "Focus on whole foods with a hint of indulgence",
                "Prioritize vegetables and lean proteins, then enjoy dessert",
                "Create a meal with a healthy base and a comforting side"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Notice emotional eating triggers in real time",
            instructions: "When emotions run high, check in before your meal. Which strategy will help you balance your feelings?",
            content: [
                "Take a moment to breathe and assess emotions",
                "Opt for a comforting yet nutritious snack",
                "Adjust your meal to include mood-boosting foods",
                "Delay eating for a few minutes until calmer"
            ],
            eatingStyles: [.anxious, .stressed]
        ),
        Strategy(
            name: "Assert my food choices confidently",
            instructions: "Next time someone questions your meal, confidently stand by your decision. Which approach will you use?",
            content: [
                "Clearly explain your nutritional reasons",
                "Share how your choice makes you feel empowered",
                "Stand by your decision without apology",
                "Use positive language to describe your meal"
            ],
            eatingStyles: [.unconfident]
        ),
        Strategy(
            name: "Respond to hunger signals immediately",
            instructions: "When you feel hunger cues, act by choosing a nourishing snack. Which snack will you grab?",
            content: [
                "Grab a piece of fruit",
                "Have a handful of nuts",
                "Drink a glass of water",
                "Enjoy a yogurt or smoothie"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Gauge my hunger level actively",
            instructions: "Before your meal, quickly assess your hunger. How will you do it?",
            content: [
                "Rate hunger on a scale of 1 to 10",
                "Decide portion size based on your hunger",
                "Match your hunger with a light or heavy meal",
                "Check in with your body's cues"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Savor a meal purely for its taste",
            instructions: "Focus solely on the flavor of your next meal. Which method will help you fully savor it?",
            content: [
                "Eat slowly and concentrate on flavors",
                "Pair your meal with a complementary beverage",
                "Engage all your senses while eating",
                "Minimize distractions to focus on taste"
            ],
            eatingStyles: [.selfCare]
        ),
        // -- New, more concrete strategies --
        Strategy(
            name: "Drink more water throughout the day",
            instructions: "Increase your water intake today. How will you remind yourself?",
            content: [
                "Set a timer to drink water every hour",
                "Keep a water bottle with you at all times",
                "Drink a glass of water before each meal",
                "Track your water intake with an app"
            ],
            eatingStyles: [.selfCare]
        ),
        Strategy(
            name: "Eat extra veggies at every meal",
            instructions: "Incorporate more vegetables into your meals today. Which method will you try?",
            content: [
                "Add a side salad to lunch and dinner",
                "Mix vegetables into your main dishes",
                "Snack on raw veggies between meals",
                "Blend veggies into a smoothie"
            ],
            eatingStyles: [.selfCare, .anxious]
        ),
        Strategy(
            name: "Choose whole grains over refined ones",
            instructions: "Replace refined grains with whole grains at your next meal. Which switch will you make?",
            content: [
                "Swap white bread for whole grain bread",
                "Choose brown rice instead of white rice",
                "Select whole grain pasta",
                "Try quinoa or barley as a substitute"
            ],
            eatingStyles: [.selfCare]
        ),
            Strategy(
                name: "Identify what makes my meals satisfying",
                instructions: "At your next meal, decide which aspect—taste, texture, or aroma—will boost your satisfaction. Which one will you focus on?",
                content: [
                    "Emphasize bold, balanced flavors",
                    "Incorporate a mix of textures for interest",
                    "Select ingredients with rich aromas",
                    "Combine several elements for a full experience"
                ],
                eatingStyles: [.selfCare]
            ),
            Strategy(
                name: "Enhance the visual appeal of my meals",
                instructions: "Before eating, arrange your meal to be visually inviting. Which presentation style will you try?",
                content: [
                    "Colorful arrangement with fresh garnishes",
                    "Neat plating with simple elegance",
                    "Creative layout mixing textures",
                    "A vibrant mix of colors and shapes"
                ],
                eatingStyles: [.selfCare]
            ),
            Strategy(
                name: "Evaluate my body's response after eating",
                instructions: "After your meal, assess how your body feels—energized, relaxed, or heavy. Which observation best fits your experience?",
                content: [
                    "I feel energized and light",
                    "I feel comfortably satisfied",
                    "I feel overly full or sluggish",
                    "I notice subtle changes in energy"
                ],
                eatingStyles: [.selfCare, .unconfident]
            ),
            Strategy(
                name: "Design a multi-sensory meal experience",
                instructions: "Imagine a meal that excites your taste, touch, smell, and sight. Which plan will you create?",
                content: [
                    "A colorful salad with varied textures",
                    "A warm soup with aromatic herbs",
                    "A stir-fry combining crunch and flavor",
                    "A dessert that delights all senses"
                ],
                eatingStyles: [.selfCare]
            ),
            Strategy(
                name: "Optimize my dining environment and pace",
                instructions: "Examine your eating setting and speed. Which change will improve your dining experience?",
                content: [
                    "Eat in a calm, quiet space",
                    "Slow down my pace to savor each bite",
                    "Eliminate distractions like screens",
                    "Set a relaxed table setting"
                ],
                eatingStyles: [.selfCare]
            ),
            Strategy(
                name: "Monitor my hunger and emotions around meals",
                instructions: "Before and after eating, note your hunger level and feelings. Which aspect will you track most closely?",
                content: [
                    "Rate hunger before meals",
                    "Record my emotional state before eating",
                    "Compare hunger with post-meal satisfaction",
                    "Identify patterns between feelings and food choices"
                ],
                eatingStyles: [.selfCare, .stressed]
            ),
            Strategy(
                name: "Assess how stress impacts my meal enjoyment",
                instructions: "Think about a meal eaten in a stressful setting. Which factor influenced your experience most?",
                content: [
                    "Background noise or chaos",
                    "Rushed eating due to stress",
                    "Overwhelming emotions during the meal",
                    "Lack of calm affects digestion"
                ],
                eatingStyles: [.stressed]
            ),
            Strategy(
                name: "Summarize the key factors of meal satisfaction",
                instructions: "Review your meals and identify what makes them enjoyable. Which factor stands out most?",
                content: [
                    "Taste and flavor balance",
                    "Texture and mouthfeel",
                    "Aromatic qualities",
                    "Visual presentation of the meal"
                ],
                eatingStyles: [.selfCare]
            ),
            Strategy(
                name: "Define my personal food guidelines",
                instructions: "Decide on key food rules that work for you. Which guideline will you adopt?",
                content: [
                    "Eat only when truly hungry",
                    "Prioritize nutrient-rich foods",
                    "Avoid eating while distracted",
                    "Maintain balanced portion sizes"
                ],
                eatingStyles: [.anxious]
            ),
            Strategy(
                name: "Investigate the origins of my food rules",
                instructions: "Reflect on the sources of your eating rules. Which origin influences you most?",
                content: [
                    "Family traditions",
                    "Cultural norms",
                    "Media or diet trends",
                    "Personal health beliefs"
                ],
                eatingStyles: [.anxious]
            ),
            Strategy(
                name: "Eliminate restrictive food rules",
                instructions: "Identify one rule that limits you and choose to break it. Which rule will you let go of?",
                content: [
                    "Skip calorie counting for one meal",
                    "Allow a food you typically avoid",
                    "Ignore strict portion control",
                    "Abandon a no-go list for a day"
                ],
                eatingStyles: [.anxious, .selfCare]
            ),
            Strategy(
                name: "Identify my habitual eating patterns",
                instructions: "Observe when you eat out of habit rather than hunger. Which habit do you recognize most?",
                content: [
                    "Snacking while watching TV",
                    "Eating at the same time daily regardless of hunger",
                    "Grabbing food out of boredom",
                    "Relying on routine rather than signals"
                ],
                eatingStyles: [.selfCare]
            ),
            Strategy(
                name: "Track my meals for one week",
                instructions: "For the next week, record each meal and snack. Which tracking method will you use?",
                content: [
                    "Use a food diary app",
                    "Take photos of every meal",
                    "Write a simple log in a notebook",
                    "Create a spreadsheet to track meals"
                ],
                eatingStyles: [.selfCare]
            ),
            Strategy(
                name: "Evaluate peer influence on my food rules",
                instructions: "Reflect on how friends shape your eating habits. Which influence do you notice most?",
                content: [
                    "Friends encouraging healthy choices",
                    "Social pressure to eat certain foods",
                    "Sharing recipes and ideas",
                    "Influence from dining out together"
                ],
                eatingStyles: [.anxious, .stressed]
            ),
            Strategy(
                name: "Savor and celebrate my favorite foods",
                instructions: "List a few foods that make you happy and choose one to enjoy mindfully. Which option will you celebrate?",
                content: [
                    "A comfort dish that lifts my mood",
                    "A nutritious favorite with great taste",
                    "A seasonal fruit or veggie treat",
                    "A well-loved homemade recipe"
                ],
                eatingStyles: [.selfCare, .stressed]
            ),
            Strategy(
                name: "Identify negative judgments about my food choices",
                instructions: "Reflect on any negative messages you’ve internalized about food. Which judgment do you want to challenge?",
                content: [
                    "Feeling guilty for enjoying treats",
                    "Believing certain foods are 'bad'",
                    "Overemphasizing calorie counts",
                    "Criticizing my portion sizes"
                ],
                eatingStyles: [.anxious, .stressed]
            ),
            Strategy(
                name: "Counter negative food thoughts with positive actions",
                instructions: "When a negative thought arises, choose a positive action. Which response will you try?",
                content: [
                    "Recite a positive food affirmation",
                    "Choose a nutritious option that makes me feel good",
                    "Remind myself of my body’s strengths",
                    "Focus on the pleasure of eating without judgment"
                ],
                eatingStyles: [.stressed]
            ),
            Strategy(
                name: "Adopt a flexible mindset about food",
                instructions: "Challenge the ‘good’ vs. ‘bad’ labels by choosing a balanced perspective. Which mindset shift appeals most to you?",
                content: [
                    "Embrace all foods in moderation",
                    "Focus on nourishment rather than labels",
                    "Allow occasional treats without guilt",
                    "Prioritize overall balance in meals"
                ],
                eatingStyles: [.selfCare, .stressed]
            ),
            Strategy(
                name: "Release perfectionism in my food choices",
                instructions: "Let go of the need for perfect eating. Which option helps you relax your standards?",
                content: [
                    "Enjoy food without obsessing over details",
                    "Accept small imperfections in meals",
                    "Prioritize enjoyment over strict rules",
                    "Allow occasional indulgence without guilt"
                ],
                eatingStyles: [.stressed, .anxious]
            ),
            Strategy(
                name: "Adopt a 'mostly healthy' eating approach",
                instructions: "Plan a meal that's mainly nutritious while still allowing a treat. Which strategy will you follow?",
                content: [
                    "Prepare a balanced meal with a small dessert",
                    "Focus on whole foods with room for indulgence",
                    "Prioritize veggies and lean protein, then add a treat",
                    "Design a meal with a healthy base and a fun side"
                ],
                eatingStyles: [.selfCare]
            ),
            Strategy(
                name: "Observe how emotions influence my eating",
                instructions: "Reflect on a recent meal and note how your emotions impacted your choices. Which observation fits best?",
                content: [
                    "I ate more when feeling stressed",
                    "I chose comfort food when sad",
                    "I avoided eating when anxious",
                    "I maintained balance regardless of mood"
                ],
                eatingStyles: [.stressed]
            ),
            Strategy(
                name: "Assert my food choices confidently",
                instructions: "Next time someone questions your meal, stand firm in your decision. Which response will you use?",
                content: [
                    "Explain the nutritional benefits confidently",
                    "Share how the choice empowers me",
                    "Assert my decision without apologizing",
                    "Use positive language to defend my meal"
                ],
                eatingStyles: [.stressed]
            ),
            Strategy(
                name: "Recognize my body’s hunger signals",
                instructions: "When you feel cues like a growling stomach or low energy, decide which signal stands out. Which cue is most noticeable?",
                content: [
                    "A growling stomach",
                    "A drop in energy",
                    "Cravings emerging gradually",
                    "A feeling of lightheadedness"
                ],
                eatingStyles: [.selfCare, .unconfident]
            ),
            Strategy(
                name: "Quantify my hunger before eating",
                instructions: "Before your meal, rate your hunger to guide your portion size. Which method will you use?",
                content: [
                    "Use a 1-10 scale to gauge hunger",
                    "Estimate hunger as low, medium, or high",
                    "Match hunger level with portion size",
                    "Decide based on a quick self-check"
                ],
                eatingStyles: [.selfCare, .unconfident]
            ),
            Strategy(
                name: "Focus on eating purely for taste",
                instructions: "Recall a meal where taste was the main attraction. Which approach will help you savor the flavor?",
                content: [
                    "Eat slowly to relish each flavor",
                    "Pair the meal with a complementary beverage",
                    "Concentrate solely on the taste",
                    "Eliminate distractions to focus on flavor"
                ],
                eatingStyles: [.selfCare, .stressed]
            ),
            Strategy(
                name: "Distinguish between emotional and physical hunger",
                instructions: "Reflect on recent meals to identify whether hunger was emotional or physical. Which indicator is most clear?",
                content: [
                    "Physical hunger comes with stomach signals",
                    "Emotional hunger feels sudden and intense",
                    "Physical hunger builds gradually",
                    "Emotional hunger is linked to mood swings"
                ],
                eatingStyles: [.stressed, .selfCare]
            ),
            Strategy(
                name: "Explore my unique hunger experiences",
                instructions: "Consider the different ways hunger shows up for you. Which pattern resonates most?",
                content: [
                    "Subtle cues before eating",
                    "Strong, sudden hunger signals",
                    "Varied hunger patterns by time of day",
                    "A mix of emotional and physical cues"
                ],
                eatingStyles: [.selfCare, .unconfident]
            ),
            Strategy(
                name: "Identify energy-driven eating moments",
                instructions: "Reflect on times you ate to boost your energy. Which trigger was most noticeable?",
                content: [
                    "Low energy leading to a quick snack",
                    "A dip in concentration prompting food intake",
                    "Feeling tired and choosing a boost meal",
                    "Using food as an immediate energy fix"
                ],
                eatingStyles: [.selfCare, .unconfident]
            ),
            Strategy(
                name: "Analyze factors behind negative eating experiences",
                instructions: "Identify situations that made your meals less enjoyable. Which factor played a major role?",
                content: [
                    "Distracting or chaotic environments",
                    "Rushed or stressful meal times",
                    "Emotional distress affecting taste",
                    "Poor planning leading to unsatisfying meals"
                ],
                eatingStyles: [.stressed]
            ),
            Strategy(
                name: "Capture the feeling of complete meal satisfaction",
                instructions: "After a meal, focus on signs of full satisfaction. Which description best fits how you feel?",
                content: [
                    "Content and relaxed",
                    "Energetic and light",
                    "Comfortably full without heaviness",
                    "Grateful and nourished"
                ],
                eatingStyles: [.selfCare, .unconfident]
            ),
            Strategy(
                name: "Practice mindfulness to detect fullness",
                instructions: "During your meal, use mindfulness to notice when you're full. Which technique will you try?",
                content: [
                    "Chew slowly and pause frequently",
                    "Set a timer to remind me to check in",
                    "Focus on the taste of each bite",
                    "Regularly assess my fullness level"
                ],
                eatingStyles: [.selfCare, .unconfident]
            ),
            Strategy(
                name: "Slow down my eating to recognize fullness",
                instructions: "At your next meal, deliberately slow your pace to better sense fullness. Which method will you use?",
                content: [
                    "Chew each bite 20 times",
                    "Pause between bites and sip water",
                    "Set a mindful eating pace with breaks",
                    "Consciously reduce my eating speed"
                ],
                eatingStyles: [.selfCare, .stressed]
            ),
            Strategy(
                name: "Prevent extreme hunger before meals",
                instructions: "Plan a small pre-meal snack to avoid getting overly hungry. Which option will you try?",
                content: [
                    "Eat a light fruit or yogurt 30 minutes before a meal",
                    "Have a handful of nuts pre-meal",
                    "Drink a glass of water before eating",
                    "Prepare a small veggie snack in advance"
                ],
                eatingStyles: [.selfCare]
            ),
            Strategy(
                name: "Initiate meals at moderate hunger",
                instructions: "Begin your meal when you’re moderately hungry to help control portions. Which signal will you trust?",
                content: [
                    "Notice when hunger is a gentle nudge",
                    "Start eating when energy dips slightly",
                    "Begin the meal at the first sign of hunger",
                    "Use a quick self-check before eating"
                ],
                eatingStyles: [.selfCare]
            ),
            Strategy(
                name: "Examine the triggers for starting my meals",
                instructions: "Reflect on what prompts you to start eating. Which trigger seems most influential?",
                content: [
                    "True physical hunger signals",
                    "Social or environmental cues",
                    "Emotional comfort or stress relief",
                    "Habitual timing regardless of hunger"
                ],
                eatingStyles: [.stressed]
            ),
            Strategy(
                name: "Evaluate family influences on my eating habits",
                instructions: "Consider how family traditions or expectations affect your food choices. Which influence do you notice most?",
                content: [
                    "Family recipes that guide my choices",
                    "Parental attitudes about portion sizes",
                    "Cultural food traditions I follow",
                    "Peer pressure from relatives around meals"
                ],
                eatingStyles: [.anxious, .stressed]
            ),
            Strategy(
                name: "Investigate the reasons behind my eating",
                instructions: "Reflect on whether your eating is driven by hunger, emotion, or social cues. Which reason is most evident?",
                content: [
                    "Physical hunger drives my meals",
                    "Emotional needs prompt me to eat",
                    "Social situations influence my eating",
                    "Habitual routines determine my intake"
                ],
                eatingStyles: [.stressed]
            ),
            Strategy(
                name: "Practice self-compassion in my eating habits",
                instructions: "Recall a time you treated yourself kindly during a meal. Which self-compassion strategy will you use next time?",
                content: [
                    "Give myself a break for indulging occasionally",
                    "Affirm that my choices are valid",
                    "Celebrate small wins in healthy eating",
                    "Focus on progress rather than perfection"
                ],
                eatingStyles: [.stressed, .unconfident]
            ),
            Strategy(
                name: "Celebrate my body and food choices",
                instructions: "Identify aspects of your body and meals that you appreciate. Which appreciation resonates with you?",
                content: [
                    "Grateful for nourishing foods",
                    "Thankful for my body’s strength",
                    "Appreciate the flavors that boost my mood",
                    "Value my body’s resilience and care"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Recognize the emotions surrounding my meals",
                instructions: "Before, during, and after eating, note the emotions that arise. Which emotion do you experience most often?",
                content: [
                    "Happiness and contentment",
                    "Stress or anxiety",
                    "Sadness or loneliness",
                    "Excitement and anticipation"
                ],
                eatingStyles: [.stressed]
            ),
            Strategy(
                name: "Incorporate self-care into my eating routine",
                instructions: "Plan self-care activities to support your meals. Which option will you add?",
                content: [
                    "Take a short walk before meals",
                    "Practice deep breathing before eating",
                    "Listen to calming music during meals",
                    "Set aside time to relax after eating"
                ],
                eatingStyles: [.stressed, .unconfident]
            ),
            Strategy(
                name: "Establish a balanced daily eating routine",
                instructions: "Outline a daily routine that keeps your eating balanced. Which element is most important?",
                content: [
                    "Regular meal times with balanced portions",
                    "Healthy snacks between meals",
                    "Variety in meal choices",
                    "Scheduled mindful eating sessions"
                ],
                eatingStyles: [.selfCare, .anxious]
            ),
            Strategy(
                name: "Explore how food can nurture my well-being",
                instructions: "Identify ways your food choices contribute to self-care. Which nurturing option will you try?",
                content: [
                    "Cook a nourishing, homemade meal",
                    "Prepare a vibrant, fresh salad",
                    "Enjoy a warm, comforting soup",
                    "Savor a mindful, balanced snack"
                ],
                eatingStyles: [.selfCare, .stressed]
            ),
            Strategy(
                name: "Embrace and sit with my tough feelings",
                instructions: "When facing difficult emotions, allow yourself to feel them fully. Which technique will you use?",
                content: [
                    "Take a few deep breaths to center myself",
                    "Journal briefly about my feelings",
                    "Practice a short mindfulness meditation",
                    "Talk to a supportive friend about my emotions"
                ],
                eatingStyles: [.stressed]
            ),
            Strategy(
                name: "Acknowledge mixed emotions when setting food limits",
                instructions: "Reflect on the sadness that may come with limiting food. Which strategy will help you balance these feelings?",
                content: [
                    "Allow occasional indulgence without guilt",
                    "Practice self-compassion during limits",
                    "Set flexible portion controls",
                    "Focus on the benefits of mindful eating"
                ],
                eatingStyles: [.stressed]
            ),
            Strategy(
                name: "Identify my emotional needs during eating",
                instructions: "Consider what you truly need when emotions drive your eating. Which need is most apparent?",
                content: [
                    "Comfort and warmth",
                    "Reassurance and validation",
                    "A break from stress",
                    "A sense of connection or calm"
                ],
                eatingStyles: [.stressed]
            ),
            Strategy(
                name: "Discover alternative stress relief methods",
                instructions: "Identify activities that help manage stress without turning to food. Which option will you try?",
                content: [
                    "Take a brisk walk or exercise",
                    "Practice deep breathing or meditation",
                    "Call a friend or family member",
                    "Engage in a hobby or creative activity"
                ],
                eatingStyles: [.stressed]
            ),
            Strategy(
                name: "Prepare a plan for challenging eating situations",
                instructions: "When facing tricky eating moments, choose a strategy to handle them. Which plan will you follow?",
                content: [
                    "Take a brief pause to reassess",
                    "Practice mindful breathing before eating",
                    "Step away and return when calmer",
                    "Use a pre-decided snack as a fallback"
                ],
                eatingStyles: [.stressed, .selfCare]
            ),
            Strategy(
                name: "Reflect on my body image perspective",
                instructions: "Examine how you view your body. Which statement best describes your perspective?",
                content: [
                    "I see my body as strong and capable",
                    "I focus on areas I’d like to improve",
                    "I often feel self-critical about my body",
                    "I appreciate my body’s unique qualities"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Devise strategies to nurture my body",
                instructions: "List methods to care for your body through nutrition and self-care. Which method appeals to you?",
                content: [
                    "Plan regular relaxation breaks",
                    "Incorporate gentle exercise into my day",
                    "Prepare meals rich in nutrients",
                    "Ensure adequate sleep and hydration"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Show kindness to my body",
                instructions: "Choose a method to treat your body kindly. Which option will you try?",
                content: [
                    "Recite a positive affirmation",
                    "Engage in a relaxing activity like yoga",
                    "Treat yourself to a nourishing meal",
                    "Take a moment for a self-massage or rest"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Challenge negative body messages",
                instructions: "When negative messages about your body arise, choose a counter-strategy. Which response feels right?",
                content: [
                    "Recite empowering affirmations",
                    "Focus on my body’s strengths",
                    "Avoid comparing myself to others",
                    "Replace criticism with gratitude"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Honor my body with proper care",
                instructions: "Decide on a practice that shows your body respect. Which option will you adopt?",
                content: [
                    "Plan nutritious, balanced meals",
                    "Ensure regular physical activity",
                    "Take time for rest and recovery",
                    "Adopt mindful self-care routines"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Embrace my body’s natural rhythms",
                instructions: "Reflect on your body's natural pace. Which approach helps you accept its flow?",
                content: [
                    "Recognize signals without judgment",
                    "Allow flexibility in meal timing",
                    "Appreciate natural hunger cycles",
                    "Let go of rigid eating schedules"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Celebrate my body’s capabilities",
                instructions: "Acknowledge your body’s strengths. Which quality are you most proud of?",
                content: [
                    "Endurance and stamina",
                    "Flexibility and balance",
                    "Strength and resilience",
                    "Adaptability and recovery"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Expand my gratitude for my body",
                instructions: "List additional things you appreciate about your body. Which aspect will you focus on?",
                content: [
                    "Its ability to heal and recover",
                    "The energy it provides me daily",
                    "Its unique features and strengths",
                    "The support it gives me in all activities"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Design a daily care plan for my body",
                instructions: "Outline your routine for daily body care. Which component is essential?",
                content: [
                    "Regular nutritious meals",
                    "Consistent sleep and rest",
                    "Daily physical activity",
                    "Mindfulness and relaxation practices"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Use positive self-talk about my body",
                instructions: "Adopt affirmations to boost your body image. Which affirmation will you repeat?",
                content: [
                    "I am strong and capable",
                    "I honor my body’s unique beauty",
                    "I deserve care and kindness",
                    "I appreciate all that my body does for me"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Choose uplifting clothes that boost my confidence",
                instructions: "Select clothing that makes you feel great. Which style best lifts your mood?",
                content: [
                    "Bright and bold outfits",
                    "Comfortable and relaxed wear",
                    "Chic and stylish ensembles",
                    "Clothes that emphasize my favorite features"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Engage in an activity that nurtures my body",
                instructions: "Pick an activity that makes your body feel cared for. Which option will you choose?",
                content: [
                    "Take a gentle walk or stretch",
                    "Enjoy a relaxing yoga session",
                    "Indulge in a warm bath or self-massage",
                    "Spend time outdoors in nature"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Avoid comparing myself to others",
                instructions: "Focus on your own progress without comparisons. Which strategy will you use?",
                content: [
                    "Set personal goals rather than benchmarks",
                    "Celebrate my unique journey",
                    "Practice gratitude for my own progress",
                    "Remind myself that everyone's path is different"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Revise my social media habits for a healthier mindset",
                instructions: "Plan how to change your social media use to protect your mood. Which change will you implement?",
                content: [
                    "Unfollow triggering accounts",
                    "Limit screen time during meals",
                    "Curate a positive feed",
                    "Schedule regular social media breaks"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Notice and appreciate my daily movements",
                instructions: "Identify small movements that keep you active. Which example best reflects your day?",
                content: [
                    "Taking stairs instead of elevators",
                    "A quick stretch during breaks",
                    "A short walk after meals",
                    "Frequent standing or light activity"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Differentiate between structured workouts and daily movement",
                instructions: "Reflect on how planned exercise contrasts with everyday activity. Which aspect is most evident?",
                content: [
                    "Structured workouts have set times and goals",
                    "Daily movements are spontaneous and varied",
                    "Workouts focus on intensity, while daily activity is light",
                    "Both contribute to overall fitness differently"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Acknowledge the cumulative effect of small movements",
                instructions: "Notice how minor activities throughout the day add up. Which example stands out?",
                content: [
                    "Short walks adding up over time",
                    "Frequent stretching breaks",
                    "Light household chores throughout the day",
                    "Regular standing instead of sitting"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Reflect on my daily inactivity levels",
                instructions: "Examine periods of inactivity in your day. Which scenario do you recognize most?",
                content: [
                    "Long periods of sitting at work",
                    "Excessive screen time during free hours",
                    "Minimal physical activity throughout the day",
                    "Neglecting movement during leisure time"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Identify barriers to regular exercise",
                instructions: "Consider what prevents you from exercising consistently. Which barrier is most significant?",
                content: [
                    "Lack of time",
                    "Low energy or motivation",
                    "Fear of injury or discomfort",
                    "Uncertainty about effective routines"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Plan to incorporate more movement into my routine",
                instructions: "Identify ways to add small movements throughout your day. Which strategy will you try?",
                content: [
                    "Short walking breaks every hour",
                    "A quick stretch or exercise session in the morning",
                    "Standing while working or watching TV",
                    "A brief walk after each meal"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Monitor my exercise balance",
                instructions: "Reflect on signs of overexertion. Which indicator suggests I might be overdoing exercise?",
                content: [
                    "Persistent fatigue or soreness",
                    "Reduced performance in workouts",
                    "Feeling mentally drained after exercise",
                    "Lack of enjoyment in physical activity"
                ],
                eatingStyles: [.unconfident]
            ),
            Strategy(
                name: "Assess my comfort with nutrition information",
                instructions: "Reflect on how nutrition details affect your choices. Which statement best describes your comfort level?",
                content: [
                    "I feel confident in using nutrition info",
                    "I sometimes feel overwhelmed by details",
                    "I am curious but cautious about new info",
                    "I prefer to keep it simple and intuitive"
                ],
                eatingStyles: [.anxious]
            ),
            Strategy(
                name: "Connect my meal choices with my mood",
                instructions: "Reflect on the link between what you eat and how you feel. Which pattern do you notice?",
                content: [
                    "Nutritious meals boost my energy",
                    "Heavier meals make me feel sluggish",
                    "Balanced meals stabilize my mood",
                    "Indulgent meals affect my emotions negatively"
                ],
                eatingStyles: [.selfCare, .stressed]
                )
    ]
    
    func printStrategies() {
        print("\n=== Strategies After Initialization ===")
        for (index, strategy) in strategies.enumerated() {
            print("Strategy \(index): \(strategy.name ?? "unnamed")")
            print("Eating styles: \(strategy.eatingStyles.map { $0.rawValue })")
            print("---")
        }
    }
    
    init(eatingStyle: EatingStyle, monName: String) {
        self.eatingStyle = eatingStyle
        self.monName = monName
        printStrategies()
    }
    
    // Make this a method rather than a computed property for Swift Data compatibility
    func getFilteredStrategies() -> [Strategy] {
        print("\n=== Starting Strategy Filtering ===")
        print("User eating style: \(eatingStyle.rawValue)")
        print("Total strategies before filtering: \(strategies.count)")
        
        // Print all strategies and their eating styles before filtering
        print("\nAll strategies before filtering:")
        for (index, strategy) in strategies.enumerated() {
            print("Strategy \(index): \(strategy.name ?? "unnamed")")
            print("Eating styles: \(strategy.eatingStyles.map { $0.rawValue })")
            print("---")
        }

        // Make sure we're comparing the same eating style types
        let userStyle = eatingStyle
        let filtered = strategies.filter { strategy in
            let contains = strategy.eatingStyles.contains(userStyle)
            print("\nChecking strategy: \(strategy.name ?? "unnamed")")
            print("Strategy eating styles: \(strategy.eatingStyles.map { $0.rawValue })")
            print("User eating style: \(userStyle.rawValue)")
            print("Contains: \(contains)")
            return contains
        }

        print("\n=== Filtering Results ===")
        print("Filtered count: \(filtered.count)")
        print("Filtered strategies:")
        for (index, strategy) in filtered.enumerated() {
            print("Strategy \(index): \(strategy.name ?? "unnamed")")
            print("Eating styles: \(strategy.eatingStyles.map { $0.rawValue })")
            print("---")
        }

        return filtered
    }
    
    func updateStreak() {
        streak += 1
    }
    
    func addXP(_ amount: Int) {
        let oldLevel = level
        xp += amount
        // Check for level up
        let nextLevelXP = getXPForNextLevel()
        if xp >= nextLevelXP {
            xp -= nextLevelXP
            level += 1
        }
        // Only show level up animation if we actually leveled up
        showLevelUpAnimation = level > oldLevel
    }
    
    func getXPForNextLevel() -> Int {
        return level * 100
    }
    
    func getXPProgress() -> Double {
        return Double(xp) / Double(getXPForNextLevel())
    }
}

let props: [(name: String, weight: Int)] = [
    ("mushroom", 2)
]
