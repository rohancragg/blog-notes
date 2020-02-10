---
title: Clusters of Domains
summary: Designing domains and DNS for AKS Clusters
authors:
    - Rohan Cragg
date: 2020-02-04
---

# Clusters of Domains - designing domains and DNS for AKS


While the [documentation on `Azure DNS`] (https://docs.microsoft.com/en-us/azure/dns/) (at the time of writing in early 2020)) covers the essentials of what you need to know I personally found it somewhat dry in that it assumed that you knew what you wanted to do with Zones and records and mostly explained how to do it.

I was finding it initially difficult synthesise and apply the pieces of information and there was a lack of something to place it all into a real-world solution-design context.

Initially I felt like I was going round in circles simply trying to get a design to occur to me by simply reading the documentation.

The break-through came when starting to implement something (I simply didnt know where I was going before I set off - no compass, no map). I registered a cheap domain I could use for testing for sake of this article I'll use the name `contosoapps.xyz`).

For example, how should I use Zones and records in combination with Kubernetes Ingress Controllers and Resources to expose a suite of web applications or microservices and their APIs to the public internet whilst supporting a 'route to live' set of environments into which to deploy these artefacts so that they can be tested while they are under development.

In other words how can I efficiently use domain names to support Develeopment, Testing, and Staging Environments? Do I need a separate domain name for each Environment? Do I need to have a separate Kubernetes cluster for each or can I combine domain names and one or more clusters in any combination?

I hope to answer the above questions.

!!! note
    While my original design conundrum arose in how to use a domain name with one or more AKS clusters, this article will contain information relavant to using domain names with Azure Resources generally

## If at first you don't succeed - Play!

The journey began while I was trying to grok the `external-dns` project. This is can be installed into a cluster and it watches deployments for any that require DNS records to be created or updated and it manages records in an associated Azure DNS Zone resource.

Since I didn't have a custom domain name I could use I attempted to use the Azure-assigned fully qualified domain name (FQDN). Any AKS cluster into which a Service of type `LoadBalancer` has been deployed will have a Public IP resource deployed into the cluster-managed Resource Group. Any Azure Public IP (PIP) resource can optionally have a DNS name label applied which will then mean that this address will resolve to the IP address.

!!! info
    The documentation states it best:
    *"You can specify a DNS domain name label for a public IP resource, which creates a mapping for domainnamelabel.location.cloudapp.azure.com to the public IP address in the Azure-managed DNS servers"* \
    from: [IP address types and allocation methods in Azure > DNS hostname resolution](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-ip-addresses-overview-arm)

So, in my case, given that adding a name label of `contosoapps` to my PIP I wondered if I could use `external-dns` to manage records for Ingess resources in my cluster, where the FQDN is therefore `contosoapps.westeurope.cloudapp.azure.com`.

The [Microsoft documentation](https://docs.microsoft.com/en-us/azure/aks/http-application-routing) covering `externals-dns` only applies to a cluster where the HTTP application routing add-on has been enabled and given that this add-on is not recommended for production use I wanted to avoiding this add-on.

!!! info
    The HTTP application routing add-on automatically creates a DNS Zone for you and creates two controllers inside the cluster (an Ingress controller and External-DNS controller) and I wanted to understand how to deploy and manage these components properly without it happening 'auto-magically'!

Eventually I was able to piece together the elements of a solution from [this page](https://github.com/JasonvanBrackel/kubernetes-external-dns-in-rancher) (albeit not using Rancher in my case).

Once this was working I was able to host multiple services, each with an Ingress based on the FQDN. So, for example, the `demo-nginx` app could be reached with the URL `demo-nqinx.contosoapps.westeurope.cloudapp.azure.com`.

| Application Name  |  FQDN |
|---|---|
|  demo-nginx |  demo-nqinx.contosoapps.westeurope.cloudapp.azure.com |
|  demo-aspdotnet | demo-aspdotnet.contosoapps.westeurope.cloudapp.azure.com  | 

But what if I also want to support multiple deployment environments?

| Application Name  |   Environment  |  URL |
|---|---|---|
|  demo-nginx | Development  |  *demo-nqinx.**dev**.contosoapps.westeurope.cloudapp.azure.com*\*  |
|  demo-nginx | Staging |  *demo-nqinx.**test**.contosoapps.westeurope.cloudapp.azure.com*\* |
|  demo-nginx | Production | demo-nqinx<span></span>.contosoapps.westeurope.cloudapp.azure.com |

Unfortunately those URLs marked with \* indicate that we cannot do this. Possible variations of the above that I considered were:

- demo-nqinx.**dev**...
- **dev**.demo-nqinx...
- **dev**-demo-nqinx...

I could not find this documented anywhere but it seems that name labels on Public IP Addresses only support a single label and so we cannot use FQDNS with aything other than 6-part names. In the first two examples above I'm trying to use 7-part names and in the third example I would need more than one name label on the IP address - one for each environment.

!!! note
    In Progress - the plan is to flesh this out a bit more: https://jwendl.net/code-notes/azure/network/