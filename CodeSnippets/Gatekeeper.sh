#!/bin/bash

USER=ola                # <- The username for the Gatekeeper server
KEY=~/.ssh/gatekeeper   # <- The private key file for authentication

ssh -i ${KEY} ${USER}@gatekeeper.nntb.no \
 -L 2000:plc.simula.nornet:443 \
 -L 2001:monitor.simula.nornet:80 \
 -L 2002:perfmon1.simula.nornet:80
