## submodule の更新方法

```
git submodule foreach git add -A
git submodule foreach git commit -m 'submodule update'
git submodule foreach git push --recurse-submodules=on-demand
git commit -am 'update'
git push
```
