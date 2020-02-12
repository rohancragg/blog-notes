# Bash Shell on Windows

!!! info
    **Shell Trivia**
    SH is Bourne Shell and so Bash is Born-again Bourne Shell

## Auto-Complete 

```bash
touch ~/.bashrc

```

### Git

!!! info 
    ** What is Git? **
    
    Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.
    
    A version-control system is a tool for tracking changes in source code during software development. It is designed for coordinating work among a group of programmers, but it can be used to track changes in any set of files.

Here's how to get auto-complete for `git` commands in Git Bash on Windows.

```bash
mkdir ~/bash_completion.d   
curl -o ~/bash_completion.d/git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
echo "source ~/bash_completion.d/git" >> ~/.bashrc
```

If using PowerShell (as I often do) then the [`posh-git`](https://github.com/dahlbyk/posh-git) Module is a great option too.
```powershell
scoop install posh-git
```

### kubectl CLI

!!! info 
    ** What is Kubectl? **
    
    Kubectl is a command line tool for controlling Kubernetes clusters.

The kubectl completion script for Bash can be generated with the command `kubectl completion bash`.
[from here:](https://kubernetes.io/docs/tasks/tools/install-kubectl/#optional-kubectl-configurations)

Here's how to get auto-complete for `kubectl` commands in Git Bash on Windows.

```bash
kubectl completion bash > ~/bash_completion.d/kubectl
echo "source ~/bash_completion.d/kubectl" >> ~/.bashrc
````

