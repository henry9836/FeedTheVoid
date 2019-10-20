//
//  main.swift
//  FeedTheVoid
//
//  Created by Henry Oliver on 15/07/19.
//  Copyright © 2019 Henry Oliver. All rights reserved.
//
import Foundation
import Cocoa

var AmountFeed : Float = 0.0
var SleepTime: Int = 1
func shell(_ command: String) -> String {
    let task = Process()
    task.launchPath = "/bin/bash"
    task.arguments = ["-c", command]
    
    
    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output: String = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
    
    return output
}


func FeedTheVoid(Amount: Int){
    var result : String = ""
    result = shell("head -n \(Amount) /dev/urandom > chunk;du -sh chunk") //Make Food
    //print(result)
    result = result.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil)
    var strArray = result.components(separatedBy: "K")
    //print(strArray[0])
    let chunkSize : Float = Float(strArray[0])!
    shell("cat chunk > /dev/null") //Feed The Void
    AmountFeed += chunkSize
    print("Feed: \(AmountFeed) KB of Data to The Void")
}

func Banner(){
    print("                 ░░          ")
    print("         ░░░░░▒    ░░        ")
    print("       ░░    ▒▓▒     ░       ")
    print("      ░    ▒▒▒▓▒▒▒   ░ ░     ")
    print("     ░  ▒▒▒▒▒▓▓▓▒▒▒▒▒░ ░     ")
    print("       ░   ▒▒▒▓▒▒▒    ░      ")
    print("       ░  ░  ▒▓▒    ░░       ")
    print("        ░     ▒░░░░░         ")
    print("         ░░░                 ")
    print("\nVoid Feeder\n By Henry Oliver \n\n\nPress Enter To Begin")
    let delay = readLine()
}

//main

Banner();
while (true){
    FeedTheVoid(Amount: Int.random(in: 10...2000)); //10-2000 lines
    //shell("sleep \(SleepTime)")
    //SleepTime = Int.random(in: 0...2)
    let delay = readLine()
}




