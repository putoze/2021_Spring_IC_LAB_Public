# Lab3

```
Performance = Area * (Execution Cycles + Number of Patterns) * Cycle Time
Number of Patterns = 2011
```

- My

```
Your execution cycles = 23322 cycles
Your clock period     = 7.0 ns
Total latency         = 177331.0 ns

Total cell area       = 59086
Performance           = 1.06*e10
```

- Internet

```
Your execution cycles = 27812 cycles
Your clock period     = 7.0 ns
Total latency         = 208761.0 ns

Total cell area       = 52722
Performance           = 1.11*e10
```

## 心得


這個lab題目是解決數獨問題。我使用了Backtracking演算法，並在算法中引入了一個額外的stack，用於記錄上一個可以填入多個數字的位置指標，這樣在回溯時能夠更快地收斂。此外，我採用了dirty bit的概念，以確保不會填入重複的答案。最後，題目的輸入可能違反數獨的基本原則（每行、每列、每個九宮格內只能有唯一數字），必須思考要如何解決這個問題，並且思考如何利用硬體的平行處理資源來加速解答。基於數獨操作的簡單性，我們可以大幅提升效率，進一步發揮硬體的使用率。

```
pat_10000.txt是我自己寫的(有多的corner)
但performance依網路上2011個pattern來評的
```

## ref

```
- https://www.geeksforgeeks.org/program-sudoku-generator/
- https://stackoverflow.com/questions/45471152/how-to-create-a-sudoku-puzzle-in-python 
- https://github.com/mirkat1206/2021_Spring_NCTU_ICLAB/tree/main/Lab03
```