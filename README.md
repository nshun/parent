## 新しくリポジトリを管理下に追加する場合

```
make REPO=intro-curriculum-4023 add
```

## 新しいブランチを作る場合

```
make BRANCH=main-2021 checkout
```

**Makefile の `BRANCH` を編集すること**

## 変更を各リポジトリに適用させる場合

変更があるリポジトリのみ

```
make MESSAGE="update" commit-push
```

ブランチ作成直後など、すべてのリポジトリに

```
make MESSAGE="update" commit-push-force
```
