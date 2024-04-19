import Foundation
import SwiftUI

struct QcmView: View {
    let questions: [MyQuestion]  // Recevoir les questions ici
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswerIndex: Int?
    @State private var showResult = false
    @State private var correctAnswersCount = 0



    var body: some View {
        VStack {
            if currentQuestionIndex < questions.count {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Question \(currentQuestionIndex + 1)/\(questions.count)")
                        .font(.headline)
                    Text(questions[currentQuestionIndex].statement)
                        .font(.title2)
                        .fontWeight(.bold)

                    ForEach(0..<questions[currentQuestionIndex].proposal.count, id: \.self) { index in
                        AnswerButton(text: questions[currentQuestionIndex].proposal[index], isSelected: .constant(selectedAnswerIndex == index)) {
                            self.selectedAnswerIndex = index
                        }
                    }

                    HStack {
                        if currentQuestionIndex < questions.count - 1 {
                            Button("Suivant") {
                                // Compare la réponse sélectionnée avec la réponse correcte
                                let currentQuestion = questions[currentQuestionIndex]
                                if let selectedAnswerIndex = selectedAnswerIndex, currentQuestion.answer.rawValue == selectedAnswerIndex + 1 {
                                    correctAnswersCount += 1
                                }
                                currentQuestionIndex += 1
                                selectedAnswerIndex = nil  // Réinitialise la sélection
                            }
                        }
                        else {
                            Button("End") {
                                let currentQuestion = questions[currentQuestionIndex]
                                    if let selectedAnswerIndex = selectedAnswerIndex, currentQuestion.answer.rawValue == selectedAnswerIndex + 1 {
                                        correctAnswersCount += 1
                                    }
                                    showResult = true
                            }
                        }
                        
                    }
                }
                .padding()
            }
            if showResult {
                VStack {
                    Text("Résultat du QCM")
                        .font(.title)
                        .padding(.bottom, 20)
                    
                    Text("Nombre total de questions: \(questions.count)")
                    Text("Nombre de réponses correctes: \(correctAnswersCount)")
                }
                .padding()
            }
        }
        .navigationBarTitle("QCM", displayMode: .inline)
        .padding()
    }
}

// Button view for answers
struct AnswerButton: View {
    var text: String
    @Binding var isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: {
            self.action()
            self.isSelected.toggle()
        }) {
            Text(text)
                .foregroundColor(isSelected ? .white : .black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(isSelected ? Color.blue : Color.gray)
                .cornerRadius(10)
        }
    }
}
