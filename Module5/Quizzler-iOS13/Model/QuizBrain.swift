//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Monika Singh on 01/05/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    // First it has list of questions = Done
    // Fucntion to check if the answer is correct = Done
    // Fucntion to return the next question = Done
    // brahviour to check the current question
    // Behaviour o=to reset the quiz
    
     var currentQuestionNumber = 0
     var score = 0
     var isLastQuestion = false
    
     let questionList = [
          Quiz(q: "A slug's blood is green.", a: "True"),
          Quiz(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
          Quiz(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
          Quiz(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
          Quiz(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
          Quiz(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
          Quiz(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
          Quiz(q: "Google was originally called 'Backrub'.", a: "True"),
          Quiz(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
          Quiz(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
          Quiz(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
          Quiz(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    mutating func checkAnswer(answerSubmitted : String)->Bool{
        incrementCurrentQuestion()
        if(answerSubmitted == questionList[currentQuestionNumber].a){
            addPoints()
            return true
        }else{
            return false
        }
    }
    
    mutating func addPoints(){
            score += 1
    }
    
    mutating func incrementCurrentQuestion()  {
        if(currentQuestionNumber+1 < questionList.count){
            currentQuestionNumber += 1
        }else{
            isLastQuestion = true
        }
    }
    
    mutating func getCurrentQuiz() -> Quiz{
        return questionList[currentQuestionNumber]
    }
    
    func getScore() -> Int  {
        return score
    }
    
    func isLast() -> Bool {
        return isLastQuestion
    }
    
    mutating func resetQuiz(){
        currentQuestionNumber = 0
        score = 0
        isLastQuestion = false
    }
}

