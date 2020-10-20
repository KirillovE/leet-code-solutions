//: [LeetCode](https://leetcode.com/problems/longest-substring-without-repeating-characters/)
//:
//: # Longest Substring Without Repeating Characters
//:
//: Given a string, find the length of the **longest substring** without repeating characters.
//:
//: ### Example 1
//:
//: Input: "abcabcbb"
//:
//: Output: 3
//:
//: Explanation: The answer is "abc", with the length of 3.
//:
//: ### Example 2
//:
//: Input: "bbbbb"
//:
//: Output: 1
//:
//: Explanation: The answer is "b", with the length of 1.
//:
//: ### Example 3
//:
//: Input: "pwwkew"
//:
//: Output: 3
//:
//: Explanation: The answer is "wke", with the length of 3.
//: Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

class Solution {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let sArray = Array(s)
        var currentArray = ArraySlice<Character>()
        var maxLength = 0
        
        for char in sArray {
            if currentArray.contains(char) {
                maxLength = max(maxLength, currentArray.count)
                let charIndex = currentArray.firstIndex(of: char)!
                currentArray = currentArray[(charIndex + 1)...]
                currentArray.append(char)
            } else {
                currentArray.append(char)
            }
        }
        
        return max(maxLength, currentArray.count)
    }
    
}

//: ## Tests

let solution = Solution()
solution.lengthOfLongestSubstring("abcabcbb") == 3
solution.lengthOfLongestSubstring("bbbbb") == 1
solution.lengthOfLongestSubstring("pwwkew") == 3
