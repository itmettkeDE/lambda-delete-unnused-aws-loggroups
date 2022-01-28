#!/usr/bin/env bash
set -e

cross build --release --target x86_64-unknown-linux-musl "${@}"
strip "./target/x86_64-unknown-linux-musl/release/lambda-delete-unnused-aws-loggroups"
cp "./target/x86_64-unknown-linux-musl/release/lambda-delete-unnused-aws-loggroups" ./target/x86_64-unknown-linux-musl/release/bootstrap 
zip -r9 -j "./lambda-delete-unnused-aws-loggroups.zip" ./target/x86_64-unknown-linux-musl/release/bootstrap
