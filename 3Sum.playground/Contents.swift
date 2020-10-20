//: [LeetCode](https://leetcode.com/problems/3sum/)
//:
//: # 3Sum
//:
//: Given an array `nums` of *n* integers, are there elements *a*, *b*, *c* in `nums` such that *a + b + c = 0*? Find all unique triplets in the array which gives the sum of zero.
//:
//: Notice that the solution set must not contain duplicate triplets.
//:
//: ### Example
//:
//: Input: nums = [-1,0,1,2,-1,-4]
//:
//: Output: [[-1,-1,2],[-1,0,1]]
//:
//: ### Example
//:
//: Input: nums = []
//:
//: Output: []
//:
//: ### Example
//:
//: Input: nums = [0]
//:
//: Output: []
//:
//: ### Constraints:
//: * 0 <= nums.length <= 3000
//: * -10^5 <= nums[i] <= 10^5
//:


class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }
        
        var result = [[Int]]()
        
        for baseIndex in nums.startIndex ..< nums.index(nums.endIndex, offsetBy: -2) {
            let searchRange = nums.index(after: baseIndex) ..< nums.endIndex
            let twoSumResult = twoSum(nums[searchRange], target: -nums[baseIndex])
            let threeSums = twoSumResult.map { twoSumPair in
                ([nums[baseIndex]] + twoSumPair).sorted()
            }
            result.append(contentsOf: threeSums)
        }
        
        let uniques = Set(result)
        return Array(uniques)
    }
    
    func twoSum(_ nums: ArraySlice<Int>, target: Int) -> [[Int]] {
        guard nums.count >= 2 else { return [] }
        
        var result = [[Int]]()
        var numsDict = [Int: Int]()
        
        for pointerIndex in nums.startIndex ..< nums.endIndex {
            if let complementIndex = numsDict[target - nums[pointerIndex]] {
                result.append([nums[pointerIndex], nums[complementIndex]])
            } else {
                numsDict[nums[pointerIndex]] = pointerIndex
            }
        }
        
        return result
    }
}

//: ## Tests

let solution = Solution()
Set(solution.threeSum([-1,0,1,2,-1,-4])) == Set([[-1,-1,2],[-1,0,1]])
solution.threeSum([]) == []
solution.threeSum([0]) == []
