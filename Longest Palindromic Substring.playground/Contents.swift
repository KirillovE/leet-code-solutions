//: [LeetCode](https://leetcode.com/problems/longest-palindromic-substring/)
//:
//: # Longest Palindromic Substring
//:
//: Given a string **s**, find the longest palindromic substring in **s**. You may assume that the maximum length of **s** is 1000.
//:
//: ### Example 1
//:
//: Input: "babad"
//:
//: Output: "bab"
//:
//: Note: "aba" is also a valid answer.
//:
//: ### Example 2
//:
//: Input: "cbbd"
//:
//: Output: "bb"

class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard !s.isEmpty else { return "" }
        
        let sArray = Array(s)
        var start = 0, end = 0
        
        for (index, _) in s.enumerated() {
            let lengthOdd = expandAroundCenter(sArray, index, index)
            let lengthEven = expandAroundCenter(sArray, index, index + 1)
            let lengthMax = max(lengthOdd, lengthEven)
            
            if lengthMax > end - start {
                start = index - (lengthMax - 1) / 2
                end = index + lengthMax / 2
            }
        }
        
        return String(sArray[start...end])
    }
    
    private func expandAroundCenter(_ s: [Character], _ left: Int, _ right: Int) -> Int {
        var left = left, right = right
        
        while left >= 0, right < s.count, s[left] == s[right] {
            left -= 1
            right += 1
        }
        
        let palindromeLength = right - left - 1
        return palindromeLength
    }
}

//: ## Tests

let solution = Solution()
solution.longestPalindrome("babad") == "aba"
solution.longestPalindrome("cbbd") == "bb"
solution.longestPalindrome("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth")
