# ブランチ名を指定
BRANCH=main

# コミットメッセージ
MESSAGE=update

fetch:
	git pull origin ${BRANCH}
	git submodule update --remote --merge

checkout:
	git checkout -B ${BRANCH}
	git submodule foreach git checkout -B ${BRANCH}

commit:
	git submodule foreach git add -A
	git submodule foreach git diff-index --quiet HEAD || git commit -m '${MESSAGE}'
	git add -A
	git commit -m '${MESSAGE}'
	git push origin ${BRANCH} --recurse-submodules=on-demand
