#!/bin/bash
api_normal() {
  curl -s "http://localhost:8080/api/normal"
}
api_memory() {
  curl -s "http://localhost:8080/api/memory"
}
api_delay() {
  local delay=$(((RANDOM % 500) + 10))
  curl -s "http://localhost:8080/api/downstream?delay=${delay}"
}
api_error() {
  curl -s "http://localhost:8080/api/error"
}