//: [LeetCode](https://leetcode.com/problems/add-two-numbers/)
//:
//: # Add two numbers
//:
//: You are given two **non-empty** linked lists representing two non-negative integers. The digits are stored in **reverse order** and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//:
//: You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//:
//: ### Example
//:
//: Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//:
//: Output: 7 -> 0 -> 8
//:
//: Explanation: 342 + 465 = 807


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let initialNode = ListNode(0)
        formResultList(l1, l2, currentNode: initialNode)
        return initialNode.next
    }
    
    private func formResultList(_ l1: ListNode?,
                                _ l2: ListNode?,
                                _ transit: Int = 0,
                                currentNode: ListNode?) {
        guard l1 != nil || l2 != nil || transit != 0 else { return }
        
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + transit
        let nextNode = ListNode(sum % 10)
        currentNode?.next = nextNode
        formResultList(l1?.next, l2?.next, sum / 10, currentNode: nextNode)
    }
}

//: ## Tests

let firstThird = ListNode(3)
let firstSecond = ListNode(4)
let firstFirst = ListNode(2)

firstFirst.next = firstSecond
firstSecond.next = firstThird

let secondThird = ListNode(4)
let secondSecond = ListNode(6)
let secondFirst = ListNode(5)

secondFirst.next = secondSecond
secondSecond.next = secondThird

let solution = Solution()
let resultNode = solution.addTwoNumbers(firstFirst, secondFirst)

resultNode?.val
resultNode?.next?.val
resultNode?.next?.next?.val
resultNode?.next?.next?.next?.val
resultNode?.next?.next?.next?.next?.val
