#!/usr/bin/env bash
PABOT_PARALLEL_WORKER=$1
pabot --processes $PABOT_PARALLEL_WORKER -x pabot-api-xunit.xml --outputdir results tests