//
//  main.swift
//  SumOfNumbers
//
//  Created by Vitalii Navrotskyi on 18.08.2022.
//

import Foundation

print("Input first value of number")
let a = readLine()
print("Input second value of number")
let b = readLine()

var result = summ(a, b)

print("Summ your numbers = \(result)")

func summ(_ a: String?, _ b: String?) -> Int {
    let result = Int(a!)! + Int(b!)!
    return result
}
