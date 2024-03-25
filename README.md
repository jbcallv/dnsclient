Go package that implements a variety of DNS clients, including DNS-over-TLS and
DNS-over-HTTPs.

# Go version
* must install go version 1.21.6
* on linux:
1. `which go`
2. `rm -rf` {output from above command}
3. `curl -OL https://golang.org/dl/go1.21.6.linux-amd64.tar.gz`
4. `sudo tar -C /usr/local -xvf go1.21.6.linux-amd64.tar.gz`
5. `sudo nvim ~/.profile`
6. add this to the bottom of your profile file: `export PATH=$PATH:/usr/local/go/bin`
7. save the file
8. `source ~/.profile`
9. `go version`
10. Ensure output is `1.21.6`
