//
//  Rotate.swift
//  TddLeetCode
//
//  Created by houguanhua on 2022/10/20.
//

import Foundation

class Solution48 {
    func rotate(_ matrix: inout [[Int]]) {
        let count = matrix.count
        guard count > 1 else {
            return
        }
        
        for offset in 0 ..< count/2 {
            let n = count - 2 * offset
            guard n > 1 else {
                return
            }
            
            let maxOffset = offset + n - 1
            
            for j in 0 ..< n - 1 {
                let x = matrix[ offset ][ offset + j ]
                matrix[ offset ][ offset + j ] = matrix[ maxOffset - j ][ offset ]
                matrix[ maxOffset - j ][ offset ] = matrix[ maxOffset ][ maxOffset - j ]
                matrix[ maxOffset ][ maxOffset - j ] = matrix[ offset + j ][ maxOffset ]
                matrix[offset + j][maxOffset] = x
            }
        }
        
    }
}
