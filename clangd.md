# clangd: C/C++ language server

Needs a `compile_commands.json` file to know how to build the project. You can
generate one with <https://github.com/Qyriad/log2compdb>, e.g.:

```
make V=1 -j$(nproc) \
  | tee /dev/stderr > build.log \
  && nix run github:Qyriad/log2compdb -- -c clang++ -i build.log
```
