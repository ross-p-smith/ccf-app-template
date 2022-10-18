#!/bin/bash
set -euo pipefail

declare CCF_DIR=CCF

git clone --depth 1 https://github.com/microsoft/CCF.git ${CCF_DIR} || git -C ${CCF_DIR} pull

./${CCF_DIR}/getting_started/setup_vm/run.sh ./${CCF_DIR}/getting_started/setup_vm/app-dev.yml

CCF_VERSION=$(curl -ILs -o /dev/null -w %{url_effective} https://github.com/microsoft/CCF/releases/latest | sed 's/^.*ccf-//')
wget https://github.com/microsoft/CCF/releases/download/ccf-${CCF_VERSION}/ccf_${CCF_VERSION}_amd64.deb
