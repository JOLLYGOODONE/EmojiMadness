//
//  ContentView.swift
//  Emoji Madness
//
//  Created by BRIAN VALENTINE on 4/17/25.
//

import SwiftUI
import Combine
import AVFoundation


struct ContentView: View {
    let faceEmojis = ["😀", "😅", "😂", "🤣", "😊", "😍", "😎", "🤪", "😇", "🥸", "🤓", "😈", "🥳", "😱", "😡", "😵‍💫"]

    var body: some View {
        NavigationView {
            ZStack {
                // Background face emojis
                GeometryReader { geometry in
                    ZStack {
                        ForEach(0..<250, id: \.self) { _ in
                            let emoji = faceEmojis.randomElement()!
                            let x = CGFloat.random(in: 0..<geometry.size.width)
                            let y = CGFloat.random(in: 0..<geometry.size.height)

                            Text(emoji)
                                .font(.system(size: CGFloat.random(in: 30...60)))
                                .position(x: x, y: y)
                                .opacity(0.1)
                                .rotationEffect(.degrees(Double.random(in: -20...20)))
                        }
                    }
                }
                .ignoresSafeArea()

                // Foreground scrollable level buttons
                ScrollView {
                    VStack(spacing: 16) {
                        Text("Emoji Madness")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                            .padding(.top, 20)
                            .padding(.bottom, 20)

                        ForEach(Level.allCases) { level in
                            NavigationLink(destination: RebusGridView(level: level)) {
                                HStack(spacing: 16) {
                                    Text(level.emoji)
                                        .font(.largeTitle)

                                    Text(level.rawValue.capitalized)
                                        .foregroundColor(.orange)
                                        .font(.title2)
                                        .fontWeight(.medium)

                                    Spacer()

                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background( .ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct RebusGridView: View {
    let level: Level
    @State private var completedRebus: [Int: (correctAnswer: String, isCorrect: Bool)] = [:]
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color(red: 254 / 255, green: 58 / 255, blue: 196 / 255),
                Color(red: 113 / 255, green: 30 / 255, blue: 223 / 255)
            ],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack {
                Spacer() // Add this spacer to push the content up
                
                Text("\(level.rawValue)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 16) {
                    ForEach(0..<min(level.emojiGrid.count, EmojiData.rebus[level]?.count ?? 0), id: \.self) { index in
                        NavigationLink(destination: RebusView(level: level, index: index, rebus: EmojiData.rebus[level]![index])) {
                            ZStack {
                                Text(level.emojiGrid[index])
                                    .font(.system(size: 50))
                                Text("\(index + 1)")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(4)
                                    .background(
                                        completedRebus[index] != nil
                                        ? (completedRebus[index]!.isCorrect ? Color.green : Color.red)
                                        : Color.black.opacity(0.6)
                                    )
                                    .clipShape(Circle())
                                    .offset(x: 15, y: -15)
                            }
                        }
                    }
                }
                .padding()
                
                Spacer() // Optional: You can add another spacer if you want more balance
                Spacer()
                Spacer()
                Spacer()
            }
        }
        .onAppear {
            let progressDict = ProgressManager.shared.getProgress(for: level) ?? [:]
            for (index, rebus) in (EmojiData.rebus[level] ?? []).enumerated() {
                if let saved = progressDict[index],
                   saved.answer == rebus.answer {
                    completedRebus[index] = (correctAnswer: saved.answer, isCorrect: saved.wasSuccessful)
                }
            }
        }
    }
}

struct RebusView: View {
    let level: Level
    let index: Int
    let rebus: EmojiRebus
    @State private var selectedAnswer: String?
    @State private var isCorrect: Bool?
    @State private var timeRemaining = 300 // Time in 10ths of a second (30 seconds = 300)
    @State private var timerSubscription: AnyCancellable? = nil // Store the timer subscription
    @State private var showCorrectAnswer = false
    @State private var correctAnswerFlashCount = 0
    @State private var displayText: String
    @State private var textScale: CGFloat = 1.0
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var timeSpent: Double = 0.0
    @State private var showPenalty = false
    @State private var penaltyOpacity = 1.0
    
    init(level: Level, index: Int, rebus: EmojiRebus) {
        self.level = level
        self.index = index
        self.rebus = rebus
        _displayText = State(initialValue: rebus.question)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color(red: 254 / 255, green: 58 / 255, blue: 196 / 255),
                Color(red: 113 / 255, green: 30 / 255, blue: 223 / 255)
            ],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack(spacing: 10) {
                GeometryReader { geometry in
                    Text(displayText)
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .allowsTightening(true)
                        .minimumScaleFactor(0.5) // Shrinks only if needed
                        .frame(width: geometry.size.width)
                        .scaleEffect(x: textScale, y: 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: textScale)
                }
                .frame(height: 70)
                Spacer()
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(rebus.possibleAnswers.prefix(10), id: \.self) { option in
                        Button(action: {
                            guard timeRemaining > 0, isCorrect == nil else { return }

                            selectedAnswer = option
                            isCorrect = option == rebus.answer

                            if isCorrect == true {
                                timerSubscription?.cancel()
                                animateAnswerReveal()
                                let spent = Double(300 - timeRemaining) / 10.0
                                ProgressManager.shared.update(level: level, index: index, success: true, answer: rebus.answer, timeSpent: spent)
                            } else {
                                // Deduct 10 seconds (100 tenths)
                                if timeRemaining <= 100 {
                                    timeRemaining = 0
                                    timerSubscription?.cancel()
                                    isCorrect = false
                                    flashCorrectAnswer()
                                    animateAnswerReveal()
                                    let spent = Double(300 - timeRemaining) / 10.0
                                    ProgressManager.shared.update(level: level, index: index, success: false, answer: rebus.answer, timeSpent: spent)
                                } else {
                                    timeRemaining -= 100
                                    withAnimation(.easeOut(duration: 0.5)) {
                                        showPenalty = true
                                        penaltyOpacity = 1.0
                                    }

                                    // Fade out the penalty display
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        withAnimation(.easeIn(duration: 0.5)) {
                                            penaltyOpacity = 0.0
                                        }
                                    }
                                }
                            }
                        }) {
                            Text(option)
                                .font(.system(size: 40))
                                .padding()
                                .background(buttonColor(for: option))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .disabled(timeRemaining <= 0 || isCorrect != nil)
                    }
                }
                .frame(height: 500)
                
                if showPenalty {
                    Text("-10 Seconds")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .opacity(penaltyOpacity)
                        .transition(.opacity)
                }
                
                Text("\(timeRemaining / 10).\(timeRemaining % 10)") // Format as seconds and tenths
                    .font(.system(size: 50))  // Enlarge the timer significantly
                    .foregroundColor(getTimeColor()) // Get the color based on time
                    .padding()
                    .onAppear {
                        if let saved = ProgressManager.shared.getProgress(for: level, index: index),
                           saved.answer == rebus.answer {
                            selectedAnswer = saved.answer
                            isCorrect = saved.wasSuccessful
                            timeSpent = saved.timeSpent
                            displayText = rebus.actualAnswer
                            if saved.wasSuccessful {
                                timeRemaining = Int((300.0 - saved.timeSpent * 10.0).rounded())
                            } else {
                                timeRemaining = 0
                            }
                        } else {
                            startTimer()
                        }
                    }
                    .padding()
            }
        }
    }
    
    func getTimeColor() -> Color {
        if timeRemaining > 100 { // First 20 seconds (200 tenths)
            return .green
        } else if timeRemaining > 50 { // 10 to 5 seconds (50 to 10 tenths)
            return .yellow
        } else { // Below 5 seconds (below 50 tenths)
            return .red
        }
    }
    
    func startTimer() {
        timerSubscription?.cancel()  // Invalidate any existing timer subscriptions
        timeRemaining = 300          // Reset to 30 seconds (300 tenths of a second)
        
        // Create a new timer subscription
        timerSubscription = Timer.publish(every: 0.1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    timerSubscription?.cancel()
                    isCorrect = false
                    flashCorrectAnswer()
                    animateAnswerReveal()
                    let spent = Double(300 - timeRemaining) / 10.0
                    ProgressManager.shared.update(level: level, index: index, success: false, answer: rebus.answer, timeSpent: spent)
                }
            }
    }
    
    func saveTimeSpent() {
            timeSpent = Double(300 - timeRemaining) / 10.0 // Time spent in seconds
        }
    
    func flashCorrectAnswer() {
        correctAnswerFlashCount = 0
        showCorrectAnswer = true
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            correctAnswerFlashCount += 1
            showCorrectAnswer.toggle()
            
            if correctAnswerFlashCount >= 4 { // 2 full flashes (on/off = 2)
                showCorrectAnswer = true // keep it green
                timer.invalidate()
            }
        }
    }
    
    func buttonColor(for option: String) -> Color {
        if selectedAnswer == option {
            return isCorrect == true ? .green : .red
        }
        
        if timeRemaining <= 0 && option == rebus.answer {
            return showCorrectAnswer ? .green : .clear
        }
        
        return Color.blue.opacity(0.2)
    }
    
    func animateAnswerReveal() {
        // Step 1: squeeze in
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
            textScale = 0.01
        }
        
        // Step 2: switch to phoneticAnswer, expand, and speak slowly
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            displayText = rebus.phoneticAnswer
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                textScale = 1.0
            }
            // Speak phonetic answer slowly
            speak(text: rebus.phoneticAnswer, rate: 0.3) // Slow speed
            
            // Step 3: squeeze again to swap to actualAnswer
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    textScale = 0.01
                }
                
                // Step 4: expand final answer and speak normally
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    displayText = rebus.actualAnswer
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        textScale = 1.0
                    }
                    // Speak actual answer at normal speed
                    speak(text: rebus.actualAnswer, rate: 0.5) // Normal speed
                }
            }
        }
    }
    
    func speak(text: String, rate: Float) {
        let cleanedText = text.replacingOccurrences(of: "+", with: "")
            .replacingOccurrences(of: "plus", with: "")
            .replacingOccurrences(of: "-", with: "minus")
            .replacingOccurrences(of: "Baa", with: "bah")
            .replacingOccurrences(of: "Brrr", with: "burr")
            .replacingOccurrences(of: "Sake", with: "sawkey")
            .replacingOccurrences(of: "Brrr", with: "burr")
            .replacingOccurrences(of: "A", with: "uh")
            .replacingOccurrences(of: "Gyro", with: "euro")
        let utterance = AVSpeechUtterance(string: cleanedText)
        utterance.rate = rate
        if let maleVoice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Daniel-compact") {
            utterance.voice = maleVoice
        }
        speechSynthesizer.speak(utterance)
    }
    
    func stopSpeech() {
        speechSynthesizer.stopSpeaking(at: .immediate)
    }
}
        
        @main
        struct EmojiMadnessApp: App {
            var body: some Scene {
                WindowGroup {
                    ContentView()
                }
            }
        }
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }

