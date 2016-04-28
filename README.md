# proxy.sh

Shell script to set proxy for various programs.

## Usage

```bash
sh proxy.sh <proxy> <exception>
```

Or you can set env vars HTTP_PROXY and HTTP_PROXY_EXCEPTION and run

```bash
sh proxy.sh
```

There is also file `.env.example` and you can copy it to `.env` and set your config. Then you can use https://github.com/kennethreitz/autoenv to automatically source env variables from `.env` file whenever you cd to directory.


## Copmarision to setting env variables HTTP_PROXY and HTTPS_PROXY

### Pros

- Single script run and everything works
- You don't need to restart all the programs to reread env variables, when you unhibernate your machine and there is no proxy in the network
- If you need to clone some repo which is accessible not through proxy, you don't need to unreset proxy like this `git clone --config "http.proxy="` and then reset proxy inside repo
- You can have exceptions for git and bower

### Cons

- You may need to set proxy for new programs

## TODO


- [x] Use `git config include.path` to unclobber `~/.gitconfig`
- [ ] Evaulate alternatives
  - [ ] http://cntlm.sourceforge.net/
  - [ ] [Microsoft Firewall Client for ISA Server](https://www.microsoft.com/en-us/download/details.aspx?id=10193)
- [ ] Add unproxy.sh
