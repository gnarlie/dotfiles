set confirm off
set extended-prompt \[\e[0;34m\](gdb) \[\e[1;31m\]\f \[\e[0m\]

set auto-load python-scripts on
add-auto-load-safe-path /home/badams/.fighome/runtime/gcc/
add-auto-load-safe-path /home/badams/miniconda/envs/berghoff/bin/python-gdb.py
add-auto-load-safe-path /home/badams/miniconda/envs/berghoff/lib/libstdc++.so.6.0.20-gdb.py
add-auto-load-safe-path /home/badams/dev

