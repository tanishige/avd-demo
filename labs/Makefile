
DELIMITER ?= -
GROUP ?= TEAM01
DEVICE ?= DEVICE01

.PHONY: build
configure:
	find ./ -type f -name "*.yml" -exec sed -i '' -e "s/STUDENT_DEVICE/${GROUP}${DELIMITER}${DEVICE}/g" {} +
	find ./ -type f -name "*.yml" -exec sed -i '' -e "s/STUDENT/${GROUP}/g" {} +
