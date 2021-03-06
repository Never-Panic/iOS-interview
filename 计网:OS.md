# 计算机网络

- UDP不可靠的原因：UDP只有一个接受缓冲区，没有发送缓冲区，即只要有数据就发，不管对方是否可以正确接受。而在对方的接受缓冲区满了之后，新来的数据报无法进入到接受缓冲区，此数据报就会被丢弃，并且UDP是没有流量控制的，故UDP的数据传输是不可靠的。

---

## HTTP

- HTTP：超文本传输协议，是一个基于**请求与响应**，**无状态的**，应用层的协议，常基于TCP/IP协议传输数据，互联网上应用最为广泛的一种网络协议，所有的WWW文件都必须遵守这个标准。设计HTTP的初衷是为了提供一种发布和接收HTML页面的方法。

- HTTP针对无状态的一些解决策略：

  1. 通过Cookie/Session技术
  2. HTTP/1.1持久连接（HTTP keep-alive）方法，只要任意一端没有明确提出断开连接，则保持TCP连接状态，在请求首部字段中的Connection: keep-alive即为表明使用了持久连接

- HTTP 2.0相比1.0的重大改进

  - **多路复用**：通过单一的HTTP/2连接请求发起多重的请求-响应消息，多个请求stream**共享一个TCP连接**，实现多路并行而**不是依赖建立多个TCP连接**。

    <img src="https://pic2.zhimg.com/80/b1e608ddb7493608efea3e76912aabe1_1440w.jpg?source=1940ef5c" alt="多路复用" style="zoom: 40%;" />

  - 相比于 HTTP/1.X 的文本（字符串）传送， HTTP/2.0 采用**二进制传送**。

  - HTTP/2.0 **头部压缩**。HTTP/2.0 通过 gzip 和 compress 压缩头部然后再发送，同时通信双方会维护一张头信息表，所有字段都记录在这张表中，在每次 HTTP 传输时只需要传头字段在表中的索引即可，大大减小了重传次数和数据量。

  - HTTP/2.0 支持**服务器推送**。 服务器在客户端未经请求许可的情况下，可预先向客户端推送需要的内容，客户端在退出服务时可通过发送复位相关的请求来取消服务端的推送。

- QUIC（Quick UDP Internet Connections）：快速 UDP 网络连接，是一种基于UDP的低延时传输协议。具有以下特点：

  1. 低延迟连接
  2. 多路复用
  3. 报文是经过加密和认证的
  4. 具有向前纠错机制，每个数据包携带了除了本身内容外的部分其他数据包的内容，使得在出现少量丢包的情况下，尽量地减少其它包的重传次数。

- HTTP/3：HTTP/3 是在 QUIC 基础上发展起来的，其底层使用 UDP 进行数据传输，上层仍然使用 HTTP/2。在 UDP 与 HTTP/2 之间存在一个 QUIC 层，其中 TLS 加密过程在该层进行处理。特点：

  1. 使用 UDP 作为传输层进行通信；
  2.  在 UDP 之上的 QUIC 协议保证了 HTTP/3 的安全性。QUIC 在建立连接的过程中就**完成了 TLS 加密握手**；
  3. 建立连接快，正常只需要 1 RTT 即可建立连接。如果有缓存之前的会话信息，则直接验证和建立连接，此过程 0 RTT。建立连接时，也可以带有少量业务数据；

- HTTPS：HTTPS是一种通过计算机网络进行安全通信的传输协议，经由HTTP进行通信，利用SSL/TLS建立全信道，加密数据包。

> TLS是**传输层加密协议**，前身是SSL协议，由网景公司1995年发布，有时候两者不区分。

- HTTPS配置过程

> **对称加密**：加密的密钥和解密的密钥相同。
>
> **非对称加密**：非对称加密将密钥分为**公钥和私钥**，公钥可以公开，私钥需要保密，客户端公钥加密的数据，服务端可以通过私钥来解密。

![https](https://images2017.cnblogs.com/blog/1260476/201711/1260476-20171116160813812-635766483.png)

- DNS over HTTPS：使用HTTPS为DNS服务加密。使用443端口。

# 操作系统
