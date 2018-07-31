#!/usr/bin/env bash

#typically used with the following:
#   sudo ./run_with_limits.sh --rm -i -t -v /home/thomas/git/ghc_docker_home:/home/ghc 3aed6db7e935 /bin/bash

#2 ^ 20
TMP_SPACE_LIMIT=1048576k

#note that swap is (--memory-swap MINUS --memory)
#so --memory-swap=4g and --memory=1g means 3g of actual swap space
docker run --memory=1g \
    --memory-swap=4g \
    --cpus=1 \
    --cpuset-cpus=0 \
    --tmpfs /tmp:rw,noexec,nosuid,nodev,size="$TMP_SPACE_LIMIT" \
    "$@"
