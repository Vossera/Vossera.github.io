
原生c++插件是不支持写 `vector<int>...` extension 自动 `#include <vector>`
原因如下
![](../assets/2025-12-04-vscode配置自动include/file-20251204112237416.png)

但是clangd这个插件是支持的。下载clangd，然后修改
```cpp
"C_Cpp.intelliSenseEngine": "disabled",
```
解决原生插件与clangd的冲突问题。
现在打vector就会自动引入include啦
