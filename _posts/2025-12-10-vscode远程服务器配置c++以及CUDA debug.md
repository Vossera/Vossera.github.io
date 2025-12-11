
vscode连接服务器c++总是抽风，没有intelli sense或者语法高亮。

花了点时间研究一下，关键在于
## 1. 
![](assets/2025-12-10-vscode远程服务器配置c++以及CUDA%20debug/file-20251211090908012.png)
这里不能用默认的x64.
## 2. 
![](assets/2025-12-10-vscode远程服务器配置c++以及CUDA%20debug/file-20251211090908011%201.png)
这里不能disable了
## 3. 
![](assets/2025-12-10-vscode远程服务器配置c++以及CUDA%20debug/file-20251211090908011.png)
这里不能是gcc,因为我们写的是c++代码而非c代码.



# CUDA Debug
https://docs.nvidia.com/nsight-visual-studio-code-edition/latest/cuda-debugger/index.html


```
三个关键是
一个-G参数（这个加在cmakelists.txt里面），
以及make dbg=1。这个是加在build.sh里面（也可以自己执行）
"type": "cuda-gdb",（这个在launch.json里面）
```


## 注意c++代码的调试和CUDA的调试要分开，因为这是两个gdb

参考下面的launch.json

```json
{

// Use IntelliSense to learn about possible attributes.

// Hover to view descriptions of existing attributes.

// For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387

"version": "0.2.0",

"configurations": [

  

{

"name": "CUDA C++: Launch",

"type": "cuda-gdb",

"request": "launch",

"program": "${workspaceFolder}/data/meshDistGPU",

"args": ["${workspaceFolder}/data/my-bunny.obj", "${workspaceFolder}/data/alien-animal.obj"],

"preLaunchTask": "Build CUDA C++: Launch"

},

{

"name": "C++: Launch",

"type": "cppdbg",

"request": "launch",

"cwd": ".",

"program": "${workspaceFolder}/data/meshDistGPU",

"args": ["${workspaceFolder}/data/my-bunny.obj", "${workspaceFolder}/data/alien-animal.obj"],

"preLaunchTask": "Build CUDA C++: Launch"

},

]

}
```