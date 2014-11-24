#!/bin/bash

USER=ola
KEY=~/.ssh/gatekeeper

ssh -i $KEY $USER@gatekeeper.nntb.no \
 -L 2000:plc.simula.nornet:443 \
 -L 2001:monitor.simula.nornet:80
