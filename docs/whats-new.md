---
title: What's New
hero: A brain-dump of things I find on a daily basis...
description: A brain-dump of things I find on a daily basis...
authors:
    - Rohan Cragg
date: 2020-04-07
og_image: https://zeplin.io/static/img/imgExportDesignsInOneClick.png
og_image_type: image/png
---

## 2021–2026

It's been quite a while since I updated this page. I haven't stopped learning, I've just been rather bad at writing it down!

Much of my work over the last few years has moved further into **cloud architecture, platform engineering, DevOps, security and, increasingly, AI engineering**.

Some of the things I've been working with and learning about:

### Azure architecture and hybrid integration

A lot of my work has involved designing secure [Microsoft Azure](https://azure.microsoft.com/) and hybrid architectures, particularly where modern cloud services have to coexist with rather less modern on-premises systems.

That has included [Azure API Management (APIM)](https://learn.microsoft.com/azure/api-management/), [Application Gateway](https://learn.microsoft.com/azure/application-gateway/), [Azure Firewall](https://learn.microsoft.com/azure/firewall/), [Virtual Networks](https://learn.microsoft.com/azure/virtual-network/), [Private Link](https://learn.microsoft.com/azure/private-link/), VPN/ExpressRoute connectivity and hybrid API patterns.

One particularly interesting area has been integrating Azure services with legacy Windows-authenticated APIs, which led me fairly deep into [Kerberos](https://learn.microsoft.com/windows-server/security/kerberos/kerberos-authentication-overview), NTLM, SPNs, constrained delegation, mTLS, IIS, reverse proxies and [APIM self-hosted gateways](https://learn.microsoft.com/azure/api-management/self-hosted-gateway-overview).

### Kubernetes, containers and Semarchy

I've spent a considerable amount of time working with [Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/), [Kubernetes](https://kubernetes.io/docs/home/) and containerised applications, including infrastructure, monitoring, troubleshooting and operational support for [Semarchy xDM](https://www.semarchy.com/doc/).

More recently this has included designing safer application-upgrade processes, analysing breaking changes between Semarchy releases, improving operational runbooks and looking at ways Kubernetes workloads can automatically recover from application-level failures that aren't detected by ordinary container health checks.

I've also been following Semarchy's evolution from xDM towards the broader [Semarchy Data Platform](https://docs.semarchy.com/saas), and considering what that means for existing self-hosted deployments and future migration.

### Terraform and Infrastructure as Code

[Terraform](https://developer.hashicorp.com/terraform) has become an increasingly large part of my day-to-day work, from Azure infrastructure design through to [HCP Terraform](https://developer.hashicorp.com/terraform/cloud-docs), state and workspace strategy, and CI/CD.

I've also been thinking quite a bit about how application and infrastructure delivery should fit together: moving away from long-lived environment branches towards a protected `main` branch, immutable application artefacts and controlled promotion through environments, while independently planning Terraform changes against each environment's state.

As a decidedly Windows-based developer, I've also accumulated my fair share of knowledge about Terraform's interactions with [PowerShell](https://learn.microsoft.com/powershell/) and local development tooling, as well as experimenting with the [Terraform MCP server](https://github.com/hashicorp/terraform-mcp-server) and running it without Docker.

### AI, agents and Microsoft Copilot

Unsurprisingly, **generative AI and agents** have become a major area of interest.

I've been exploring the rapidly evolving Microsoft agent ecosystem, including [Microsoft 365 Copilot](https://learn.microsoft.com/copilot/microsoft-365/), [Microsoft Copilot Studio](https://learn.microsoft.com/microsoft-copilot-studio/), [Microsoft Foundry](https://learn.microsoft.com/azure/ai-foundry/), Foundry Agent Service, Foundry AI Gateway and the [Model Context Protocol (MCP)](https://modelcontextprotocol.io/).

I've also been looking at the distinction between [declarative agents](https://learn.microsoft.com/microsoft-365-copilot/extensibility/overview-declarative-agent) and [custom engine agents](https://learn.microsoft.com/microsoft-365-copilot/extensibility/overview-custom-engine-agent), and how the different approaches fit into Microsoft 365 and Azure architectures.

A recurring architectural question has been how to combine agentic AI with the security controls expected in enterprise environments, particularly private networking, API governance and controlled access to sensitive data.

I've also worked on the infrastructure and security architecture for more specialised AI systems involving **multimodal Retrieval-Augmented Generation (RAG)** and **multi-agent orchestration**, with a strong emphasis on private networking, infrastructure as code, automated delivery and security by design.

### GitHub Copilot and AI-assisted engineering

More recently I've been doing quite a bit with [GitHub Copilot](https://github.com/features/copilot) and [GitHub Enterprise Cloud](https://docs.github.com/en/enterprise-cloud), and the question of how organisations move from individual experimentation with coding assistants to properly governed, enterprise-wide AI-assisted development been experimenting with the rapidly expanding ecosystem around coding agents and MCP: giving agents useful tooling while restricting what they can do, reducing unnecessary terminal context, and making useful engineering knowledge and skills available consistently across development teams.

The interesting part for me is increasingly not just *using* an AI coding assistant, but thinking about how these tools should be **governed, extended and integrated into real enterprise software-development environments**.

### Still learning

The common thread through all of this has probably been a gradual shift from primarily **building applications** towards **designing the platforms, delivery processes, security boundaries and engineering practices that applications and engineering teams depend upon**.

And lately that's come full circle: AI coding agents mean I'm spending more time thinking about developer tooling and code again, while still drawing heavily on the cloud, infrastructure, security and DevOps experience accumulated along the way.

So perhaps it's time I started updating this page again.

## Apr 2021

Embarrassed that I keep having to DuckDuckGo this but found a really good simple explanation: [How to update a forked repo from an upstream with git rebase (or merge)](https://timonweb.com/misc/how-to-update-a-forked-repo-from-an-upstream-with-git-rebase-or-merge/). Another useful guide covers [keeping a downstream Git repository current with upstream changes](https://medium.com/sweetmeat/how-to-keep-a-downstream-git-repository-current-with-upstream-repository-changes-10b76fad6d97).

## Aug 2020

### Recent Listening

I just rediscovered across this Dub album that was in my collection as a teenager:

<!-- markdownlint-disable-next-line MD033 -->
<iframe style="border: 0; width: 100%; height: 120px;" src="https://bandcamp.com/EmbeddedPlayer/album=2099528426/size=large/bgcol=333333/linkcol=9a64ff/tracklist=false/artwork=small/transparent=true/" seamless><a href="http://dubsyndicate.bandcamp.com/album/tunes-from-the-missing-channel">Tunes From The Missing Channel by Dub Syndicate</a></iframe>

## May 2020

I just discovered [Azure Static Web Apps](https://docs.microsoft.com/en-gb/azure/static-web-apps/overview) - this might well prompt me to migrate away from using GitHub Pages for publishing this site...

Still trying to catch up on some of the news from Microsoft Build 2020

- [Microsoft Build](https://mybuild.microsoft.com/)
- [Build 2020 recordings](https://channel9.msdn.com/Events/Build/2020)
- [Microsoft Developer on YouTube](https://youtube.com/c/microsoftdeveloper)

There was some good coverage from [Ars Technica on Microsoft's open-source announcements at Build 2020](https://arstechnica.com/gadgets/2020/05/microsofts-romance-with-open-source-software-on-display-at-build-2020/).

In terms of training and learning I found that I'd happily already completed 100% on the [Build Cloud Skills Challenge - Azure DevOps](https://docs.microsoft.com/en-us/users/buildcloudskillschallenge/collections/60j5u7og741dgd). I really need to crack on and re-book an online proctored exam for [Exam AZ-400 - Designing and Implementing Microsoft DevOps Solutions](https://docs.microsoft.com/en-gb/learn/certifications/exams/az-400) to finally gain my [https://docs.microsoft.com/en-gb/learn/certifications/devops-engineer](https://docs.microsoft.com/en-gb/learn/certifications/devops-engineer).

A [free exam voucher](https://docs.microsoft.com/en-us/learn/certifications/microsoft-build-cloud-skills-challenge-2020-free-certification-exam-offer) is available for redemption starting June 8, 2020 and is valid until January 31, 2021

My colleague @twitter:d0ugs mode some notes that have prompted me to go back and watch this [Building Azure Apps using the Common Data Service](https://www.youtube.com/watch?v=8My4Nh2MUEo)

Also announced into public preview - [Azure Synapse Analytics](https://docs.microsoft.com/en-us/azure/synapse-analytics/overview-what-is) is the 'Data Lakehouse' we've all (apparently) been waiting for: [watch the Synapse overview](https://youtu.be/HvEi13pWNps) - it's an all-in-one studio for everything Data

## April 2020

### Reading

#### How to Work from Home

I've promised myself that [I'm going to read this today...](https://haacked.com/archive/2020/03/03/how-to-work-from-home/)
> Did a global pandemic spur your bosses to allow you to work from home? Here's a guide to working from home effectively for those who are just starting out.

From Scott Hanselman - [Take Remote Worker/Educator webcam video calls to the next level with OBS, NDI Tools, and Elgato Stream Deck](https://www.hanselman.com/blog/TakeRemoteWorkerEducatorWebcamVideoCallsToTheNextLevelWithOBSNDIToolsAndElgatoStreamDeck.aspx)

### Tools

#### Kubeval

[Kubeval](https://kubeval.instrumenta.dev/) can be used to validate Kubernetes configuration files and Helm charts (e.g. for catching resource namespaces changes when there's a new Kubernetes version).

To install to windows using [Scoop](misc/scoop.md)

```powershell
scoop bucket add instrumenta https://github.com/instrumenta/bucket-instrumenta
scoop install kubeval
```

#### Zeplin

[Zeplin](https://zeplin.io/why-zeplin) is a tool for 'curating designs in the cloud' as a team. Share, organize and collaborate on designs 'built with developers in mind'.

![Zeplin](https://zeplin.io/static/img/imgExportDesignsInOneClick.png)

#### Career Tools

My pal [Martin Short](https://mashort.github.io/) shared this with me this week:

[10 Extraordinary GitHub Repos for All Developers](https://medium.com/better-programming/10-extraordinary-github-repos-for-all-developers-939cdeb28ad0)

I particularly like, and need to go back to the [System Design Primer](https://github.com/donnemartin/system-design-primer).

#### Dependabot

![Dependabot logo](https://avatars3.githubusercontent.com/u/27347476?s=200&v=4)

Add [Dependabot](https://dependabot.com/) to your repo for automated dependency updates. it checks your dependency files for outdated requirements and opens individual PRs for any it finds. [This repo](https://github.com/dependabot/demo) contains some projects with outdated dependencies. Fork it to try out Dependabot!

### Downtime

While I'm working from home, I'm drinking lots more coffee so I've gone with this!:
> [SEASONAL SUBSCRIPTION — Fortitude Coffee](https://www.fortitudecoffee.com/subscriptions/seasonalweekly)
> One 250g bag of our seasonal coffee choice delivered to your door every week.
