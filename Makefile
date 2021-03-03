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
	git add .
	git commit -m '${MESSAGE}'
	git push origin ${BRANCH} --recurse-submodules=on-demand
