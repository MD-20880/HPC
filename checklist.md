Compilers:
===


Compiler Flags:
===
-O {0,1,2,3,Fast}


Loop :
===
When Cell Size < L1 Cache, test 2D array[N][N] && 1D array[N*N]:
    LOAD CELL ENTIRE(576 KB) -> LOAD OBSTACLES(64 KB) -> LOAD CELL ENTIRE
    
    LOAD ROW
    LOAD ADJACENT ROWS
    LOAD DISTANT ROWS

    
    




Memery Transfer :
===
 



Verctorizaion : 
===
