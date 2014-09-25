#!/bin/bash

set -e

sh boostrack-debian-base/build.sh ./boostrack-debian-base/
sh boostrack-debian-java8-runtime/build.sh ./boostrack-debian-java8-runtime/

