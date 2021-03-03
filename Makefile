# ブランチ名を指定
BRANCH=main-2021

# コミットメッセージ
MESSAGE=update

# 追跡するリポジトリ(REPO)を追加
add:
	git submodule add https://github.com/nshun/${REPO}.git ${REPO}

# リモートの変更を取り込む
fetch:
	git pull origin ${BRANCH}
	git submodule update --remote --merge

# ブランチ(BRANCH)を切り替える（無ければ作成）
checkout:
	git checkout -B ${BRANCH}
	git submodule foreach git checkout -B ${BRANCH}

# 変更をコミットした後、変更があったリポジトリにのみプッシュ
commit-push:
	git submodule foreach git add -A
	git submodule foreach "git diff-index --quiet HEAD || git commit -m '${MESSAGE}'"
	git add -A
	git commit -m '${MESSAGE}'
	git push origin ${BRANCH} --recurse-submodules=on-demand

# 変更をコミットした後、全てのリポジトリにプッシュ
commit-push-force:
	git submodule foreach git add -A
	git commit -m '${MESSAGE}' --allow-empty
	git submodule foreach git push origin ${BRANCH}
	git add -A
	git commit -m '${MESSAGE}'
	git push origin ${BRANCH}
