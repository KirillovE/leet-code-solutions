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
        
        let sortedNums = nums.sorted()
        var results = [[Int]]()
        
        for leftIndex in 0..<sortedNums.endIndex - 2 {
            for middleIndex in leftIndex + 1..<sortedNums.endIndex - 1 {
                let target = -(sortedNums[leftIndex] + sortedNums[middleIndex])
                if binaryContains(target, in: sortedNums.dropFirst(middleIndex + 1)) {
                    results.append([sortedNums[leftIndex], sortedNums[middleIndex], target])
                }
            }
        }
        
        let uniques = Set(results)
        return Array(uniques)
    }
    
    func binaryContains(_ target: Int, in a: ArraySlice<Int>) -> Bool {
        let array = Array(a)
        return binarySearch(
            array: array,
            target: target,
            range: array.startIndex..<array.endIndex
        ) != nil
    }

    func binarySearch<T: Comparable>(array a: [T], target: T, range: Range<Int>) -> Int? {
        guard range.lowerBound < range.upperBound else { return nil }
        
        let midIndex = (range.lowerBound + range.upperBound) / 2
        
        if target < a[midIndex] {
            return binarySearch(array: a, target: target, range: range.lowerBound..<midIndex)
        } else if a[midIndex] < target {
            return binarySearch(array: a, target: target, range: midIndex + 1..<range.upperBound)
        } else {
            return midIndex
        }
    }
}

//: ## Tests

let solution = Solution()
Set(solution.threeSum([-1,0,1,2,-1,-4])) == Set([[-1,-1,2],[-1,0,1]])
solution.threeSum([]) == []
solution.threeSum([0]) == []
