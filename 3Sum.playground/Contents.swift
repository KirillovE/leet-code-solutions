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
        
        let sorted = nums.sorted()
        var result = [[Int]]()
        
        var leftIndex = sorted.startIndex
        while leftIndex < sorted.endIndex {
            var middleIndex = sorted.index(after: leftIndex)
            var rightIndex = sorted.index(before: sorted.endIndex)
            
            while middleIndex < rightIndex {
                let sum = sorted[leftIndex] + sorted[middleIndex] + sorted[rightIndex]
                if sum == 0 {
                    result.append([sorted[leftIndex], sorted[middleIndex], sorted[rightIndex]])
                    sorted.formUniqueIndex(after: &middleIndex)
                    sorted.formUniqueIndex(before: &rightIndex)
                } else if sum < 0 {
                    sorted.formUniqueIndex(after: &middleIndex)
                } else if sum > 0 {
                    sorted.formUniqueIndex(before: &rightIndex)
                }
            }
            sorted.formUniqueIndex(after: &leftIndex)
        }
        
        return result
    }
}

extension Collection where Element: Equatable {
    func formUniqueIndex(after index: inout Index) {
        var previous = index
        repeat {
            previous = index
            formIndex(after: &index)
        } while index < endIndex && self[previous] == self[index]
    }
}

extension BidirectionalCollection where Element: Equatable {
    func formUniqueIndex(before index: inout Index) {
        var previous = index
        repeat {
            previous = index
            formIndex(before: &index)
        } while index > startIndex && self[previous] == self[index]
    }
}

//: ## Tests

let solution = Solution()
Set(solution.threeSum([-1,0,1,2,-1,-4])) == Set([[-1,-1,2],[-1,0,1]])
solution.threeSum([]) == []
solution.threeSum([0]) == []
