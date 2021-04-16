---
title: Miscellanous Notes
hero: Miscellanous notes and links on tools and techniques that I want to remember
description: Miscellanous notes and links on tools and techniques that I want to remember
authors:
    - Rohan Cragg
date: 2020-02-04
---

## GitHub CLI and Command Completions in Powershell

[This comment in the CLI issues](https://github.com/cli/cli/issues/695#issuecomment-619247050) gave me a hint how best to add command completions for [GitHub CLI `gh`](https://cli.github.com/) in PowerShell (the shell I still use most often - and the [GitHub CLI docs](https://cli.github.com/manual/gh_completion) only mention `bash` and `zsh`).

In my $profile file I added this line, so to edit my PowerShell profile I execute `code $profile` and then:

```powershell
Invoke-Expression -Command $(gh completion -s powershell | Out-String)
```

## Windows Subsystem for Linux (WSL) environment

Install: <https://docs.microsoft.com/en-us/windows/wsl/install-win10>

I found some really handy notes here: <https://jwendl.net/code-notes/wsl/install/>

As always, Scott Hanselman has the low-down to end all low-downs:

- [Cool tips & tricks for WSL](https://www.hanselman.com/blog/CoolWSLWindowsSubsystemForLinuxTipsAndTricksYouOrIDidntKnowWerePossible.aspx)
- [Shiny Linux Dev Environment](https://www.hanselman.com/blog/SettingUpAShinyDevelopmentEnvironmentWithinLinuxOnWindows10.aspx)
- [How to make a pretty prompt in Windows Terminal](https://www.hanselman.com/blog/HowToMakeAPrettyPromptInWindowsTerminalWithPowerlineNerdFontsCascadiaCodeWSLAndOhmyposh.aspx)


!!! info
    See my page on [Scoop & Co.](../misc/scoop.md) for how to quickly and easily install `Delugia Nerd Font` mentioned in Scott's pretty prompt post above

## Free Resources for Publishing

[Unsplash](https://unsplash.com/)
The internet’s source of freely usable images.
Powered by creators everywhere.

![Photo by Zoe Schaeffer on Unsplash](media/zoe-schaeffer-r2SY2zsBmgM-unsplash.jpg)

> Photo by [Zoe Schaeffer](https://unsplash.com/@dirtjoy)