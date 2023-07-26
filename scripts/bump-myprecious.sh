#!/bin/bash

NEW_VERSION=$(grep -E "^version" charts/other/myprecious/Chart.yaml |sed -r 's/(version: )([0-9]+)\.([0-9]+)\.([0-9]+)(.*)/echo version: \2.\3.$((\4+1))-pre-01/ge')
sed -iE "s/^version:.*/${NEW_VERSION}/g" charts/other/myprecious/Chart.yaml


