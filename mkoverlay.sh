#!/usr/bin/env bash

mkdir build

set -eux

dpkg-deb --root-owner-group --build --nocheck overlay
mv overlay.deb ./build/
