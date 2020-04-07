A brain-dump of things I find on a daily basis...

## April 2020

### Kubeval

[Kubeval](https://kubeval.instrumenta.dev/) can be used to validate Kubernetes configuration files and Helm charts (e.g. for catching resource namespaces changes when there's a new Kubernetes version).

To install to windows using [Scoop](/misc/scoop)

```powershell
scoop bucket add instrumenta https://github.com/instrumenta/bucket-instrumenta
scoop install kubeval
```