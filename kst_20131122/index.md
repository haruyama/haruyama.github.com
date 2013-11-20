% KST 20131122: Recent Topics of Practical Cryptography
% HARUYAMA Seigo([@haruyama](https://twitter.com/haruyama))

# A roster of TLS cipher suites weaknesses

[Google Online Security Blog: A roster of TLS cipher suites weaknesses](http://googleonlinesecurity.blogspot.jp/2013/11/a-roster-of-tls-cipher-suites-weaknesses.html)

# RC4

> The best, known attack against using RC4 with HTTPS involves causing a browser to transmit many HTTP requests -- each with the same cookie -- and exploiting known biases in RC4 to build an increasingly precise probability distribution for each byte in a cookie. However, the attack needs to see on the order of 10 billion copies of the cookie in order to make a good guess. This involves the browser sending ~7TB of data. In ideal situations, this requires nearly three months to complete.

> This attack cannot be mitigated without replacing RC4.

# AES-CBC

> AES-CBC has a couple of problems, both of which are problems with the way that TLS uses CBC (Cipher Block Chaining) mode, and not problems with AES.

Known Attacks:

* [BEAST](http://vnhacker.blogspot.jp/2011/09/beast.html)
* [Lucky 13](http://www.isg.rhul.ac.uk/tls/Lucky13.html)

# AES-GCM 

> There are no known breaks of AES-GCM and it is one of the ciphers that TLS servers are urged to support. However it suffers from a couple of practical issues:

> The first is that it’s very challenging to implement AES-GCM in software in a way which is both fast and secure.

> The second nit with AES-GCM is that, as integrated in TLS, implementations are free to use a random nonce value. However, the size of this nonce (8 bytes) is too small to safely support using this mode.

# AES-GCM Implementation of OpenSSH 6.2 and 6.3 have a vulnerability.

[OpenSSH Security Advisory: gcmrekey.adv](http://openssh.org/txt/gcmrekey.adv)

> A memory corruption vulnerability exists in the post-authentication sshd process when an AES-GCM cipher (aes128-gcm@openssh.com or aes256-gcm@openssh.com) is selected during kex exchange. 

# ChaCha20-Poly1305

> This cipher also has no known breaks but is designed to facilitate fast and secure software implementations. ... Even when AES-GCM hardware is provided, ChaCha20-Poly1305 is currently within a factor of two in speed.

[ImperialViolet - ChaCha20 and Poly1305 for TLS](https://www.imperialviolet.org/2013/10/07/chacha20.html)

>Google servers and Chrome will soon be supporting cipher suites based around ChaCha20 and Poly1305.

[chacha20+poly1305 authenticated encryption](https://lists.mindrot.org/pipermail/openssh-unix-dev/2013-November/031820.html)

OpenSSH will be supporting chacha20-poly1305@openssh.com.

# ChaCha20-Poly1305 (cont.)

ChaCha20 is a stream cipher designed by D. J. Bernstein (DJB).

Poly1305 also by DJB is a one-time Carter-Wegman MAC.

DJB rulez!

# TLS CipherSuites

* [自堕落な技術者の日記 : JRE 1.4-1.6やAndroidのAPIを使ったHTTPS接続のCipherSuitesがRC4-MD5を優先しているかなりヤバい話 - livedoor Blog（ブログ）](http://blog.livedoor.jp/k_urushima/archives/1727793.html)
* [Qualys SSL Labs - Projects / SSL Server Test / s10.kabu.co.jp](https://www.ssllabs.com/ssltest/analyze.html?d=s10.kabu.co.jp)
    * only support TLS_RSA_WITH_3DES_EDE_CBC_SHA ! No Forward Secrecy.
* [Qualys SSL Labs - Projects / SSL Server Test / fp.mixi.co.jp](https://www.ssllabs.com/ssltest/analyze.html?d=fp.mixi.co.jp)
    * support WEAK ciphers. No Forward Secrecy.

* Forward Secrecy: [「PFS」とは：ITpro](http://itpro.nikkeibp.co.jp/word/page/10004958/)
