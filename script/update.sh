#!/bin/bash
curl -v -X POST http://localhost/prometheus/-/reload
curl -v -X POST http://localhost/alertmanager/-/reload