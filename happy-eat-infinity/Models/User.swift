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
    @Attribute(.unique) var id = UUID()
    var eatingStyle: EatingStyle
    
    @Relationship var strategies = [
        Strategy(
            name: "Reflect on How Diets Impact You",
            instructions: "Reflect on your past experiences with dieting and identify how restrictive rules made you feel deprived, out of control, or frustrated. Write about specific moments when you felt restricted by diet rules and list the negative effects you noticed, such as increased cravings or low self-esteem. Use your journal to detail these experiences so you can better trust your body’s natural signals.",
            content: "Enter your detailed reflections here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "List and Compare the Pros and Cons of Dieting",
            instructions: "Create two lists in your journal: one for the benefits you experienced from dieting and one for the drawbacks. Explain how each pro or con affected your mood and behavior with specific examples (for instance, note if the stress and anxiety from dieting outweighed any positive outcomes). Reflect on which list weighed more and what that reveals about your relationship with food.",
            content: "List your pros and cons here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Explore the Effects of Deprivation on Your Cravings",
            instructions: "Think about a time when you were denied something you really wanted, and describe how that deprivation intensified your cravings and emotions. Write in detail about the feelings you experienced—such as anger, sadness, or frustration—and use bullet points if needed to list these emotions. Reflect on how these intense feelings might be influencing your current eating habits.",
            content: "Describe your experience of deprivation here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Record Your Acts of Rebellion Against Diet Rules",
            instructions: "Recall a specific time when you broke a dieting rule and write about what led you to rebel. Describe what you did, what prompted your rebellion, and the consequences of your actions. List examples (such as ignoring a food portion limit) and reflect on how this act helped you reclaim your autonomy in making food choices.",
            content: "Document your rebellious experience here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Claim Your Autonomy in Food Choices",
            instructions: "Imagine making all your food choices based solely on your body’s signals and personal taste. Write a detailed reflection on how being autonomous can increase your satisfaction and self-trust, and include examples of decisions you want to make without external pressure. List specific ways to start trusting your inner wisdom about food.",
            content: "Enter your reflection on autonomy here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Adopt a Non-Diet Mentality",
            instructions: "List the specific actions you can take to let go of the dieting mindset. For example, consider removing your scale, deleting diet apps, or stopping the habit of measuring portions. Write about why these changes will help you trust your body’s natural hunger and fullness signals and provide detailed examples of how to implement these changes in your daily life.",
            content: "Write your plan for a non-diet mentality here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Identify What Must Change in Your Eating Habits",
            instructions: "Reflect on your current eating behaviors and identify specific aspects that need improvement for a healthier relationship with food. Write in detail about what you wish to change—such as seeking more meal satisfaction or reducing stress while eating—and use bullet points to list your observations. Explain why these changes are important for your well-being.",
            content: "Detail the changes you want to make here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Honor Your Cravings by Choosing Desired Foods",
            instructions: "Identify a food that you truly crave and describe in detail the satisfaction it brings you when you eat it. Write about a time when you substituted one food for another and compare the resulting satisfaction levels. Use bullet points to list your observations and explain how allowing yourself to enjoy what you crave can lead to a more balanced and fulfilling eating experience.",
            content: "Describe your craving experiences here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Recognize How Dieting Steals Enjoyment from Eating",
            instructions: "Reflect on a period when dieting made your meals feel joyless and unfulfilling. Write in detail about what was missing from your eating experience—perhaps the freedom to choose or the pleasure of savoring your food without guilt—and provide specific examples from your life.",
            content: "Share your thoughts on dieting’s impact here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Discover What Makes Your Meals Satisfying",
            instructions: "Examine the sensory aspects of your meals by writing about the tastes, textures, and aromas that bring you satisfaction. Describe in detail how a well-balanced meal makes you feel, and use bullet points to list key elements that contribute to your meal satisfaction.",
            content: "Enter your observations on meal satisfaction here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Appreciate the Visual Appeal of Food",
            instructions: "Recall meals or food images that caught your eye because of their visual appeal. Write in detail about visual elements, such as vibrant colors or artful presentation, that made you eager to eat. Use bullet points to list these appealing features and explain how they enhance your overall dining experience.",
            content: "Describe what makes food look appealing to you here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Reflect on How Your Body Feels After Eating",
            instructions: "Write a detailed account of how different meals leave you feeling physically satisfied or comfortable. Describe specific sensations, such as energy levels or fullness, and note any differences between meals. Use bullet points to highlight which foods or eating styles help you feel your best.",
            content: "Share your body’s post-meal sensations here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Design a Meal That Pleases All Your Senses",
            instructions: "Plan a meal by answering questions about the taste, texture, temperature, aroma, and appearance you desire. Write a detailed plan that includes bullet points for the foods you want, the sensations you hope to experience, and the mood you wish to evoke. Explain how designing your meal this way will help you enjoy a balanced and deeply satisfying experience.",
            content: "Plan your ideal meal here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Examine Your Meal Environment and Eating Pace",
            instructions: "Reflect on your typical eating environment and identify any distractions—like phones, TV, or social media—that might detract from your meal enjoyment. Write in detail about how a rushed pace affects your ability to savor your food, and list specific changes you can make (such as putting your phone away or setting a slower pace).",
            content: "Describe your eating environment and pace here...",
            contentType: .textField,
            eatingStyle: .unconscious
        ),
        Strategy(
            name: "Evaluate How Hunger Levels and Emotions Affect Your Eating",
            instructions: "Before a meal, check in with yourself about your hunger level and emotional state, then write a detailed account of how these factors influence your meal satisfaction. Describe times when being too hungry or experiencing strong emotions altered your eating experience and list your observations using bullet points.",
            content: "Record your hunger and emotional states here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Assess How Conflict and Chaos Impact Your Meal Satisfaction",
            instructions: "Write about an instance when you ate in a stressful or chaotic environment, such as during an argument or in a noisy setting. Describe in detail how these conditions affected your ability to enjoy your meal, and list strategies you might use to create a more peaceful setting in the future using bullet points.",
            content: "Detail how conflict or chaos has impacted your meals here...",
            contentType: .textField,
            eatingStyle: .anxious
        ),
        Strategy(
            name: "Summarize the Key Factors That Make Your Meals Satisfying",
            instructions: "Review the various elements that contribute to a satisfying meal—taste, texture, environment, and more—and write a comprehensive summary that integrates your personal experiences and observations. Use bullet points to highlight the most important factors and reflect on how understanding these elements can help you plan better meals in the future.",
            content: "Summarize your key satisfaction factors here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "List and Reflect on Your Personal Food Rules",
            instructions: "Identify any rules you have established about what or how much to eat, and write a detailed reflection on why you created these rules. List each rule with bullet points, discuss their origins (e.g., family, media, cultural influences), and reflect on whether you want to keep or change them.",
            content: "Document your food rules here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Trace the Origins of Your Food Rules",
            instructions: "Think about where your food rules come from—whether family traditions, cultural messages, or media influence—and write a detailed account of these origins. List specific examples using bullet points and explain how understanding the source of these rules can empower you to modify them for a healthier relationship with food.",
            content: "Describe the origins of your food rules here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Let Go of Restrictive Food Rules",
            instructions: "Reflect on which food rules you feel are holding you back and write about the benefits of releasing them. Provide detailed examples of how letting go of these restrictions can lead to a more enjoyable, guilt-free eating experience. Use bullet points to list reasons for change and potential positive outcomes.",
            content: "Write about the rules you want to let go of here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Recognize Your Habitual Eating Patterns",
            instructions: "Observe your daily eating habits and write in detail about any automatic or routine behaviors you notice. Describe specific instances when you ate out of habit rather than true hunger and list these patterns using bullet points. Reflect on how these habits impact your overall satisfaction and consider strategies to become more mindful.",
            content: "Detail your habitual eating patterns here...",
            contentType: .textField,
            eatingStyle: .unconscious
        ),
        Strategy(
            name: "Record Your Eating Habits for One Week",
            instructions: "Keep a detailed log of everything you eat over the next week, noting the time, portion sizes, and your feelings before and after each meal. Write about any patterns or insights that emerge, using bullet points to highlight key observations. Reflect on how this record can help you understand and adjust your eating behavior.",
            content: "Enter your weekly food log here...",
            contentType: .textField,
            eatingStyle: .unconscious
        ),
        Strategy(
            name: "Reflect on How Friends Influence Your Food Rules",
            instructions: "Write about conversations and situations with your friends that have shaped the rules you follow about food. Describe specific instances when social pressure or comparisons affected your choices and list these examples using bullet points. Reflect on how you might respond differently in the future to maintain a healthier approach.",
            content: "Share your reflections on peer influence here...",
            contentType: .textField,
            eatingStyle: .anxious
        ),
        Strategy(
            name: "Identify and Celebrate Your Favorite Foods",
            instructions: "List your top favorite foods and write in detail about why you love them—including the flavors, textures, and positive memories they evoke. Use bullet points to highlight key aspects of each food and describe how celebrating your preferences can boost your confidence in food choices.",
            content: "Detail your favorite foods here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Detect Internalized Food Judgments",
            instructions: "Reflect on moments when you encountered negative, judgmental messages about your food choices. Write about specific examples of these 'food police' thoughts, list them using bullet points, and describe how these judgments affect your eating habits.",
            content: "List the negative messages you experience here...",
            contentType: .textField,
            eatingStyle: .anxious
        ),
        Strategy(
            name: "Begin Challenging Negative Food Judgments",
            instructions: "Identify one or two common negative food judgments you’ve internalized and write in detail about how you can begin to challenge them. Provide specific examples of what you might say or do to counter these thoughts, and list potential strategies using bullet points.",
            content: "Detail your strategies to challenge food judgments here...",
            contentType: .textField,
            eatingStyle: .anxious
        ),
        Strategy(
            name: "Practice Flexible Thinking About Food",
            instructions: "Reflect on times when you categorized food as either 'good' or 'bad' and write about alternative, more balanced perspectives you could adopt. Provide detailed examples and use bullet points to compare rigid versus flexible approaches. Explain how embracing flexibility can help you enjoy food without guilt.",
            content: "Write about how you can think more flexibly about food here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Overcome Perfectionism in Your Food Choices",
            instructions: "Write about specific instances when striving for perfection in your food choices led to stress or disappointment. Describe in detail how letting go of perfectionism can allow you to enjoy food more freely, and list alternative approaches using bullet points.",
            content: "Detail your experiences with perfectionism here...",
            contentType: .textField,
            eatingStyle: .professional
        ),
        Strategy(
            name: "Adopt a 'For the Most Part' Approach to Eating",
            instructions: "Reflect on how adopting a 'for the most part' mindset instead of rigid rules can improve your relationship with food. Write in detail about times when a flexible attitude led to a better eating experience, and list your observations using bullet points.",
            content: "Describe your thoughts on a flexible approach here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Analyze the Impact of Your Emotions on Eating",
            instructions: "Think of a recent meal and write about how your emotions before, during, and after eating influenced your behavior. Provide detailed examples of any patterns you noticed, and list your observations using bullet points. Explain how understanding these emotional cues can help you make more mindful food choices.",
            content: "Share your emotional impact analysis here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Assert Your Food Choices Confidently",
            instructions: "Recall a time when you needed to defend your food choices and write about how you handled the situation. Describe the context, your response, and the outcome in detail, and use bullet points to list strategies for speaking up in future situations.",
            content: "Write about asserting yourself regarding food here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Recognize and Document Your Hunger Signals",
            instructions: "Write about the physical sensations you experience when you are truly hungry. Describe in detail the signals your body sends (like a growling stomach or low energy), and list these cues using bullet points. Reflect on how noticing these signals can help you eat more mindfully.",
            content: "Document your hunger signals here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Rate Your Hunger Intensity Before Meals",
            instructions: "Before you begin eating, rate your hunger on a scale from 1 to 10 and record your observations. Write a detailed account of how these ratings correlate with your meal satisfaction, and use bullet points to list any patterns you notice.",
            content: "Enter your hunger ratings and observations here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Explore Eating Driven by Taste Alone",
            instructions: "Reflect on moments when you ate mainly because a food’s taste was irresistible rather than from true hunger. Write in detail about how this type of eating felt different, and list examples of foods that triggered taste-driven hunger using bullet points.",
            content: "Describe your taste hunger experiences here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Differentiate Between Emotional and Physical Hunger",
            instructions: "Write about times when you ate due to emotions rather than actual physical hunger. Provide detailed examples of emotions like stress, sadness, or boredom that led you to eat, and list the differences you noticed using bullet points. Explain why recognizing this distinction is key to healthier eating habits.",
            content: "Share your experiences with emotional hunger here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Share Your Unique Hunger Experiences",
            instructions: "Reflect on various instances when you noticed different types of hunger and write about the distinct feelings associated with each. Provide detailed examples and use bullet points to highlight key observations, explaining how these insights can help you manage hunger better in the future.",
            content: "Document your unique hunger experiences here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Identify When You Eat for Energy",
            instructions: "Write about instances when you ate primarily to boost your energy rather than to satisfy hunger or taste. Describe in detail the physical and emotional cues that signaled an energy-seeking need, and list specific examples using bullet points. Explain how recognizing this pattern can help you choose foods that sustain your energy throughout the day.",
            content: "Record your energy-driven eating moments here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Identify Situations That Lead to Negative Eating Experiences",
            instructions: "Reflect on specific situations where your eating environment or mindset led to unsatisfying or negative outcomes. Write in detail about factors like distractions or stress, and list strategies you can implement to avoid similar situations in the future using bullet points.",
            content: "Describe the negative setups you have experienced here...",
            contentType: .textField,
            eatingStyle: .anxious
        ),
        Strategy(
            name: "Describe the Sensation of Being Fully Satisfied",
            instructions: "Write about how you feel physically when you are comfortably full after a meal. Describe specific signals such as relaxed muscles or a sense of contentment, and list any physical cues using bullet points. Explain how recognizing these signs can help prevent overeating.",
            content: "Enter your observations of fullness here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Practice Mindfulness to Recognize Fullness",
            instructions: "Reflect on a recent meal and write about how being present helped you notice when you were full. Describe the techniques you used—such as focusing on the taste or texture of each bite—and list these strategies using bullet points. Explain how practicing mindfulness can enhance your overall eating experience.",
            content: "Detail your mindfulness practices here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Slow Down Your Eating to Notice Fullness",
            instructions: "Plan a meal where you deliberately slow down your eating pace to better notice your fullness signals. Write a detailed action plan that includes why you want to eat slowly, specific steps you will take (such as chewing more thoroughly or pausing between bites), and what you expect to observe. After the meal, record your observations and reflect on how this practice influenced your satisfaction.",
            content: "Describe your slow-eating plan and observations here...",
            contentType: .action,
            eatingStyle: .unconscious
        ),
        Strategy(
            name: "Prevent Extreme Hunger Before Meals",
            instructions: "Reflect on times when you allowed yourself to become too hungry and write about strategies to prevent extreme hunger, such as having a small, healthy snack before meals. List these strategies using bullet points and explain how managing your hunger can lead to more balanced meals.",
            content: "Enter your strategies to avoid extreme hunger here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Start Eating When You’re Moderately Hungry",
            instructions: "Write about how beginning a meal when you feel moderately hungry rather than starving can enhance your dining experience. Describe in detail what your ideal hunger level feels like and list the benefits—such as better portion control and increased flavor enjoyment—using bullet points. Explain how this approach helps prevent overeating.",
            content: "Detail your ideal hunger level and benefits here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Examine the Reasons Behind Starting a Meal",
            instructions: "Reflect on what prompts you to begin eating and analyze whether these reasons are driven by true physical hunger. Write a detailed account of the signals you notice before a meal and list any patterns or triggers using bullet points. Explain how understanding your motivations can help you make healthier food choices.",
            content: "Describe your reasons for starting a meal here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Manage Family Influences on Your Eating",
            instructions: "Write about any family rules or expectations that affect your eating behavior. Describe specific examples and list strategies to navigate or modify these influences so that you can better honor your own food choices.",
            content: "Detail the family influences and your strategies here...",
            contentType: .textField,
            eatingStyle: .anxious
        ),
        Strategy(
            name: "Explore the Various Reasons Behind Eating",
            instructions: "Write a detailed reflection on the different motivations that drive you to eat, including physical hunger, emotions, and social influences. Describe how each factor affects your choices and list examples from your experiences using bullet points. Explain how understanding these motivations can help you develop a more balanced approach.",
            content: "Document your reflections on why you eat here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Practice Self-Compassion in Your Eating Journey",
            instructions: "Reflect on what self-compassion means for you when it comes to eating and your body image. Write in detail about a time when you treated yourself kindly during a difficult eating experience, and list specific self-compassionate actions or affirmations using bullet points. Explain how practicing self-compassion can improve your relationship with food.",
            content: "Share your self-compassion reflections here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Express Gratitude for Your Food and Body",
            instructions: "Write down in detail the things you are grateful for regarding your food experiences and your body. Describe how expressing gratitude can shift your mindset and enhance your meal satisfaction, and list specific examples using bullet points.",
            content: "List your gratitude reflections here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Identify and Reflect on Your Emotions Around Eating",
            instructions: "Write about the range of emotions you experience before, during, and after meals. Describe in detail specific emotions that influence your food choices, and list examples using bullet points. Explain how recognizing these feelings can help you manage emotional eating more effectively.",
            content: "Detail your emotional experiences related to eating here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Implement Self-Care Strategies to Support Healthy Eating",
            instructions: "Write a detailed plan of self-care activities that you can integrate into your routine to support your eating habits and overall well-being. Describe specific actions—such as taking a relaxing bath, going for a walk, or practicing meditation—and list them using bullet points. Explain why these self-care practices are essential for maintaining a positive relationship with food.",
            content: "Enter your self-care plan here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Develop a Balanced Approach to Eating",
            instructions: "Reflect on what a balanced eating routine looks like for you and write a detailed plan to achieve it. Describe specific examples of balanced meals or daily routines, and list strategies that help you maintain consistency using bullet points. Explain how adopting a balanced approach can enhance both your physical and emotional well-being.",
            content: "Describe your plan for balance here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Identify Ways to Nurture Yourself Through Food",
            instructions: "Write about how you can nurture yourself through thoughtful food choices and self-care practices. Describe specific actions, such as cooking a healthy meal or enjoying a mindful snack, and list examples using bullet points. Explain why nurturing yourself is key to developing a positive and sustainable relationship with food.",
            content: "Share your nurturing strategies here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Practice Sitting with Difficult Emotions",
            instructions: "Write about a time when you allowed yourself to experience difficult emotions without distraction. Describe in detail what you felt, the techniques you used to sit with those feelings, and what you learned from the experience. List any strategies that helped you cope using bullet points.",
            content: "Document your experience sitting with emotions here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Acknowledge the Sadness in Setting Boundaries",
            instructions: "Reflect on how saying 'enough' during meals sometimes brings a sense of sadness, and write about the conflicting emotions you experience when setting boundaries. Describe in detail your feelings and list potential ways to honor both your emotions and your need to stop eating using bullet points.",
            content: "Share your reflections on boundary-setting here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Discover Your True Emotional Needs Related to Eating",
            instructions: "Write a detailed reflection on the emotions you experience throughout your eating process and try to identify what you truly need. Describe specific situations where your feelings influenced your food choices, and list any insights using bullet points.",
            content: "Detail your emotional needs here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Identify Healthy Distractions to Manage Stress",
            instructions: "List the activities or distractions that help you cope with stress without turning to food. Write in detail about how each distraction works for you, and include specific examples (e.g., taking a walk or calling a friend) using bullet points.",
            content: "Write your healthy distraction strategies here...",
            contentType: .textField,
            eatingStyle: .anxious
        ),
        Strategy(
            name: "Plan and Rehearse Strategies for Challenging Eating Situations",
            instructions: "Write a detailed action plan for handling difficult eating situations, such as feeling overwhelmed or stressed during meals. List specific strategies—like taking a break, practicing deep breathing, or stepping away from the table—using bullet points, and record your observations after implementation.",
            content: "Describe your action plan for challenging situations here...",
            contentType: .action,
            eatingStyle: .anxious
        ),
        Strategy(
            name: "Reflect on How You Perceive Your Body",
            instructions: "Write about your personal view of your body and whether you see it as a source of strength or criticism. Describe in detail how these perceptions influence your eating habits, and list any positive or negative beliefs using bullet points.",
            content: "Share your thoughts on your body perception here...",
            contentType: .textField,
            eatingStyle: .anxious
        ),
        Strategy(
            name: "Develop Strategies to Embrace and Care for Your Body",
            instructions: "Write about practical steps you can take to care for your body and embrace self-care practices. Describe specific actions (such as creating a self-care routine or scheduling relaxation) and list them using bullet points. Explain how these strategies can improve your well-being and lead to a more positive self-image.",
            content: "Outline your body care strategies here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Practice Repeated Self-Compassion for Your Body",
            instructions: "Reflect on a recent situation when you were hard on yourself about your body and write about how you could respond with kindness. Describe specific compassionate actions or affirmations, and list these strategies using bullet points. Explain why regularly practicing self-compassion is essential for a healthier body image.",
            content: "Enter your self-compassion practices here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Challenge Negative Body Image Messages",
            instructions: "Write about any negative beliefs you have about your body and describe specific instances when these messages surfaced. Detail how rejecting these thoughts can lead to a healthier self-image, and list strategies to counteract them using bullet points.",
            content: "Document your strategies to challenge negative messages here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Honor and Care for Your Body as a Sacred Space",
            instructions: "Write about how you can treat your body with the respect and care you would give to a sacred space. Describe specific actions (such as choosing nourishing foods or engaging in relaxing activities) and list them using bullet points. Explain how this approach can improve your self-image and overall well-being.",
            content: "Share your ideas for honoring your body here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Embrace Your Body’s Natural Rhythms",
            instructions: "Reflect on the natural changes and rhythms of your body and write in detail about how accepting them can reduce stress. Describe the benefits of letting go of unrealistic standards, and list specific examples of natural processes you appreciate using bullet points.",
            content: "Express your acceptance of your body's rhythms here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Celebrate Your Body’s Strengths and Abilities",
            instructions: "Write about the incredible things your body is capable of doing and list specific examples of its strengths. Describe in detail how acknowledging these abilities can boost your self-esteem, and use bullet points to highlight key strengths.",
            content: "List your body’s strengths here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Deepen Your Gratitude for Your Body and Its Functions",
            instructions: "Write a detailed list of additional things you are grateful for about your body and its functions. Describe how expressing gratitude changes your mindset and improves your eating experiences, and list specific examples using bullet points.",
            content: "Enter your extended gratitude list here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Plan to Meet Your Body’s Daily Needs",
            instructions: "Write about what your body requires each day—such as rest, movement, and proper nourishment—and describe your current routines. List any changes you can make to better support your body’s needs using bullet points, and explain how meeting these needs contributes to a balanced lifestyle.",
            content: "Outline your daily body care plan here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Practice Positive Self-Talk About Your Body",
            instructions: "Write down several positive affirmations or compliments about your body that you can repeat daily. Describe in detail how using positive self-talk makes you feel, and list any improvements in your self-esteem using bullet points.",
            content: "Enter your positive affirmations here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Choose Clothing That Makes You Feel Good",
            instructions: "List the types of clothes that make you feel comfortable and confident, and write about why these choices boost your self-image. Describe in detail how wearing your favorite outfits affects your mood, and list specific examples using bullet points.",
            content: "Share your clothing preferences here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Engage in Activities That Nurture Your Body",
            instructions: "Write about various activities that help you take care of your body, such as a warm bath, a gentle walk, or a yoga session. Describe in detail how these nurturing actions make you feel, and list specific examples using bullet points.",
            content: "List your nurturing activities here...",
            contentType: .textField,
            eatingStyle: .emotional
        ),
        Strategy(
            name: "Stop Comparing Yourself to Others",
            instructions: "Write about specific instances when you compared your eating habits or body to others, and describe how these comparisons made you feel. List alternative strategies using bullet points that help you focus on your unique strengths and personal progress, and explain why stopping comparisons is important.",
            content: "Reflect on your experiences with comparisons here...",
            contentType: .textField,
            eatingStyle: .anxious
        ),
        Strategy(
            name: "Modify Your Social Media Habits for a Positive Mindset",
            instructions: "Identify the social media habits that negatively impact your body image and write a detailed plan to change them. Describe specific steps—such as unfollowing triggering accounts or limiting screen time—and list these actions using bullet points. Explain how these changes can help create a more positive self-perception.",
            content: "Outline your social media changes here...",
            contentType: .textField,
            eatingStyle: .anxious
        ),
        Strategy(
            name: "Acknowledge That Daily Movement is Essential",
            instructions: "Reflect on the small ways you move throughout your day and write about how these movements contribute to your overall well-being. Describe the benefits of everyday activity, and list specific examples (such as walking to class, stretching, or taking stairs) using bullet points.",
            content: "Detail your daily movements here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Differentiate Between Structured Exercise and Natural Movement",
            instructions: "Write about the differences you notice between planned workouts and the natural movement you engage in during daily activities. Describe in detail how each type of activity makes you feel, and list specific examples of both structured exercise and casual movement using bullet points.",
            content: "Share your reflections on exercise and movement here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Understand the Benefits of Non-Exercise Activity (NEAT)",
            instructions: "Read about non-exercise activity thermogenesis (NEAT) and write a detailed reflection on how everyday activities contribute to your energy expenditure. Describe what NEAT means to you, and list examples of small movements—like fidgeting or short walks—using bullet points.",
            content: "Express your understanding of NEAT here...",
            contentType: .textField,
            eatingStyle: .unconscious
        ),
        Strategy(
            name: "Reflect on Your Sedentary Habits",
            instructions: "Write about how often you find yourself being inactive and describe in detail the impact this has on your energy and mood. List specific examples of times when being sedentary affected you using bullet points, and explain why increasing your activity is important for a balanced lifestyle.",
            content: "Document your sedentary habits here...",
            contentType: .textField,
            eatingStyle: .unconscious
        ),
        Strategy(
            name: "Explore Your Resistance to Exercise",
            instructions: "Write about any barriers or negative feelings you have toward exercising, and describe in detail how these feelings manifest in your behavior. List specific examples when you resisted exercise using bullet points, and reflect on potential solutions.",
            content: "Share your thoughts on exercise resistance here...",
            contentType: .textField,
            eatingStyle: .anxious
        ),
        Strategy(
            name: "Reflect on the Importance of Including Movement in Your Day",
            instructions: "Write about how adding more movement to your daily routine can positively affect your energy and mood. Describe in detail the benefits you experience when you are active, and list specific examples of simple movements using bullet points.",
            content: "Detail your reflections on movement here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Identify Signs of Overexercising",
            instructions: "Write about any signs or symptoms that suggest you might be exercising excessively, and describe in detail how overexercising affects your body and mind. List specific examples of overexercising behaviors using bullet points, and reflect on the importance of balancing activity and rest.",
            content: "Document signs of overexercising here...",
            contentType: .textField,
            eatingStyle: .professional
        ),
        Strategy(
            name: "Assess Your Readiness for Detailed Nutrition Information",
            instructions: "Reflect on your current relationship with food information and write a detailed analysis of whether you feel prepared to engage with detailed nutrition facts. Describe how nutrition influences your eating choices, and list specific examples of aspects you're curious about using bullet points.",
            content: "Share your readiness for nutrition details here...",
            contentType: .textField,
            eatingStyle: .careful
        ),
        Strategy(
            name: "Analyze How Your Meals Impact Your Mood and Energy",
            instructions: "Write about how different meals have affected your mood and energy levels, providing detailed examples of changes you noticed after eating. Describe in detail any patterns you observed, and list your thoughts using bullet points.",
            content: "Record your reflections on meal impacts here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Understand the Basics of Nutrition",
            instructions: "Read about the fundamentals of nutrition and write a detailed reflection on what nutrition means to you. Describe how a balanced mix of nutrients supports your health, and list simple nutrition principles you can apply daily using bullet points.",
            content: "Detail your understanding of nutrition here...",
            contentType: .textField,
            eatingStyle: .careful
        ),
        Strategy(
            name: "Incorporate Fun and Variety into Your Meals",
            instructions: "Reflect on what 'play food' means to you and how adding variety to your meals can enhance your enjoyment. Write in detail about instances when trying a fun or unconventional food choice brought you satisfaction, and list specific examples using bullet points.",
            content: "Share your ideas for fun food here...",
            contentType: .textField,
            eatingStyle: .intuitive
        ),
        Strategy(
            name: "Apply Commonsense Principles to Nutrition",
            instructions: "Read about commonsense nutrition and write a detailed reflection on how these principles can simplify your food choices. Describe straightforward principles that resonate with you, and list specific examples of how you can apply these ideas using bullet points.",
            content: "Detail your commonsense nutrition ideas here...",
            contentType: .textField,
            eatingStyle: .careful
        ),
        Strategy(
            name: "Create a Comprehensive Intuitive Eating Plan",
            instructions: "Review all the insights and reflections from previous exercises and write a detailed summary of how you can integrate them into your daily routine. Describe your action plan for adopting intuitive eating practices, and list key strategies or steps using bullet points. Explain how this comprehensive plan will help you enjoy a healthier, more fulfilling relationship with food.",
            content: "Summarize your intuitive eating plan here...",
            contentType: .textField,
            eatingStyle: .intuitive
        )
    ]
    
    init(eatingStyle: EatingStyle) {
        self.eatingStyle = eatingStyle
    }
    
    // Make this a method rather than a computed property for Swift Data compatibility
    func getFilteredStrategies() -> [Strategy] {
        return strategies.filter { $0.eatingStyle == eatingStyle }
    }
}
