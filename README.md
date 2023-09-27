# erlang-mirrord-bug-repro
Minimal example of a mirrord erlang bug https://github.com/metalbear-co/mirrord/issues/1967


We get different results with and without mirrord:
```
➜  erlang-file-type git:(main) ✗ ./file_info_script.erl "/opt/homebrew/bin/mix"                                                                                                               
File Information:{file_info,37,regular,read_write,
                            {{2023,9,26},{10,48,7}},
                            {{2023,9,20},{10,32,46}},
                            {{2023,9,26},{14,0,56}},
                            33261,1,16777233,0,59606753,501,80}
```

```
➜  erlang-file-type git:(main) ✗ MIRRORD_OPERATOR_ENABLE=false MIRRORD_PROGRESS_MODE=off mirrord-dev exec -- ./file_info_script.erl "/opt/homebrew/bin/mix"
thread '<unnamed>' panicked at /Users/tal/.cargo/registry/src/index.crates.io-6f17d22bba15001f/tokio-1.32.0/src/runtime/io/driver.rs:164:23:
unexpected error when polling the I/O driver: Os { code: 9, kind: Uncategorized, message: "Bad file descriptor" }
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
thread '<unnamed>' panicked at /Users/tal/.cargo/registry/src/index.crates.io-6f17d22bba15001f/tokio-1.32.0/src/runtime/io/driver.rs:164:23:
unexpected error when polling the I/O driver: Os { code: 9, kind: Uncategorized, message: "Bad file descriptor" }
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
erl_child_setup: Select failed: -1 (9)
File Information:{file_info,31,symlink,read_write,
                            {{2023,9,26},{10,48,4}},
                            {{2023,9,26},{10,48,4}},
                            {{2023,9,26},{10,48,4}},
                            41453,1,16777233,0,59607217,501,80}
```
