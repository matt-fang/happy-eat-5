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
    static let schemaVersion = Schema.Version(1, 0, 0)
    @Attribute(.unique) var id = UUID()
    var eatingStyle: EatingStyle?
    var streak: Int = 0
    var lastCompletedDate: Date?
    
    var playStreakAnimation: Bool = false
    
    @Relationship(deleteRule: .cascade) var strategies: [Strategy] = [
        Strategy(
            name: "figure out what good nutrition means for me",
            instructions: """
              Write down some simple ideas about how a balanced mix of nutrients supports your health. Jot down a few key principles that are easy to follow.
              """,
            content: "Detail your understanding of nutrition here...",
            contentType: .textField,
            eatingStyles: [.diethistory]
        ),
        Strategy(
            name: "add some fun and variety to my meals",
            instructions: """
              Write down a few ideas on trying new foods or mixing up your meals. Note any examples of fun choices that made your dining experience more enjoyable.
              """,
            content: "Share your ideas for fun food here...",
            contentType: .textField,
            eatingStyles: [.gentle, .diethistory]
        ),
        Strategy(
            name: "come up with simple nutrition ideas that work for me",
            instructions: """
              Reflect on some straightforward nutrition principles. Write down a few that you think are practical and easy to follow in your daily routine.
              """,
            content: "Detail your simple nutrition ideas here...",
            contentType: .textField,
            eatingStyles: [.diethistory]
        ),
        Strategy(
            name: "put together a simple eating plan for myself",
            instructions: """
              Review your thoughts on eating so far and write down a plan with a few key steps to help build a healthier relationship with food.
              """,
            content: "Summarize your eating plan here...",
            contentType: .textField,
            eatingStyles: [.diethistory, .gentle]
        ),
        
        Strategy(
            name: "reflect on how diets have affected me",
            instructions: """
              Think back on my past experiences with dieting. Write about moments when diet rules made me feel restricted or frustrated, and note any negative effects like extra cravings or lower self-esteem.
              """,
            content: "Enter your reflections here...",
            contentType: .textField,
            eatingStyles: [.diethistory, .emotional]
        ),
        Strategy(
            name: "list what worked and what didn't with dieting",
            instructions: """
              Make two simple lists: one for things that felt helpful when I dieted, and another for the drawbacks. Write a few notes on how each made me feel.
              """,
            content: "List your pros and cons here...",
            contentType: .textField,
            eatingStyles: [.diethistory]
        ),
        Strategy(
            name: "notice how being deprived makes me crave things",
            instructions: """
              Think about a time when not getting what I wanted made my cravings stronger. Write down a few thoughts on the feelings that came up and how they might affect my eating now.
              """,
            content: "Describe your experience of deprivation here...",
            contentType: .textField,
            eatingStyles: [.emotional, .gentle]
        ),
        Strategy(
            name: "write about times I pushed back against diet rules",
            instructions: """
              Recall a moment when I broke a diet rule. Write down what happened, why I chose to rebel, and what it felt like to reclaim my choices.
              """,
            content: "Document your rebellious experience here...",
            contentType: .textField,
            eatingStyles: [.diethistory, .emotional]
        ),
        Strategy(
            name: "reclaim my food choices on my own terms",
            instructions: """
              Imagine making all my food decisions based on what feels right for me. Write down a few ideas about how being true to myself can boost my satisfaction.
              """,
            content: "Enter your reflection on autonomy here...",
            contentType: .textField,
            eatingStyles: [.gentle, .emotional]
        ),
        Strategy(
            name: "let go of the dieting mindset",
            instructions: """
              Write about simple steps I can take to move away from diet culture—like putting away the scale or skipping diet apps—and note why these changes might help me trust my body.
              """,
            content: "Write your plan for a non-diet mentality here...",
            contentType: .textField,
            eatingStyles: [.diethistory, .gentle]
        ),
        Strategy(
            name: "note what I'd like to change about my eating habits",
            instructions: """
              Look at my current eating routines and jot down any parts I'd like to improve—whether it's getting more satisfaction from meals or reducing stress when I eat.
              """,
            content: "Detail the changes you want to make here...",
            contentType: .textField,
            eatingStyles: [.gentle]
        ),
        Strategy(
            name: "honor my cravings by eating what I really want",
            instructions: """
              Think of a food I truly crave and write about the satisfaction it brings. Note a time when choosing what I wanted made me feel more balanced.
              """,
            content: "Describe your craving experiences here...",
            contentType: .textField,
            eatingStyles: [.emotional, .gentle]
        ),
        Strategy(
            name: "notice how dieting has taken the joy out of my meals",
            instructions: """
              Reflect on a time when following strict diet rules left my meals feeling joyless. Write down a few thoughts on what was missing and how it affected me.
              """,
            content: "Share your thoughts on dieting's impact here...",
            contentType: .textField,
            eatingStyles: [.diethistory, .emotional]
        ),
        Strategy(
            name: "find out what really makes my meals satisfying",
            instructions: """
              Think about the tastes, textures, and aromas that make a meal enjoyable for me. Write down a few notes on what elements add up to a satisfying experience.
              """,
            content: "Enter your observations on meal satisfaction here...",
            contentType: .textField,
            eatingStyles: [.gentle]
        ),
        Strategy(
            name: "notice what makes food look appealing to me",
            instructions: """
              Reflect on meals or food images that caught my eye. Write a few thoughts about the colors, presentation, or style that makes food inviting.
              """,
            content: "Describe what makes food look appealing to you here...",
            contentType: .textField,
            eatingStyles: [.gentle]
        ),
        Strategy(
            name: "pay attention to how my body feels after eating",
            instructions: """
              After a meal, notice how my body reacts—whether I feel energized, relaxed, or overly full. Jot down a few notes on these sensations.
              """,
            content: "Share your body's post-meal sensations here...",
            contentType: .textField,
            eatingStyles: [.gentle, .bodyimage]
        ),
        Strategy(
            name: "plan a meal that delights all my senses",
            instructions: """
              Imagine a meal that excites my taste, touch, smell, and sight. Write a simple plan that outlines what I'd eat and how I want to feel.
              """,
            content: "Plan your ideal meal here...",
            contentType: .textField,
            eatingStyles: [.gentle]
        ),
        Strategy(
            name: "look at my eating setting and pace",
            instructions: """
              Think about where and how quickly I eat. Write down a few observations about any distractions or rushed moments, and note simple changes I could make.
              """,
            content: "Describe your eating environment and pace here...",
            contentType: .textField,
            eatingStyles: [.gentle]
        ),
        Strategy(
            name: "see how my hunger and feelings affect my meals",
            instructions: """
              Before and after a meal, check in with how hungry I feel and what emotions I notice. Write a few notes on any patterns that emerge.
              """,
            content: "Record your hunger and emotional states here...",
            contentType: .textField,
            eatingStyles: [.gentle, .emotional]
        ),
        Strategy(
            name: "see how stress or chaos affect my meal enjoyment",
            instructions: """
              Think about a meal eaten in a busy or stressful setting. Write down a few thoughts on how that environment changed my experience and what I might do differently.
              """,
            content: "Detail how conflict or chaos has impacted your meals here...",
            contentType: .textField,
            eatingStyles: [.emotional]
        ),
        Strategy(
            name: "sum up what really makes my meals satisfying",
            instructions: """
              Review the different factors—like taste, texture, and setting—that make a meal enjoyable. Write down a few key points that stand out to me.
              """,
            content: "Summarize your key satisfaction factors here...",
            contentType: .textField,
            eatingStyles: [.gentle]
        ),
        Strategy(
            name: "write down my personal food rules",
            instructions: """
              List the rules I've set for myself about what or how much to eat. Write a few notes on why I created these rules and whether I'd like to change them.
              """,
            content: "Document your food rules here...",
            contentType: .textField,
            eatingStyles: [.diethistory]
        ),
        Strategy(
            name: "trace where my food rules come from",
            instructions: """
              Think about the origins of my food rules—whether from family, culture, or media. Write down a few examples and what I've learned from them.
              """,
            content: "Describe the origins of your food rules here...",
            contentType: .textField,
            eatingStyles: [.diethistory]
        ),
        Strategy(
            name: "let go of food rules that hold me back",
            instructions: """
              Reflect on the rules that make me feel restricted. Write a few notes on the benefits of releasing these restrictions and how it might free me to enjoy food more.
              """,
            content: "Write about the rules you want to let go of here...",
            contentType: .textField,
            eatingStyles: [.diethistory, .gentle]
        ),
        Strategy(
            name: "notice my automatic eating habits",
            instructions: """
              Observe my daily routines and write down moments when I eat out of habit rather than hunger. Note a few examples and how these patterns affect my satisfaction.
              """,
            content: "Detail your habitual eating patterns here...",
            contentType: .textField,
            eatingStyles: [.gentle]
        ),
        Strategy(
            name: "log everything I eat for one week",
            instructions: """
              Keep a simple record of my meals over the next week, noting what I ate and how I felt before and after. Write down any patterns or insights that come up.
              """,
            content: "Enter your weekly food log here...",
            contentType: .textField,
            eatingStyles: [.gentle]
        ),
        Strategy(
            name: "think about how my friends influence my food rules",
            instructions: """
              Reflect on conversations and situations with friends that have shaped my ideas about food. Write a few notes on specific examples and what I might do differently.
              """,
            content: "Share your reflections on peer influence here...",
            contentType: .textField,
            eatingStyles: [.diethistory, .emotional]
        ),
        Strategy(
            name: "celebrate my favorite foods",
            instructions: """
              List a few foods I love and write about why they make me happy—whether it's their taste, texture, or the memories they bring.
              """,
            content: "Detail your favorite foods here...",
            contentType: .textField,
            eatingStyles: [.gentle, .emotional]
        ),
        Strategy(
            name: "notice any negative judgments I have about food",
            instructions: """
              Think about moments when I felt judged for my food choices. Write down a few examples of these thoughts and how they affect my eating.
              """,
            content: "List the negative messages you experience here...",
            contentType: .textField,
            eatingStyles: [.diethistory, .emotional]
        ),
        Strategy(
            name: "challenge the negative thoughts I have about food",
            instructions: """
              Identify one or two common negative judgments I hold. Write a few notes on how I might counter these thoughts with more positive ideas.
              """,
            content: "Detail your strategies to challenge food judgments here...",
            contentType: .textField,
            eatingStyles: [.emotional]
        ),
        Strategy(
            name: "find more flexible ways to think about food",
            instructions: """
              Reflect on times I labeled food as strictly 'good' or 'bad' and write down alternative, more balanced ideas. Jot down a few thoughts on how flexibility can help me enjoy food more.
              """,
            content: "Write about how you can think more flexibly about food here...",
            contentType: .textField,
            eatingStyles: [.gentle, .emotional]
        ),
        Strategy(
            name: "let go of perfection in my food choices",
            instructions: """
              Think about moments when trying to be perfect with my eating led to stress. Write a few notes on how relaxing this standard might help me enjoy food more freely.
              """,
            content: "Detail your experiences with perfectionism here...",
            contentType: .textField,
            eatingStyles: [.emotional, .diethistory]
        ),
        Strategy(
            name: "embrace a 'for the most part' approach to eating",
            instructions: """
              Reflect on the benefits of not being too rigid with my food choices. Write down a few thoughts on how a flexible, 'most of the time' mindset can lead to better eating experiences.
              """,
            content: "Describe your thoughts on a flexible approach here...",
            contentType: .textField,
            eatingStyles: [.gentle]
        ),
        Strategy(
            name: "see how my emotions affect my eating habits",
            instructions: """
              Think about a recent meal and write down how my feelings before, during, and after eating influenced what and how I ate. Jot down a few notes on any patterns I notice.
              """,
            content: "Share your emotional impact analysis here...",
            contentType: .textField,
            eatingStyles: [.emotional]
        ),
        Strategy(
            name: "stand up for my food choices",
            instructions: """
              Recall a time when I needed to defend what I ate. Write a few notes on how I handled the situation and list some ideas for how I can confidently assert my choices in the future.
              """,
            content: "Write about asserting yourself regarding food here...",
            contentType: .textField,
            eatingStyles: [.emotional]
        ),
        Strategy(
            name: "notice the signals my body gives when I'm hungry",
            instructions: """
              Pay attention to physical cues like a growling stomach or low energy. Write down a few notes on what these signals feel like and how they guide my eating.
              """,
            content: "Document your hunger signals here...",
            contentType: .textField,
            eatingStyles: [.gentle, .bodyimage]
        ),
        Strategy(
            name: "rate how hungry I feel before a meal",
            instructions: """
              Before eating, give your hunger a number from 1 to 10 and write a few notes on how that level relates to how much you enjoy your meal.
              """,
            content: "Enter your hunger ratings and observations here...",
            contentType: .textField,
            eatingStyles: [.gentle, .bodyimage]
        ),
        Strategy(
            name: "reflect on times I ate just for the taste",
            instructions: """
              Think about meals where taste was the main attraction rather than real hunger. Write a few notes on how that felt and which foods sparked those cravings.
              """,
            content: "Describe your taste hunger experiences here...",
            contentType: .textField,
            eatingStyles: [.gentle, .emotional]
        ),
        Strategy(
            name: "tell the difference between emotional and physical hunger",
            instructions: """
              Reflect on moments when I ate because of my feelings versus true hunger. Write a few notes on the differences and how I can recognize each one.
              """,
            content: "Share your experiences with emotional hunger here...",
            contentType: .textField,
            eatingStyles: [.emotional, .gentle]
        ),
        Strategy(
            name: "write about my unique hunger experiences",
            instructions: """
              Think about different times when hunger felt distinct—whether it's a subtle signal or a strong urge. Jot down a few notes on these varied experiences.
              """,
            content: "Document your unique hunger experiences here...",
            contentType: .textField,
            eatingStyles: [.gentle, .bodyimage]
        ),
        Strategy(
            name: "notice when I eat to boost my energy",
            instructions: """
              Reflect on moments when I reached for food mainly to feel more energized. Write a few notes on what cues told me I needed an energy boost.
              """,
            content: "Record your energy-driven eating moments here...",
            contentType: .textField,
            eatingStyles: [.gentle, .bodyimage]
        ),
        Strategy(
            name: "think about situations that lead to negative eating experiences",
            instructions: """
              Look at times when my eating environment or mindset made meals less enjoyable. Write a few notes on what factors contributed and how I might change them.
              """,
            content: "Describe the negative setups you have experienced here...",
            contentType: .textField,
            eatingStyles: [.emotional]
        ),
        Strategy(
            name: "describe how it feels to be fully satisfied after a meal",
            instructions: """
              After a meal, pay attention to feelings like contentment or relaxed energy. Write a few notes on the physical sensations that tell me I'm satisfied.
              """,
            content: "Enter your observations of fullness here...",
            contentType: .textField,
            eatingStyles: [.gentle, .bodyimage]
        ),
        Strategy(
            name: "use mindfulness to notice when I'm full",
            instructions: """
              Think about a recent meal and focus on each bite to see when you start feeling full. Write a few notes on any techniques you used and what you observed.
              """,
            content: "Detail your mindfulness practices here...",
            contentType: .textField,
            eatingStyles: [.gentle, .bodyimage]
        ),
        //MARK: next copy paste

        Strategy(
            name: "slow down my eating so I can notice when I'm full",
            instructions: """
              Think about a meal when you purposely slowed your pace to feel when you were full. Write a simple plan—maybe by chewing longer or pausing between bites—and later note what you observed.
              """,
            content: "Describe your slow-eating plan and observations here...",
            contentType: .action,
            eatingStyles: [.gentle, .emotional]
        ),
        Strategy(
            name: "stop myself from getting overly hungry before meals",
            instructions: """
              Recall a time when you were extremely hungry before a meal. Write down a few ideas to avoid that feeling—perhaps by having a light snack beforehand—and note why this might help keep your meals balanced.
              """,
            content: "Enter your ideas to avoid extreme hunger here...",
            contentType: .textField,
            eatingStyles: [.gentle]
        ),
        Strategy(
            name: "start my meal when I'm just a little hungry",
            instructions: """
              Consider what being moderately hungry feels like for you. Write down your thoughts on how starting your meal sooner might help with portion control and enjoying flavors.
              """,
            content: "Detail your ideal hunger level and its benefits here...",
            contentType: .textField,
            eatingStyles: [.gentle]
        ),
        Strategy(
            name: "explore why I begin eating",
            instructions: """
              Reflect on what usually prompts you to start eating. Write down whether it's true hunger or other cues, and note any patterns you notice.
              """,
            content: "Describe your reasons for starting a meal here...",
            contentType: .textField,
            eatingStyles: [.emotional]
        ),
        Strategy(
            name: "think about how my family shapes my eating habits",
            instructions: """
              Consider how family expectations or habits influence your food choices. Write down a couple of examples and a few ideas on how you might adjust these influences to fit your needs.
              """,
            content: "Detail the family influences and your ideas here...",
            contentType: .textField,
            eatingStyles: [.diethistory, .emotional]
        ),
        Strategy(
            name: "dig into why I eat",
            instructions: """
              Think about all the reasons behind your eating—whether it's physical hunger, emotions, or social cues. Write down a few thoughts and examples of what drives you.
              """,
            content: "Document your reflections on why you eat here...",
            contentType: .textField,
            eatingStyles: [.emotional]
        ),
        Strategy(
            name: "be kind to myself about my eating",
            instructions: """
              Recall a moment when you treated yourself kindly during a challenging eating experience. Write down what self-compassion looked like for you and a couple of affirmations or ideas.
              """,
            content: "Share your self-compassion thoughts here...",
            contentType: .textField,
            eatingStyles: [.emotional, .bodyimage]
        ),
        Strategy(
            name: "appreciate my food and my body",
            instructions: """
              List a few things you're grateful for about your food experiences and your body. Write down how taking a moment for gratitude makes you feel.
              """,
            content: "List your gratitude reflections here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "notice my emotions around eating",
            instructions: """
              Think about the feelings you experience before, during, and after meals. Write down a few quick thoughts on which emotions affect your choices and share any examples.
              """,
            content: "Detail your emotional experiences related to eating here...",
            contentType: .textField,
            eatingStyles: [.emotional]
        ),
        Strategy(
            name: "add self-care to support my eating",
            instructions: """
              Plan a couple of self-care activities that boost your well-being—like a short walk or a deep-breathing break. Write down your ideas and why they help you.
              """,
            content: "Enter your self-care plan here...",
            contentType: .textField,
            eatingStyles: [.emotional, .bodyimage]
        ),
        Strategy(
            name: "create a balanced eating routine for myself",
            instructions: """
              Think about what a balanced meal or daily routine looks like for you. Write down some ideas and examples that might help you feel steady throughout the day.
              """,
            content: "Describe your plan for balance here...",
            contentType: .textField,
            eatingStyles: [.gentle, .diethistory]
        ),
        Strategy(
            name: "discover how food can nurture me",
            instructions: """
              Write down a few ideas on how your food choices can be a form of self-care—like cooking a nourishing meal or savoring a mindful snack.
              """,
            content: "Share your nurturing ideas here...",
            contentType: .textField,
            eatingStyles: [.gentle, .emotional]
        ),
        Strategy(
            name: "sit with my tough feelings",
            instructions: """
              Recall a time when you let yourself feel a difficult emotion without distraction. Write down your experience and a couple of techniques that helped you stay present.
              """,
            content: "Document your experience with tough emotions here...",
            contentType: .textField,
            eatingStyles: [.emotional]
        ),
        Strategy(
            name: "recognize the sadness I feel when setting limits with food",
            instructions: """
              Think about a moment when stopping eating brought up mixed emotions. Write down your thoughts and a few ideas on how to balance those feelings with your needs.
              """,
            content: "Share your reflections on setting limits here...",
            contentType: .textField,
            eatingStyles: [.emotional]
        ),
        Strategy(
            name: "uncover what I really need emotionally when I eat",
            instructions: """
              Reflect on times when your feelings influenced your eating. Write down a few insights about what you truly need during those moments.
              """,
            content: "Detail your emotional needs here...",
            contentType: .textField,
            eatingStyles: [.emotional]
        ),
        Strategy(
            name: "find other ways to handle stress besides food",
            instructions: """
              Write down a few ideas for activities that help you manage stress—like taking a walk or calling a friend—and note why they work for you.
              """,
            content: "Write your stress-management ideas here...",
            contentType: .textField,
            eatingStyles: [.emotional]
        ),
        Strategy(
            name: "plan a strategy for tricky eating moments",
            instructions: """
              Think of a challenging eating situation and write down a simple plan to handle it—maybe by taking a break or practicing deep breathing. Later, note what you learned.
              """,
            content: "Describe your plan for challenging situations here...",
            contentType: .action,
            eatingStyles: [.emotional, .gentle]
        ),
        Strategy(
            name: "consider how I see my body",
            instructions: """
              Write down your thoughts on whether you view your body with strength or criticism. Note a few examples of how this perspective influences your eating.
              """,
            content: "Share your thoughts on your body perception here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "come up with ways to care for my body",
            instructions: """
              Write down a few simple ideas for treating your body kindly—like setting up a self-care routine or taking time to relax—and explain why these ideas help you.
              """,
            content: "Outline your body-care ideas here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "practice being gentle with my body",
            instructions: """
              Recall a moment when you were hard on yourself about your body. Write down a few ideas on how you can respond with kindness, such as a positive affirmation or a caring gesture.
              """,
            content: "Enter your self-compassion practices here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "push back against negative messages about my body",
            instructions: """
              Write down a few examples of negative thoughts you've had about your body and note some ideas for how to counter them with positive messages.
              """,
            content: "Document your ideas to challenge negative messages here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "treat my body with the care it deserves",
            instructions: """
              Think about ways to respect and nurture your body—like choosing nourishing foods or taking time to relax. Write down a few ideas on how to honor your body.
              """,
            content: "Share your ideas for honoring your body here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "accept my body's natural flow",
            instructions: """
              Write down a few thoughts on how embracing your body's natural rhythms can ease stress. Note some examples of what you appreciate about your body's natural pace.
              """,
            content: "Express your acceptance of your body's rhythms here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "celebrate what my body can do",
            instructions: """
              Write down a few quick thoughts on your body's strengths and abilities. Note some examples of what makes you feel strong.
              """,
            content: "List your body's strengths here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "add to my gratitude list for my body",
            instructions: """
              Write down a few more things you're thankful for about your body and its functions. Note how this gratitude lifts your mood.
              """,
            content: "Enter your extended gratitude list here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "plan for my body's daily care",
            instructions: """
              Think about what your body needs each day—like rest, movement, or nourishing food. Write down your current habits and a few simple ideas for improvement.
              """,
            content: "Outline your daily body-care plan here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "speak kindly to myself about my body",
            instructions: """
              Write down a few positive affirmations or compliments you can say about your body, and note how these words make you feel.
              """,
            content: "Enter your positive self-talk here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "pick out clothes that lift my spirits",
            instructions: """
              Write down some ideas about the types of clothes that make you feel comfortable and confident. Note a few examples of outfits that boost your mood.
              """,
            content: "Share your clothing ideas here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "do something that nurtures my body",
            instructions: """
              Think about an activity that makes you feel cared for—like a gentle walk, a short yoga session, or a warm bath. Write down a few ideas on how this helps you.
              """,
            content: "List your nurturing activities here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "stop comparing myself to others",
            instructions: """
              Reflect on times when comparing yourself to others left you feeling low. Write down a few ideas on how to focus on your own strengths and progress.
              """,
            content: "Reflect on your experiences with comparisons here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "adjust my social media habits for a better mindset",
            instructions: """
              Write down a few ideas on how you can change your social media use—like unfollowing triggering accounts or limiting screen time—and note why these changes might help.
              """,
            content: "Outline your social media changes here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "appreciate the little ways I move every day",
            instructions: """
              Write down some examples of small movements—like taking the stairs or a quick stretch—that boost your energy and mood.
              """,
            content: "Detail your daily movements here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "notice the difference between planned workouts and everyday movement",
            instructions: """
              Write down your thoughts on how structured exercise feels different from the natural movement in your daily life. Jot down a few examples of each.
              """,
            content: "Share your reflections on exercise and movement here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "recognize how little movements add up",
            instructions: """
              Consider how everyday actions—like fidgeting or a short walk—help keep you active. Write down your thoughts on these small but meaningful movements.
              """,
            content: "Express your understanding of small movements here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "think about how much time I spend inactive",
            instructions: """
              Write down your thoughts on when you feel most sedentary and note a few examples of how inactivity affects your energy or mood.
              """,
            content: "Document your sedentary habits here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "explore what holds me back from exercising",
            instructions: """
              Write down a few thoughts on any barriers or negative feelings you have toward exercise, and jot down some ideas that might help you overcome them.
              """,
            content: "Share your thoughts on exercise resistance here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "see how adding more movement could boost my day",
            instructions: """
              Write down some ideas about simple movements you can incorporate into your routine, and note how you think they might improve your mood or energy.
              """,
            content: "Detail your thoughts on adding movement here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "check if I'm overdoing exercise",
            instructions: """
              Write down any signs that you might be pushing yourself too hard, and note a few thoughts on why balancing exercise with rest is important.
              """,
            content: "Document signs of overexercising here...",
            contentType: .textField,
            eatingStyles: [.bodyimage]
        ),
        Strategy(
            name: "check my comfort with nutrition info",
            instructions: """
              Reflect on how food information influences your choices. Write down a few examples of what you're curious about and why.
              """,
            content: "Share your thoughts on nutrition info here...",
            contentType: .textField,
            eatingStyles: [.diethistory]
        ),
        Strategy(
            name: "see how my meals affect how I feel",
            instructions: """
              Write down your thoughts on the connection between your meals and your mood or energy. Note any patterns or examples that stand out.
              """,
            content: "Record your reflections on meal impacts here...",
            contentType: .textField,
            eatingStyles: [.gentle, .emotional]
        ),
    ]
    
    init(eatingStyle: EatingStyle) {
        self.eatingStyle = eatingStyle
    }
    
    // Make this a method rather than a computed property for Swift Data compatibility
    func getFilteredStrategies() -> [Strategy] {
        print("Filtering strategies...")
        print("User eating style: \(eatingStyle?.rawValue ?? "no eating style in getFilteredStrategies()")")
        print("Total strategies before filtering: \(strategies.count)")

        let filtered = strategies.filter { $0.eatingStyles?.contains(eatingStyle ?? .gentle) ?? true }

        print("Filtered count: \(filtered.count)")
        for strategy in filtered {
            print("Strategy: \(strategy.eatingStyles)")
        }

        return filtered
    }
    
    func updateStreak() {
//        let calendar = Calendar.current
//        let today = Date()
//
//        if let lastDate = lastCompletedDate,
//           let dayDifference = calendar.dateComponents([.day], from: lastDate, to: today).day {
//            if dayDifference == 1 {
//                // Consecutive day - increment streak
//                streak += 1
//            } else if dayDifference > 1 {
//                // Streak broken - reset to 1
//                streak = 1
//            }
//            // If same day, streak remains unchanged
//        } else {
//            // First time completing - set streak to 1
//            streak = 1
//        }
//
//        lastCompletedDate = today
        streak += 1
    }
}
