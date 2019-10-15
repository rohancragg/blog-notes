# How to Create a TLS Secret

I followed the command-line method (the first method) explained in this article [Creating Kubernetes Secrets Using TLS/SSL as an Example](https://shocksolution.com/2018/12/14/creating-kubernetes-secrets-using-tls-ssl-as-an-example/) - i.e. rather than using the second (YAML file) method.

In order to do this I needed two files in the correct format.

There are multiple formats that certificate and associated key files can be in (they can even be combined into a single file). In order to create a Kubernetes TLS secret I needed to ascertain the right ones to use.

I was provided with a `.pks` file and needed to work out how to generate the correct artifacts from it. All I knew from the above article was that I needed a `.crt` and a `.key` file and at first I wasn't sure what these were.

## What are we trying to achieve?

I needed obtain a TLS certificate and create a TLS Secret object in Kubernetes so that an Ingress resource could refer to the Secret in order that the certificate presented by the NGINX Ingress would look like this when visiting the associated Service in a web browser:

![Image](media/cert-path.png?raw=true)

_(i.e. the TLS/HTTPS certificate should include the CA chain.)_

## Getting the right files

To get an encrypted private key:
> openssl pkcs12 -in domain.pfx -nocerts -out domain.enc.key

To get an un-encrypted private key file
> openssl rsa -in domain.enc.key -outform PEM -out domain.key

_**Note:** be sure to delete this file once uploaded to the cluster so that you don't have an un-encrypted secret on your local machine_

To get the certificate file

> openssl pkcs12 -in domain.pfx -nodes -nokeys -nomac -out domain.crt

The **domain.crt** file looks like this

![Image](media/domain.crt.png?raw=true)

In my case it contains the full CA chain and so, in my case, there are three certificates each enclosed in `BEGIN CERTIFICATE` and `END CERTIFICATE` delimiters:

```console
-----BEGIN CERTIFICATE-----
################################################################
################################################################
-----END CERTIFICATE-----
```

## Creating the TLS Secret in Kubernetes

Create Kubernetes TLS Secret:

> kubectl create secret tls tlscert --key="tls.key" --cert="tls.crt"

---

## Additional Notes

### How to validate a key

_This works for both encrypted or un-encrypted keys_:

> openssl rsa -check -in domain.enc.key

or

> openssl rsa -check -in domain.key

You should see the message 'RSA key ok':

```console
$ openssl rsa -check -in domain.enc.key
Enter pass phrase for domain.enc.pem:
RSA key ok
writing RSA key
-----BEGIN RSA PRIVATE KEY-----
################################################################
################################################################
```

### Where did my PKS file come from?

I was provided with a `.pks` ( `PKCS#12` ) file which had been created with the following command

> openssl pkcs12 -export -out domain.pfx -inkey domain.rsa -in domain.cer -certfile CAbundle.txt

Where:

- domain.cer is the client certificate (i.e. without the Certification Authority (CA) chain )
- domain.rsa is an un-encrypted version of the private key
- CAbundle.txt contains the CA certificates to append to create the CA chain

**domain.cer** looks like this

![Image](media/domain.cer.png?raw=true)

As you can see if contains just a single certificate

**domain.rsa** looks like this

![Image](media/domain.rsa.png?raw=true)

### How to get the client certificate (without the full CA chain)

> openssl pkcs12 -in domain.pfx -clcerts -nokeys -out domain.cer

---
Some of the steps in this article are based on [How to convert a PFX to a seperate .key/.crt file](https://www.markbrilman.nl/2011/08/howto-convert-a-pfx-to-a-seperate-key-crt-file/) - by Mark Brilman

I also referred to the [OpenSSL PKCS12 man pages](https://www.openssl.org/docs/manmaster/man1/openssl-pkcs12.html)

And to [OpenSSL Essentials: Working with SSL Certificates, Private Keys and CSRs](https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs#convert-certificate-formats)
