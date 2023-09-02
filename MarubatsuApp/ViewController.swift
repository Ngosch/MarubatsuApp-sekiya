//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by Ngos on 2023/09/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    // Put Question number
    var currentQuestionNum: Int = 0
    
    // 問題
    let questions: [[String: Any]] = [
        [
            "question": "iPhoneアプリを開発する統合環境はZcodeである",
            "answer": false
        ],
        [
            "question": "Xcode画面の右側にはユーティリティーズがある",
            "answer": true
        ],
        [
            "question": "UILabelは文字列を表示する際に利用する",
            "answer": true
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQestion()
        // Display question after loading
    }
    
    
    // Display question
    func showQestion(){
        let question = questions[currentQuestionNum]
        
        if let que = question["question"] as? String {
            questionLabel.text = que
        }
    }
    
    // Check answer is corrent proceed next question
    func checkAnswer(yourAnswer: Bool){
        let question = questions[currentQuestionNum]
        
        if let ans = question["answer"] as? Bool{
            if yourAnswer == ans {
                // When correct answer
                // Plus 1 to currentQuestionNum and next question
                currentQuestionNum += 1
                showAlert(message: "正解!")
            } else {
                // When incorrect
                showAlert(message: "不正解!")
            }
            
        } else { // When not answer
            print("答えが入っていません")
            return
        }
        // if currentQuestionNum more tha qty of Question, back to initial question
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }
        
        
        showQestion() //Correct -> next Question, Incorrect -> Same question.
    }
    
    // アラートを表示する関数
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tappedNoButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    
    


}

