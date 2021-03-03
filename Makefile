BRANCH=main # ブランチ名を指定

# コミットメッセージ
MESSAGE=update

fetch:
	git pull origin ${BRANCH}
	git submodule foreach git pull origin ${BRANCH}

checkout:
	git checkout -B ${BRANCH}
	git submodule foreach git checkout -B ${BRANCH}

commit:
	git submodule foreach git add -A
	git submodule foreach git diff-index --quiet HEAD || git commit -m '${MESSAGE}'
	git add -A
	git commit -m '${MESSAGE}'
	git push origin ${BRANCH} --recurse-submodules=on-demand
