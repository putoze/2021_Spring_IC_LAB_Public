import random
import math
 
class Sudoku:
    def __init__(self, N, K):
        self.N = N
        self.K = K
 
        # Compute square root of N
        SRNd = math.sqrt(N)
        self.SRN = int(SRNd)
        self.mat = [[0 for _ in range(N)] for _ in range(N)]
     
    def fillValues(self):
        # Fill the diagonal of SRN x SRN matrices
        self.fillDiagonal()
 
        # Fill remaining blocks
        self.fillRemaining(0, self.SRN)
 
        # Remove Randomly K digits to make game
        self.removeKDigits()
     
    def fillDiagonal(self):
        for i in range(0, self.N, self.SRN):
            self.fillBox(i, i)
     
    def unUsedInBox(self, rowStart, colStart, num):
        for i in range(self.SRN):
            for j in range(self.SRN):
                if self.mat[rowStart + i][colStart + j] == num:
                    return False
        return True
     
    def fillBox(self, row, col):
        num = 0
        for i in range(self.SRN):
            for j in range(self.SRN):
                while True:
                    num = self.randomGenerator(self.N)
                    if self.unUsedInBox(row, col, num):
                        break
                self.mat[row + i][col + j] = num
     
    def randomGenerator(self, num):
        return math.floor(random.random() * num + 1)
     
    def checkIfSafe(self, i, j, num):
        return (self.unUsedInRow(i, num) and self.unUsedInCol(j, num) and self.unUsedInBox(i - i % self.SRN, j - j % self.SRN, num))
     
    def unUsedInRow(self, i, num):
        for j in range(self.N):
            if self.mat[i][j] == num:
                return False
        return True
     
    def unUsedInCol(self, j, num):
        for i in range(self.N):
            if self.mat[i][j] == num:
                return False
        return True
     
    
    def fillRemaining(self, i, j):
        # Check if we have reached the end of the matrix
        if i == self.N - 1 and j == self.N:
            return True
     
        # Move to the next row if we have reached the end of the current row
        if j == self.N:
            i += 1
            j = 0
     
        # Skip cells that are already filled
        if self.mat[i][j] != 0:
            return self.fillRemaining(i, j + 1)
     
        # Try filling the current cell with a valid value
        for num in range(1, self.N + 1):
            if self.checkIfSafe(i, j, num):
                self.mat[i][j] = num
                if self.fillRemaining(i, j + 1):
                    return True
                self.mat[i][j] = 0
         
        # No valid value was found, so backtrack
        return False
 
    def removeKDigits(self):
        count = self.K
 
        while (count != 0):
            i = self.randomGenerator(self.N) - 1
            j = self.randomGenerator(self.N) - 1
            if (self.mat[i][j] != 0):
                count -= 1
                self.mat[i][j] = 0
     
        return
 
    def printSudoku(self):
        for i in range(self.N):
            for j in range(self.N):
                print(self.mat[i][j], end=" ")
            print()
    
    def create_errorSudoku(self):
        row1 = self.randomGenerator(self.N) - 1
        col1 = self.randomGenerator(self.N) - 1
        row2 = self.randomGenerator(self.N) - 1
        col2 = self.randomGenerator(self.N) - 1
        temp = self.mat[row1][col1]
        self.mat[row1][col1] = self.mat[row2][col2]
        self.mat[row2][col2] = temp
                

    def fwrite_board(self,fout) :
        for i in range(self.N):
            for j in range(self.N):
                fout.write(str(self.mat[i][j]))
                fout.write(" ")
            fout.write("\n")
        fout.write("\n")


    def fwrite_ans(self,solution_list,fout) :
        for val in solution_list:
            fout.write(str(val))
            fout.write(" ")
        fout.write("\n\n")

    def solve(self):
        empty_list = []
        empty_list_index = 0
        solution_list = [0 for i in range(15)]
        for i in range(self.N):
            for j in range(self.N):
                if (self.mat[i][j] == 0):
                    empty_list.append((i,j))
        
        while True:
            # print(empty_list)
            # print(empty_list_index)
            row, col = empty_list[empty_list_index]
            # print(row,col)
            start_num = self.mat[row][col]
            self.mat[row][col] = 0

            success_flag = 0
            for num in range(start_num+1, self.N + 1):
                if self.checkIfSafe(row, col, num):
                    self.mat[row][col] = num
                    success_flag = 1
                    solution_list[empty_list_index] = num
                    break

            # print('\n')
            # self.printSudoku()
            # print('\n')
            if success_flag == 0:
                empty_list_index -= 1
            else :
                empty_list_index += 1

            if empty_list_index == -1:
                return [10]
            
            elif empty_list_index == 15:
                return solution_list

    def is_board_legal(self) :
        # check each number
        for n in range(1, self.N+1) :
            # check each row
            for i in range(self.N) :
                cnt = 0 
                for j in range(self.N) :
                    if self.mat[i][j] == n :
                        cnt = cnt + 1
                if cnt > 1 :
                    print(i,j)
                    return False
            # check each column
            for j in range(self.N) :
                cnt = 0 
                for i in range(self.N) :
                    if self.mat[i][j]==n :
                        cnt = cnt + 1
                if cnt > 1 :
                    return False
            # check each box
            for i in [0, 3, 6] :
                for j in [0, 3, 6] :
                    cnt = 0
                    for i_ in range(3) :
                        for j_ in range(3) :
                            if self.mat[i+i_][j+j_] == n :
                                cnt = cnt + 1 
                    if cnt > 1 :
                        return False
        return True


# Driver code
if __name__ == "__main__":
    N = 9
    K = 15
    PATNUM = 10000
    # f = open("./pat_10000.txt", "w")
    # f.write(str(PATNUM))
    # f.write("\n\n")
    # for i in range(PATNUM):
    #     sudoku = Sudoku(N, K)
    #     sudoku.fillValues()
    #     if i % 10 == 0:
    #         sudoku.create_errorSudoku()
    #     sudoku.printSudoku()
    #     sudoku.fwrite_board(f)
    #     legal_flag = sudoku.is_board_legal()
    #     if legal_flag:
    #         solution_list = sudoku.solve()
    #         print(solution_list)
    #         sudoku.fwrite_ans(solution_list,f)
    #     else:
    #         sudoku.fwrite_ans([10],f)
    #     print('\n')

    # corner case 1
    sudoku = Sudoku(N, K)
    sudoku.mat = [[2 ,4 ,3 ,1 ,4 ,6 ,5 ,7 ,8 ], 
                  [4 ,1 ,7 ,2 ,0 ,8 ,3 ,6 ,0 ], 
                  [6 ,5 ,8 ,3 ,7 ,0 ,1 ,0 ,4 ], 
                  [1 ,3 ,9 ,8 ,0 ,5 ,6 ,0 ,7 ], 
                  [5 ,2 ,6 ,0 ,1 ,4 ,8 ,9 ,3 ], 
                  [7 ,8 ,0 ,0 ,9 ,3 ,2 ,0 ,5 ], 
                  [8 ,4 ,1 ,0 ,3 ,2 ,0 ,0 ,0 ], 
                  [9 ,6 ,2 ,5 ,8 ,7 ,4 ,3 ,1 ], 
                  [3 ,7 ,5 ,4 ,6 ,1 ,9 ,0 ,2 ] ]
    
    sudoku.printSudoku()
    legal_flag = sudoku.is_board_legal()
    if legal_flag:
        solution_list = sudoku.solve()
        print(solution_list)
    else:
        print('fail')