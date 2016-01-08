# proxy.sh

Shell script to set proxy for various programs.

## Usage

```bash
sh proxy.sh <proxy> <exception>
```

## Copmarision to setting env variables HTTP_PROXY and HTTPS_PROXY

### Benefits

- Single script run and everything works
- You don't need to restart all the programs to reread env variables, when you unhibernate your machine and there is no proxy in the network
- If you need to clone some repo whihc is accessible not through proxy, you don't need to unreset proxy like this `git clone --config "http.proxy="` and then reset proxy inside repo

### Drawbacks

- You may need to set proxy for new programs

## TODO


- [x] Use `git config include.path` to unclobber `~/.gitconfig`
- [ ] Evaulate alternatives
  - [ ] http://cntlm.sourceforge.net/
  - [ ] [Microsoft Firewall Client for ISA Server](https://www.microsoft.com/en-us/download/details.aspx?id=10193)
- [ ] Add unproxy.sh
