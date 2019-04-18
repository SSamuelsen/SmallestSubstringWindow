import Foundation

//given a string and a set of characters, return the shortest substring
//containing all the characters in a set

//for example, given the string "figehaeci" and set of character {a, e, i}
//return "aeci"


//extension method to be able to discover what index position an element is at
extension Array where Element: Equatable {
    func indexes(of element: Element) -> [Int] {
        return self.enumerated().filter({ element == $0.element }).map({ $0.offset })
    }
}

let mySet:Set<Character> = ["a","e","i"]
let myString = "figehaeci"

func shortestSubstring(string:String, set:Set<Character>) -> String {
    
    //find the letter
    //record the index number
    //match the index numbers to find shortest path
    
    let letterArray = Array(string)
    var returnString:String?
    var points:[(Character,Int)] = []
    var exists = true
    
    //loop through each letter in the set
    for character in set {
        //loop through each letter in the stringArray
        var indexNum:[Int] = []
                
        //get the index number for the matching character
        indexNum = letterArray.indexes(of: character)
        
        if(indexNum.isEmpty){
            exists = false
        }
        
        for x in indexNum {
            points.append((character,x))
        }
        
    }//end for
    
    //sort the array by asceding index value
    points.sort(by: {$0.1 < $1.1})
    //print(points)
    
    //find the differences betweeen all the points
    var differenceArray:[Int] = []
    var stop = false
    for x in 0..<points.count {
        
            for y in 1..<points.count - x {
                if(stop == false) {
                    
                    if(differenceArray.count == points.count-2){
                        stop = true
                    }
                    
                differenceArray.append((points[y].1) - (points[y-1].1))
                
                }
                
            }
        
        
        
        
    }

    
    //print(differenceArray)
    
    //this will contain differences
    var differencesTuple:[(Character,Int,Int)] = []
    var x = 0
    for point in points {
        
        if(x != points.count-1){
            differencesTuple.append((point.0,point.1,differenceArray[x]))
        }
        else {
            differencesTuple.append((point.0,point.1,0))
        }
        x += 1
        
    }//end for
    
    //print(differencesTuple)
    
    var finalIndex:[Int] = []
    var final = differencesTuple
    
    for x in 0..<differencesTuple.count {
        
        for y in 1..<differencesTuple.count - x {
            
            if((differencesTuple[x].0)==(differencesTuple[y-1].0)){
                
                if((differencesTuple[x].2) < (differencesTuple[y-1].2)){
                    //print(differencesTuple[y-1])
                }
                else {
                    //print(differencesTuple[x])
                    //filter out that element
                    final = final.filter() {$0 != differencesTuple[x]}
                }
                
            }else {
                
            }
            
            
        }//end for
        
        
        
        
    }//end for
    
    //print(final)
    
    returnString = String(letterArray[final[0].1...final.last!.1])
    
    
    //determine what to print out based off of if a letter could or could not be found
    if(exists){
        print("Fantastic! :) Your smallest substring window is: \(returnString!)")
        return returnString ?? "null"
    }
    else {
        print("Sorry, the substring does not exist :(")
        return "Does not exist"
    }
    
    
}


shortestSubstring(string: myString, set: mySet)




