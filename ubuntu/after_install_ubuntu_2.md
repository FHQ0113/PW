- **脚本名称**: 安装完成 Ubuntu 之后的步骤 2
- **创建时间**: 2024年10月16日
- **创建者**: Peng Wei
- **脚本目的**: 为初学者提供入门指南及进行个性化设置
---

# 1 vscode & ubuntu

1. **基于 VSCode 的远程 Ubuntu 服务端 & SSH 免密连接**  
   - 在 VSCode 中安装 `Remote - SSH` 扩展，通过 SSH 免密连接到远程 Ubuntu 服务端，方便本地开发环境与远程服务器的交互。
   - 具体步骤可以参考 [VSCode配置 SSH连接远程服务器+免密连接教程](https://zhuanlan.zhihu.com/p/667236864)。

## 1.1 配置 Ubuntu 客户端的 SSH & GitHub
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

## 1.2 免密登录设置步骤
1. 参考 `免密链接.pptx` 文件，设置 SSH 远程操作。
2. 在 Windows 上生成 SSH 公钥，将公钥文件 `id_rsa.pub` 的内容复制到服务器的 `~/.ssh/authorized_keys` 文件中，实现免密登录。

详细教程可参考：[VSCode配置 SSH连接远程服务器+免密连接教程](https://zhuanlan.zhihu.com/p/667236864)

# 2. 个性化终端配置 (修改 .bashrc 文件)

## 2.1 配色及命令提示符换行
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
