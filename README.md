
https://haruska.com/til/cloudflare-tunnels-as-a-reverse-proxy
https://dev.to/gordinmitya/self-hosting-nowadays-is-easier-than-never-before-55ec
https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/do-more-with-tunnels/local-management/configuration-file/

https://docs.docker.com/reference/compose-file/secrets/

https://docs.docker.com/compose/how-tos/use-secrets/

https://getsops.io/docs/usage/advanced/#passing-secrets-to-other-processes

```
./up.sh
docker compose ls
docker compose down caddy
```

The purpose is to use docker compose as a service manager and also a build system. Reason? Probably simplicity and uniformity.

```
lyn-discord
 -> compose.yaml
    prod.sops.env
    data/

website
 -> compose.yaml
    data/

...
```

TODO We want to enable branch protection on master (execs are able to just push) and use CODEOWNERS to force certain folders to require PR approval by execs (like lyn-discord).
