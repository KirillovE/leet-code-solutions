//: [LeetCode](https://leetcode.com/problems/zigzag-conversion/)
//:
//: # ZigZag Conversion
//:
//: The string `PAYPALISHIRING` is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
//:
//: ```
//: P   A   H   N
//: A P L S I I G
//: Y   I   R
//: ```
//:
//: And then read line by line: `PAHNAPLSIIGYIR`
//: Write the code that will take a string and make this conversion given a number of rows
//:
//: ```
//: Input: s = "PAYPALISHIRING", numRows = 3
//: Output: "PAHNAPLSIIGYIR"
//: ```
//:
//: ```
//: Input: s = "PAYPALISHIRING", numRows = 4
//: Output: "PINALSIGYAHRPI"
//: Explanation:
//: P     I    N
//: A   L S  I G
//: Y A   H R
//: P     I
//: ```

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard 1 < numRows else { return s }
        
        var rows = Array(repeating: "", count: numRows)
        var orderAscending = true
        var rowIndex = 0
        
        for char in s {
            rows[rowIndex].append(char)
            
            if orderAscending {
                if rowIndex < rows.count - 1 {
                    rowIndex += 1
                } else {
                    rowIndex -= 1
                    orderAscending.toggle()
                }
            } else {
                if 0 < rowIndex {
                    rowIndex -= 1
                } else {
                    rowIndex += 1
                    orderAscending.toggle()
                }
            }
        }
        
        return rows.joined()
    }
}

//: ## Tests

let solution = Solution()
solution.convert("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR"
solution.convert("PAYPALISHIRING", 4) == "PINALSIGYAHRPI"
solution.convert("AB", 1) == "AB"
