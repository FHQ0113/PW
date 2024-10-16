# 安装完成 Ubuntu 之后的步骤 2

- **脚本名称**: 安装完成 Ubuntu 之后的步骤 2
- **创建时间**: 2024年10月16日
- **创建者**: Peng Wei
- **脚本目的**: 为初学者提供入门指南及进行个性化设置
---

# 0. linux 系统入门
1. [Linux 教程 | 菜鸟教程](https://www.runoob.com/linux/linux-tutorial.html)：这是一个完整的 Linux 入门教程，适合新手快速上手。
2. [Linux 常用操作命令大全（最后更新时间：2024年1月）](https://blog.csdn.net/m0_46422300/article/details/104645072)：提供了常用 Linux 命令的详细列表，最后更新时间为2024年1月。

## 0.1 在开始基于 vscode 使用 MOOSE 之前
1. **创建 GitHub 账号**  
   - 前往 [GitHub 官网](https://github.com/) 创建个人账号，并设置 SSH 密钥来方便后续与 GitHub 的交互。

2. **在 Ubuntu 下使用 SSH 远程管理 GitHub 仓库**  
   - 通过 SSH 生成密钥并配置 GitHub 仓库，使得远程操作更加便捷。具体步骤可以参考 [GitHub SSH 配置教程](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).

3. **基于 VSCode 的远程 Ubuntu 服务端 & SSH 免密连接**  
   - 在 VSCode 中安装 `Remote - SSH` 扩展，通过 SSH 免密连接到远程 Ubuntu 服务端，方便本地开发环境与远程服务器的交互。
   - 具体步骤可以参考 [VSCode配置 SSH连接远程服务器+免密连接教程](https://zhuanlan.zhihu.com/p/667236864)。

4. **采用 Xftp 远程下载服务端文件**  
   - 使用 [Xftp](https://www.xshell.com/zh/xftp/) 工具远程连接服务器，轻松下载和管理 Ubuntu 服务端中的文件。

# 1. VSCode 配置 on 本地端口 ~ 通常是 window system

## 1.1 extensions 必备插件
- **Markdown All in One**: 提供简化的 Markdown 编辑、预览功能，方便撰写文档。
- **Remote – SSH**: 允许通过 SSH 连接远程服务器，在 VSCode 中进行远程开发和调试。

## 1.2 免密登录设置步骤
1. 参考 `免密链接.pptx` 文件，设置 SSH 远程操作。
2. 在 Windows 上生成 SSH 公钥，将公钥文件 `id_rsa.pub` 的内容复制到服务器的 `~/.ssh/authorized_keys` 文件中，实现免密登录。

详细教程可参考：[VSCode配置 SSH连接远程服务器+免密连接教程](https://zhuanlan.zhihu.com/p/667236864)

# 2. 配置 Ubuntu 客户端的 SSH & GitHub
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

# 3. 安装 MOOSE
1. [Installing MOOSE](https://mooseframework.inl.gov/getting_started/installation/conda.html)
2. 注意：为了提高安装速度，建议使用 `mamba` 替代 `conda`，因为 mamba 具有更快的包管理和安装能力。

# 4. 个性化终端配置 (修改 .bashrc 文件)

## 4.1 配色及命令提示符换行
编辑 ~/.bashrc 文件，添加以下内容，为终端提示符增加 Git 分支显示功能，并进行换行美化：
```bash
# 自定义函数显示当前 Git 分支
[ -r /home/pw-moose/.byobu/prompt ] && . /home/pw-moose/.byobu/prompt   #byobu-prompt#
function git_branch {
     branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
        if [ "${branch}" != "" ];then
                 if [ "${branch}" = "(no branch)" ];then
                        branch="(`git rev-parse --short HEAD`...)"
                   fi
                          echo " ($branch)"
                       fi
 }

# 检查是否启用颜色提示符
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]$(git_branch)\n\[\033[01;36m\]\w\[\033[01;31m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:(git_branch)\n\w\n\$ '
fi
```
此设置将在终端中显示当前 Git 分支，并优化提示符的可读性。
