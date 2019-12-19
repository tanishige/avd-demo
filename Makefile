id ?= 0

clone:
	cp -r team01 team${id}
	find team${id}/ -type f -name "*.yml" -exec sed -i '' -e "s/TEAM01/TEAM${id}/g" {} +