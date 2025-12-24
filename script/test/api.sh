#!/bin/bash
request() {
  curl -s "http://localhost:8080/api/$1"
}
api_normal() {
  request "normal"
}
api_memory() {
  request "memory"
}
api_delay() {
  local delay=$(((RANDOM % 500) + 10))
  request "downstream?delay=${delay}"
}
api_error() {
  request "error"
}
