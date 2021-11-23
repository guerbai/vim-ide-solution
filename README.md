# Vim编程环境解决方案
![](https://raw.githubusercontent.com/guerbai/scene/main/blog/20211124015144.png)

在Vim社区有许多成名已久的成熟配置，各种功能覆盖齐全，比如[SpaceVim](https://github.com/SpaceVim/SpaceVim)、[amix的经典配置](https://github.com/amix/vimrc)、[spf13-vim](https://github.com/spf13/spf13-vim)等等。
在尝试过一些之后发现当想要在某成熟配置中找到自己想要实现的某个能力时会非常费劲，若是翻遍文档及issue后仍未有所发现便会不知所措。主要是由于这些项目往往体量较大，文档或者组织方式并非面向编程人员实际使用场景，想要调配顺手且不出问题依然要付出较大的努力。此外往往会有大量自己并不需要的能力，信息量较多，略显臃肿。

## 目标
- 梳理总结开发人员在日常编码中对编程环境的各种实际需求
- 提供在Vim编程环境下，应对各需求场景的一种可行实战姿势
- 以"有需求/痛点->解决"的场景化视角和组织方式来提供一种参考
- 分享Vim配置文件，提供一份开箱即用的编程环境

## 说明
- 快捷健的具体键位选择非本项目重点，只为说明场景`xxx`的可行性，仅供参考; 键位的设置思路非常朴素，比如跟buffer相关的带有`b`
- 选用的插件并不是相应场景唯一的甚至不是最好的插件，Vim社区与Emacs相比同功能插件百花齐放的情况更常见些，使用者完全可以更换为其他任一个同功能插件来满足相同的某场景的编码诉求
- 提到的场景目前仅覆盖作者个人的实际使用情况，比如git add&commit这样的操作从来都是在terminal完成，不会使用相关插件的功能，亦不会在文中被提到
- Vim相关基本操作可以参考[vim-galore](https://github.com/mhinz/vim-galore)

## 安装

**依赖**

- [neovim](https://neovim.io/): floating window/community driven/lua config
- [vim-plug](https://github.com/junegunn/vim-plug): plugin manager
- [ripgrep](https://github.com/BurntSushi/ripgrep): for fuzzy search
- [pynvim](https://github.com/neovim/pynvim): implements support for python plugins in neovim
- [nodejs](https://nodejs.org/en/): coc.nvim's dependency

**安装**

```sh
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/guerbai/vim-ide-solution ~/.config/nvim
alias vim='nvim'
```

首次打开vim后运行`:PlugInstall`以及`:CocInstall coc-json coc-pyright coc-tabnine coc-snippets `

## 常规操作

本节列出buffer、window管理等不引入插件的基本操作，相关配置在`lua/setting.lua`与`lua/mapping.lua`两个文件。

出于个人习惯，`<Leader>`键设置为英文逗号`,`，可根据实际使用习惯修改为空格等。

后文中无特殊说明，所有操作均是在normal模式下可用。

| 场景                            | 操作                                                | 备注                                    |
| ------------------------------- | --------------------------------------------------- | --------------------------------------- |
| 显示行号                        | -                                                   | `set number`                            |
| 显示相对行号                    | -                                                   | `set relativenumber`                    |
| 编辑文件后保存                  | `<Leader>s`                                         | s->save                                 |
| 保存当前buffer至新文件          | `:w newfile.txt`                                    | 非高频操作，vim原生指令                 |
| 打开草稿buffer                  | `<Leader>e`                                         | 参考在vscode中打开一个`Untitle-1`       |
| 切换至下一个/上一个buffer       | `<Leader>bn`/`<Leader>bp`                           | b->buffer, n->next, p->previous         |
| 关闭当前buffer                  | `<Leader>bd`                                        | d->delete                               |
| 关闭除当前buffer外的其他buffers | `<Leader>bo`                                        | o->others                               |
| 当前buffer统计信息              | `<Leader>bs`                                        | s->statistics，字符数、单词数等统计信息 |
| 左右/上下分屏                   | `:vs`/`:sp`                                         | vim原生指令                             |
| 切换光标至左/下/上/右window     | `<Leader>wh`/`<Leader>wj`/`<Leader>wk`/`<Leader>wl` | w->window，hjkl->左下上右               |
| 关闭当前window                  | `<Leader>wc`                                        | c->close                                |
| 关闭quickfix/preview window     | `<Leader>wq`/`<Leader>wp`                           | q->quickfix, p->preview                 |
| 复制选中内容至系统剪切板        | `<Leader>y` visual模式且选中文本的时候              | y->yank                                 |
| 格式化json字符串                | `<Leader>=j` normal模式或visual模式且选中json文本时 | =->format, j->json                      |
| 编辑/查看配置                   | `<Leader>vs`/`<Leader>vm`/`<Leader>vp`              | 可结合下文项目内搜索能力使用            |
| 重新加载vim配置                 | `<Leader>vr`                                        | v->vim, r->reload                       |

## 便捷终端

![](https://raw.githubusercontent.com/guerbai/scene/main/blog/20211124015550.png)

编程时经常需要打开终端做一些简单操作，使用诉求上总结有两点：

- 随时、快速打开，使用后直接关闭
- 打开后位于当前项目根目录

这里需要引入两个插件，[vim-floaterm](https://github.com/voldikss/vim-floaterm)与[vim-rooter](https://github.com/airblade/vim-rooter)，前者使用neovim的floating window来呈现终端，后面用来确定项目根目录。后者需要专门配置一下rooter的patterns，见`lua/plugins/init.lua`。

值得一提的是，vim中的终端也分insert/normal/visual几中模式，一些基本操作也是支持的。

| 场景                    | 操作                  | 备注                                                   |
| ----------------------- | --------------------- | ------------------------------------------------------ |
| 打开终端                | `<Leader>sh`          | sh->shell                                              |
| 关闭终端                | `<Leader>sh`/`exit`   | 前者是在终端的normal模式下，exit是在终端的insert模式下 |
| 终端中进入nonrmal模式   | `<ESC>`               | `lua/mapping.lua`中有相应键位配置                      |
| 终端输出内容向下/上翻页 | `<Ctrl>-d`/`<Ctrl>-u` | 在终端的normal模式下可使用这样的vim原生指令翻页        |

## 搜索与替换

![](https://raw.githubusercontent.com/guerbai/scene/main/blog/20211124015733.png)

项目内的搜索能力需要引入插件[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)，同类型的插件还有著名的[fzf.vim](https://github.com/junegunn/fzf.vim)，由于telescope更"neovim一些"且配置上比fzf要简单许多，本项目使用前者。

批量替换就个人的经验而言是频次很低的使用场景，可以用插件[nvim-spectre](https://github.com/windwp/nvim-spectre)完成，具体操作见该项目的README。

| 场景               | 操作                       | 备注                                                   |
| ------------------ | -------------------------- | ------------------------------------------------------ |
| buffer内搜索字符串 | `/<pattern>`               | vim原生指令，支持正则                                  |
| buffer内替换字符串 | `:%s/<pattern>/<target>/g` | vim原生指令，pattern支持正则，target是要替换成的字符串 |
| 项目内模糊搜索文件 | `<Leader>ff`               | f->find, f->file                                       |
| 项目内模糊搜索字符 | `<Leader>fw`               | f->find, w->word，需要ripgrep支持                      |

## 侧边栏

在JetBrains家族的系列IDE产品中，常见的侧边栏包括Project(项目目录文件结构)、Structure(当前文件语言结构)、Favorites、Database等。

本项目使用[nerdtree](https://github.com/preservim/nerdtree)以及[vista.vim](https://github.com/liuchengxu/vista.vim)分别来展现项目与文件语言结构。两者都需要几行专门的配置来控制其具体展现行为，位置在`lua/plugins/configs/`下的`nerdtree.lua`以及`vista.lua`。

| 场景                 | 操作         | 备注                                                       |
| -------------------- | ------------ | ---------------------------------------------------------- |
| 切换目录文件结构     | `<Leader>tt` | -                                                          |
| 刷新目录文件结构     | `<Leader>tr` | r->reload，往往需要手动更新，是一个待优化点                |
| 切换当前文件语言结构 | `<Leader>ta` | 需要语言一定的语言理解能力，依赖于后文中的语言理解部分插件 |

## Git集成

![](https://raw.githubusercontent.com/guerbai/scene/main/blog/20211124020022.png)

Git操作可以完全在命令行中也可以完全在其他GUI软件中，相关命令众多。Git workflow的规范是另一个话题，此处不展开。大多数常用的命令比如`git add`、`git commit`等结合*便捷终端*使用即可完成。

在vim-ide-solution的语境下，这部分主要是提供一些编程环境中展示/标识层面的集成，提供信息给编程人员而不是做具体操作。需要引入/依赖三到四个插件，这些插件的功能众多，其中绝大部分均非个人的实际使用诉求，此处不再赘述。

| 场景                         | 操作                      | 备注                                                         |
| ---------------------------- | ------------------------- | ------------------------------------------------------------ |
| 当前buffer行级别增/删/改标识 | -                         | [vim-gitgutter](https://github.com/airblade/vim-gitgutter)   |
| nerdtree中文件的增/改标识    | -                         | [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin) |
| 查看当前行的git blame        | `:Git blame`              | [vim-fugitive](https://github.com/tpope/vim-fugitive)        |
| 查看当前文件的变更历史       | `:Telescope git_bcommits` | [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) |
| 恢复某个改动块               | `:GitGutterUndoHunk`      | [vim-gitgutter](https://github.com/airblade/vim-gitgutter)   |

## 界面美化

界面美化不仅仅是颜值美化，更重要的点在于能够获取更多的信息，有效提升编程体验。

| 场景                       | 操作                                                         | 备注                                                         |
| -------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| nerdtree各语言文件显示图标 | -                                                            | [vim-devicons](https://github.com/ryanoasis/vim-devicons)    |
| 快速打开常用文件           | 见数字标识                                                   | [vim-startify](https://github.com/mhinz/vim-startify)，还有牛牛格言 |
| 显示打开的buffer列表       | -                                                            | [vim-airline](https://github.com/vim-airline/vim-airline)，还有好看的状态栏 |
| 切换主题                   | `:Telescope colorschems`/`<Leader>vp`编辑colorscheme后`<Leader>vr` | telescope方式退出vim后切换的theme会失效                      |
| 安装新主题                 | `<Leader>vp`添加插件后`<Leader>vr`后`:PlugInstall`           | 效果图中的主题为tokyonight                                   |

## 语言理解

Language Server Protocol(lsp)提供了语言理解能力，neovim 5.0内置了lsp，并且提供了官方插件[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)，此外另一套基于lsp的语言理解能力的插件是[coc.nvim](https://github.com/neoclide/coc.nvim)，本项目选用了后者，并提供了Golang和Python的配置。若要添加其他语言支持，可以根据其[wiki](https://github.com/neoclide/coc.nvim/wiki/Language-servers)中介绍操作。

lsp主要提供了跳转、format等功能，除此之外，本项目还引入了[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)以做代码语法高亮功能。

| 场景                  | 操作                      | 备注                   |
| --------------------- | ------------------------- | ---------------------- |
| 跳转到定义            | `<Leader>gd`              | g->goto, d->definition |
| 跳转到引用            | `<Leader>gr`              | r->reference           |
| 显示函数签名/注释     | `<Leader>gK`              | -                      |
| 显示所有错误列表      | `<Leader>ge`              | e->error               |
| 变量/函数重命名       | `<Leader>gr`              | r->rename              |
| 跳转到上/下一个错误处 | `<Leader>g[`/`<Leader>g]` | -                      |

`lua/plugins/configs/coc.lua`中还配置了在`<Leader>s`时进行自动包导入以及代码格式化的功能。

## 代码补全

有三种类型的代码实例：

- 基于语言理解，比如Golang中的一个struct实例，当输入到`.`时能够提示出该struct的方法名与属性
- 基于使用频次，[TabNine](https://github.com/codota/TabNine)
- code snippets

这些能力依然由coc.nvim提供，安装部分的`CocInstall`命令即是下载coc.nvim的相关插件使其满足上述补全能力。

本项目提供了golang的常用snippets，位于`ultisnips/go.snippets`下。

需要应用代码补全时往往在Vim Insert模式下，以及操作均为在Insert模式下使用。

| 场景                       | 操作              | 备注                                         |
| -------------------------- | ----------------- | -------------------------------------------- |
| 切换至下/上一个提示        | `<TAB>`/`<S-TAB>` | 在`lua/plugins/configs/coc.nvim`中有相应配置 |
| 输入缩写后触发snippets补全 | `<Ctrl>-l`        | -                                            |

## 数据库连接

![](https://raw.githubusercontent.com/guerbai/scene/main/blog/20211124021158.png)

作为服务端研发，日常需要连接数据库(比如MySQL)。需要使用两个插件[vim-dadbod](https://github.com/tpope/vim-dadbod)与[vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui)，前者提供与DB交互的能力，后者为前者提供一个UI界面。关于此二插件的一些具体配置位于`lua/plugins/configs/mysql.lua`

此处的使用诉求包括：

- 能够使用Vim操作编辑SQL语句
- 能够使用Vim移动命令在编写窗口与结果窗口之间切换
- 能够使用Vim方式在结果列表中搜索、选择、复制等操作

| 场景                                | 操作          | 备注                            |
| ----------------------------------- | ------------- | ------------------------------- |
| 切换DB侧边栏                        | `:DBUIToggle` | -                               |
| 执行某句SQL                         | `<Leader>S`   | 需要在visual模式选中某SQL后操作 |
| 光标从结果区移到SQL编写window       | `<Leader>k`   | -                               |
| 关闭结果区并将光标移到SQL编写window | `<Leader>c`   | -                               |

## 写在最后

对于在上文中未提到的编程过程中常用场景，欢迎提issue进行探讨。
