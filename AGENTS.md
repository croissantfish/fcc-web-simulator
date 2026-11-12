# FCC ASM Lab 项目指南

## 项目目标

本项目是面向 FCC 编译原理课程设计的纯浏览器汇编调试器，目标平台为 SPIM / MIPS32 与 RISC-V / RV32IM。优先保证 FCC 编译器产物和参考汇编的执行语义、调试可见性与教学易用性，而不是实现完整操作系统或通用 ISA 模拟器。

## 技术栈与命令

- Vue 3、Vite、JavaScript、`@lucide/vue`、`marked`。
- 包管理器使用 npm，依赖版本以 `package-lock.json` 为准。
- 所有执行在浏览器本地完成，没有后端服务。

```bash
npm install
npm run dev
npm run build
npm run preview
```

修改后必须通过 `npm run build`。涉及执行语义时，还应使用真实汇编运行验证，不能只检查导入或类型编译。

## 目录职责

```text
src/
├── App.vue                     # 全局调试状态、快捷键与操作编排
├── components/
│   ├── EditorPanel.vue         # 源码编辑、语法显示、断点入口
│   ├── RegisterPanel.vue       # 寄存器显示、编辑与进制切换
│   ├── MemoryPanel.vue         # 堆栈、堆、数据段及地址定位
│   ├── ConsolePanel.vue        # 标准输入输出
│   └── LicenseModal.vue        # 许可证 Markdown 渲染与弹窗
├── simulator/
│   ├── index.js                # Simulator、指令语义、syscall/ecall
│   ├── parser.js               # 段、标签、数据初始化与指令解析
│   ├── memory.js               # 稀疏分页内存、小端读写与数值工具
│   └── isa.js                  # 架构配置、寄存器名和显示格式
├── examples.js                 # 内置教学示例汇总
├── examples/fcc/               # FCC 编译器生成的双架构汇编及样例元数据
├── highlight.js                # 汇编语法高亮
└── style.css                   # 全局界面样式
```

## 执行引擎约定

### 数据与寄存器

- 两种目标均为 32 位、小端序，指针和字长为 4 字节。
- 通用寄存器存储在 `Int32Array(32)` 中；算术结果需要保持 32 位回绕。
- MIPS `$zero` 与 RISC-V `zero/x0` 永远为 0。
- 有符号比较使用 Int32 值，无符号比较必须显式 `>>> 0`。
- 乘法低 32 位使用 `Math.imul`；高位乘法使用 BigInt，避免 JavaScript 浮点精度问题。
- 内存使用稀疏分页实现，未分配页面读取为 0，写入时分配。

### 汇编与入口

- `parser.js` 先分配段地址、收集标签，再解析数据初始化表达式。
- 同时存在 `_start` 和 `main` 时从 `_start` 进入，否则从 `main` 进入。
- 每条源指令使用一个 4 字节虚拟地址；伪指令直接解释，不展开成真实机器码序列。
- MIPS 不模拟延迟槽，RISC-V 没有延迟槽。
- 函数返回到 PC 0 表示程序结束。
- 未定义的外部 FCC I/O 或分配函数可使用内置实现；一旦程序定义同名标签，必须执行程序自身实现。

### 调试状态

- `pc` 始终指向下一条待执行指令。
- 断点应在执行该指令之前暂停。
- 只有从当前断点“继续”时才跳过当前断点一次；首次运行不能跳过入口断点。
- 步过函数调用时，在调用指令的下一条地址设置临时断点。
- 引擎变更寄存器、内存、PC、输出或执行状态后，Vue 侧必须触发 `revision`，确保计算属性和视图刷新。
- 执行错误需要保留源行号和虚拟地址，便于定位。

## 界面约定

- 界面和项目文档使用简体中文。
- 保持当前深色调试工作台风格，图标使用 `@lucide/vue`，不要引入另一套图标库。
- 编辑器执行期间只读；代码修改后标记为待重新汇编，下次运行自动装载。
- 内存视图以每行 16 字节的 Hex 形式显示地址、字节和 ASCII；堆栈视图优先展示 SP / FP 附近内容，并根据 SP / FP 高亮当前栈帧。
- 不要在普通功能修改中引入大型编辑器或状态管理依赖；先复用现有组件和 `Simulator` API。

## 验证要求

FCC 参考项目默认位于当前仓库的 `../fcc`：

- 汇编：`../fcc/tests/ref_asm/{mips32,riscv32}/`
- 输入与期望输出：`../fcc/tests/data/`
- RISC-V 运行时：`../fcc/runtime/riscv32/start.s`、`io.s`

执行语义修改至少验证：

1. 两种架构的递归阶乘示例。
2. 断点暂停、继续、单步和函数步过。
3. 小端 `lw/sw`、`lb/sb` 与栈帧变化。
4. `getchar/getint/getstr` 和 `putchar/putint/putstr`。
5. 与修改指令相关的 FCC 参考程序输出差分。

完整回归应覆盖全部 14 个参考程序。RISC-V 运行时解析或 `ecall` 修改还需把原始 `start.s`、`io.s` 与参考程序拼接执行，不能只验证内置 I/O 后备路径。

不要为了验证而修改 `../fcc` 中的文件。构建产物、截图和临时测试脚本不要提交。
