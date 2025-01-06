---
layout: page
title: Zangetsu - A QUIC-based VPN
description: A simple QUIC-based VPN implemented in Python.
img: assets/img/ZangetsuVPN_Thumbnail.png
importance: 2
category: Projects
giscus_comments: false
---

<div style="text-align: justify"> 
This project was completed as part of the course <strong> ECE6612: Computer Network Security</strong>, offered during the <strong> Fall 2023</strong> semester at Georgia Institute of Technology. <br/><br/>

<strong>Abstract:</strong> The essence of censorship circumvention is encryption protocols providing data confidentiality, integrity, and authenticity. Many governmental, ISP, and other entities employ shallow and deep packet inspection to detect such traffic. Virtual Private Network (VPNs) proxies have become indispensable for safeguarding sensitive data and ensuring secure communication over any public or private network. However, many popular VPN protocols (namely IPSec, OpenVPN, and Wireguard) have distinct headers, making throttling and/or outright blocking easy by censoring entities. QUIC (Quick UDP Internet Connection) is a protocol devised by Google to achieve decreased latency by bundling various layers and utilizing multiple streams over UDP. It is the transport layer protocol of the new HTTP/3 standard and has built-in congestion control and packet loss remediation. In this paper, we implement a VPN proxy utilizing QUIC to mask all data as normal web traffic and reduce connection latency. We found QUIC to be a very effective protocol to use for proxies. QUIC had the best download bandwidth, second best upload bandwidth, average ping latencies around the world, and second best connection setup (handshake) latency, with the potential for “0 RTT” handshakes to further reduce the time. Built with security in mind (and for the purpose of HTTPS/3 and TLS 1.3), we also found that the encryption standards used in QUIC are very secure in comparison to the other VPN protocols. Tunneling over QUIC increases potential collateral damage should censoring entities wish to block or throttle it, furthering utility in evading censorship. Based on our observed speeds, obfuscation properties, security-oriented, and novel “future-proof” protocol design, we believe that a QUIC-based VPN can be a way forward to enforce data privacy in censored environments.
</div><br/>

Check out this <a href="../../assets/img/QUIC_VPN.pdf" target="_blank">document</a> for a detailed report.