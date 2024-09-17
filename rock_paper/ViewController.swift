//
//  ViewController.swift
//  rock_paper
//
//  Created by Amitesh Gupta on 04/08/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var computerImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var winnerName: UILabel!
    @IBOutlet weak var computerChoice: UILabel!
    @IBOutlet weak var yourChoice: UILabel!
    @IBOutlet weak var computerPoint: UILabel!
    @IBOutlet weak var yourPoints: UILabel!
    
    
    // Choices for the game
        let choices = ["Rock", "Paper", "Scissors"]
        
        // Dictionary to map choices to images
        let images: [String: UIImage?] = [
            "Rock": UIImage(named: "rock"),
            "Paper": UIImage(named: "paper"),
            "Scissors": UIImage(named: "scissor")
        ]
        
        // Points for user and computer
        var userPoints = 0
        var computerPoints = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        // Round the corners of buttons and images
        [rockButton, paperButton, scissorsButton, userImage, computerImage].forEach { view in
            view?.layer.cornerRadius = 10
            view?.clipsToBounds = true
        }

        // Add shadow to buttons
        [rockButton, paperButton, scissorsButton].forEach { button in
            button?.layer.shadowColor = UIColor.black.cgColor
            button?.layer.shadowOffset = CGSize(width: 0, height: 2)
            button?.layer.shadowRadius = 4
            button?.layer.shadowOpacity = 0.2
        }
    }
    
    @IBAction func choiceButton(_ sender: UIButton) {
        if let buttonTitle = sender.currentTitle{
                
            }
        // Get the title of the pressed button
                      if let userChoice = sender.currentTitle {
                          print(userChoice) // Print the user's choice

                          // Update user's choice image
                          userImage.image = images[userChoice] ?? nil
                          yourChoice.text = userChoice
                          
                          // Randomly select computer's choice
                          let computerChoiceStr = choices.randomElement()!
                          computerImage.image = images[computerChoiceStr] ?? nil
                          computerChoice.text = computerChoiceStr
                          
                          // Determine the winner
                          let winner = determineWinner(userChoice: userChoice, computerChoice: computerChoiceStr)
                          updatePoints(winner: winner)
                          winnerName.text = winner
                          
                          // Animate the user and computer choice images
                          UIView.transition(with: userImage, duration: 0.3, options: .transitionFlipFromLeft, animations: {
                              self.userImage.image = self.images[userChoice] ?? nil
                          }, completion: nil)

                          UIView.transition(with: computerImage, duration: 0.3, options: .transitionFlipFromRight, animations: {
                              self.computerImage.image = self.images[computerChoiceStr] ?? nil
                          }, completion: nil)

                          // Animate the winner label
                          UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [], animations: {
                              self.winnerName.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                          }) { _ in
                              UIView.animate(withDuration: 0.3) {
                                  self.winnerName.transform = .identity
                              }
                          }
                      }
                  }
                  
                  // Function to determine the winner
                  func determineWinner(userChoice: String, computerChoice: String) -> String {
                      if userChoice == computerChoice {
                          return "It's a tie!"
                      }
                      switch userChoice {
                      case "Rock":
                          return computerChoice == "Scissors" ? "You win!" : "Computer wins!"
                      case "Paper":
                          return computerChoice == "Rock" ? "You win!" : "Computer wins!"
                      case "Scissors":
                          return computerChoice == "Paper" ? "You win!" : "Computer wins!"
                      default:
                          return "It's a tie!"
                      }
                  }
                  
                  // Function to update points
                  func updatePoints(winner: String) {
                      if winner == "You win!" {
                          userPoints += 1
                      } else if winner == "Computer wins!" {
                          computerPoints += 1
                      }
                      yourPoints.text = "Your Points: \(userPoints)"
                      computerPoint.text = "Computer Points: \(computerPoints)"
                      
                      // Animate the points labels
                      UIView.animate(withDuration: 0.3, animations: {
                          self.yourPoints.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                          self.computerPoint.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                      }) { _ in
                          UIView.animate(withDuration: 0.2) {
                              self.yourPoints.transform = .identity
                              self.computerPoint.transform = .identity
                          }
                      }
                  }
              }
