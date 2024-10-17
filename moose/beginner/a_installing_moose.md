- **创建时间**: 2024年10月17日
- **创建者**: Peng Wei
- **文档目的**: 为初学者提供安装MOOSE之前的必备知识
- TODO
---

# 开始之前
> 在使用 MOOSE 进行建模之前，我们需要学习一些基础的前置知识，目的是可以远程 ubuntu 系统下的 MOOSE 软件，包括

## 前置知识
1. 操作系统1 - [Linux 教程 | 菜鸟教程](https://www.runoob.com/linux/linux-tutorial.html)：这是一个完整的 Linux 入门教程，适合新手快速上手。
2. 操作系统2 - [Linux 常用操作命令大全（最后更新时间：2024年1月）](https://blog.csdn.net/m0_46422300/article/details/104645072)：提供了常用 Linux 命令的详细列表，最后更新时间为2024年1月。
3. 笔记文档 - [Markdown 教程](https://www.runoob.com/w3cnote/git-guide.html)：一种轻量级标记语言，它允许人们使用易读易写的纯文本格式编写文档。
4. 代码仓库管理 - [Github 简明教程](https://www.runoob.com/w3cnote/git-guide.html)：一个基于git的代码托管平台，付费用户可以建私人仓库，我们一般的免费用户只能使用公共仓库，也就是代码要公开。
5. C++教程 - [C++ - 菜鸟教程](https://www.runoob.com/cplusplus/cpp-tutorial.html)：一种高级语言，它是由 Bjarne Stroustrup 于 1979 年在贝尔实验室开始设计开发的。

## 安装 MOOSE 之前的相关操作
1. 创建 GitHub 账号：前往 [GitHub 官网](https://github.com/) 创建个人账号，并设置 SSH 密钥来方便后续与 GitHub 的交互；
2. 本地 Win11 下载并安装 [vscode](https://code.visualstudio.com/);
3. 在 Ubuntu 下使用 SSH 远程管理 GitHub 仓库：通过 SSH 生成密钥并配置 GitHub 仓库，使得远程操作更加便捷。具体步骤可以参考 [GitHub SSH 配置教程](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)；
```bash
# 生成 SSH 密钥
ssh-keygen -t rsa -C "1248110286@qq.com"

# 成功的话会在~/下生成.ssh文件夹，进去，打开id_rsa.pub，复制里面的key。

# 验证 GitHub 连接是否成功
ssh -T git@github.com

# 设置 GitHub 用户名和邮箱
git config --global user.name "PengWei97"
git config --global user.email "1248110286@qq.com"
```
详细教程可参考：[Github 简明教程](https://www.runoob.com/w3cnote/git-guide.html)

4. 基于 VSCode 的远程 Ubuntu 服务端 & SSH 免密连接：在 VSCode 中安装 `Remote - SSH` 扩展，通过 SSH 免密连接到远程 Ubuntu 服务端，方便本地开发环境与远程服务器的交互。
   1. 参考 `免密链接.pptx` 文件，设置 SSH 远程操作。
   2. 在 Windows 上生成 SSH 公钥，将公钥文件 `id_rsa.pub` 的内容复制到服务器的 `~/.ssh/authorized_keys` 文件中，实现免密登录。
   3. 具体步骤可以参考 [VSCode配置 SSH连接远程服务器+免密连接教程](https://zhuanlan.zhihu.com/p/667236864)；
5. 采用 Xftp 远程下载服务端文件：使用 [Xftp](https://www.xshell.com/zh/xftp/) 工具远程连接服务器，轻松下载和管理 Ubuntu 服务端中的文件；

## vscode 必要 extensions
- **Markdown All in One**: 提供简化的 Markdown 编辑、预览功能，方便撰写文档。
- **Remote – SSH**: 允许通过 SSH 连接远程服务器，在 VSCode 中进行远程开发和调试。
- **Todo Tree**: quickly searches (using ripgrep) your workspace for comment tags like TODO and FIXME, and displays them in a tree view in the activity bar. 

# 安装 MOOSE
1. [Installing MOOSE](https://mooseframework.inl.gov/getting_started/installation/conda.html)
2. 注意：为了提高安装速度，建议使用 `mamba` 替代 `conda`，因为 mamba 具有更快的包管理和安装能力。

## 安装过程中遇到的问题
1. 