# Bash Shell on Windows

I often find code snippets for automating things in my world (mostly Azure Cloud admin and development) tend to assume that I'm using a Linux shell of some sort and so the commands and scripts are in Bash.

Specifically, I do lots of things with tools such as [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest) and the examples often default to Bash syntax. While these are usually pretty simple to transpose into something that could exectue in PowerShell (see below) it's still annoying not to be able to copy and paste and execute the commands there and then, or add them to a script file for future use without first translating them to PowerShell.

## Boring option - Transposing between Bash and PowerShell

Bash and PowerShell have some aspects of syntax in common (e.g. when referencing a variable like this: `$myVariable`)

But there are some other things that differ (e.g. when assigning a variable like this):

```powershell tab="PowerShell"
$myVariable='some text'
```

```bash tab="Bash"
$myVariable='some text'
```

... or when setting an environment variable like this:

```powershell tab="PowerShell"
SET MY_ENV='some text'
```

```bash tab="Bash"
export MY_ENV='some text'
```

!!! info
    **Shell Trivia**
    SH is Bourne Shell and so Bash is Born-again Bourne Shell

## Cool option - Git Bash 

### Coolness pt.1 - Configuring Auto-Complete 

```bash
touch ~/.bashrc

```

#### Git

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

#### kubectl CLI

!!! info 
    ** What is Kubectl? **
    
    Kubectl is a command line tool for controlling Kubernetes clusters.

The kubectl completion script for Bash can be generated with the command `kubectl completion bash`.
[from here:](https://kubernetes.io/docs/tasks/tools/install-kubectl/#optional-kubectl-configurations)

Here's how to get auto-complete for `kubectl` commands in Git Bash on Windows.

```bash
kubectl completion bash > ~/bash_completion.d/kubectl
echo "source ~/bash_completion.d/kubectl" >> ~/.bashrc
```

### Coolness pt.2 - Using Git Bash as an Integrated Shell in VSCode

Git Bash is a 'Linux-like' shell experience without going 'all the way' and dropping into the Windows Subsystem of Linx (WSL) Bash shell.

Whilst there are times when I'll use WSL too, there are times when I want to be working 'in Windows' but using a more Bash-like experience. This is where Git Bash come to the rescue.

!!! note
    Git Bash is installed for you when you install Git for Windows, so if you're already using Git then you've kinda got this for free anyway.

> *In Visual Studio Code, you can open an integrated terminal, initially starting at the root of your workspace. This can be convenient as you don't have to switch windows or alter the state of an existing terminal to perform a quick command-line task.*
>
> from: [Integrated Terminal](https://code.visualstudio.com/docs/editor/integrated-terminal)

As [this StackOverflow answer](https://stackoverflow.com/a/40489824/5351) explains you can change the default integrated Terminal by updating the setting `terminal.integrated.shell.windows`.

I set mine to `C:/Program Files/Git/bin/bash.exe`

Now I can use `Ctrl-Shift-'` ( i.e. the default Key Binding to `workbennch.action.terminal.new` ) to open a new integrated terminal which will be running Git Bash and to which I can send commands from text editor windows, like this:

![Image](media/git-bash-vscode.png?raw=true)

I also added a Terminal [Key Binding](https://code.visualstudio.com/docs/getstarted/keybindings) for the F8 key to be bound to  `workbench.action.terminal.runSelectedText` so that whilst editing a shell (`.sh`) file in the editor, I could easily send the selected commands to my active terminal in VSCode.