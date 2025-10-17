# Graphic

## Features and sample usage

```latex
  \begin{figure}[h]
    \centering
    \begin{tikzpicture}[shorten >=1pt,node distance=2cm,on grid,auto]
      \node[state, accepting, initial] (q_0)   {$q_0$};
      \node[state] (q_1) [right=of q_0] {$q_1$};
      \node[state] (q_2) [right=of q_1] {$q_2$};
      \node[state] (q_3) [right=of q_2] {$q_3$};
      \node[state] (q_4) [right=of q_3] {$q_4$};
      \path[->]
      (q_0)
      edge [loop above] node {0} (q_0)
      edge node {1} (q_1)
      (q_1)
      edge node {0} (q_2)
      edge [bend right=-30] node {1} (q_3)
      (q_2)
      edge [bend left] node {1} (q_0)
      edge [bend right=-30] node {0} (q_4)
      (q_3)
      edge node {1} (q_2)
      edge [bend left] node {0} (q_1)
      (q_4)
      edge node {0} (q_3)
      edge [loop below] node {1} (q_4);
    \end{tikzpicture}
    \caption{DFA, \(A\), this is really beautiful, ya know?}
    \label{fig:multiple5}
  \end{figure}
```

```latex
  Using this knowledge, we can construct a transition table that tell us where to go:

  \begin{table}[ht]
    \centering
    \begin{tabular}{c || c | c | c | c | c}
            & \(x \mod 5 = 0\)
            & \(x \mod 5 = 1\)
            & \(x \mod 5 = 2\)
            & \(x \mod 5 = 3\)
            & \(x \mod 5 = 4\)
      \\
      \hline
      \(x0\) & 0                & 2 & 4 & 1 & 3 \\
      \(x1\) & 1                & 3 & 0 & 2 & 4 \\
    \end{tabular}
  \end{table}
```
