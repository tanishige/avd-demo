
DELIMITER ?= -
GROUP ?= TEAM01
DEVICE ?= device01

.PHONY: configure
configure:
	find ./ -type f -name "*.yml" -exec sed -i '' -e "s/STUDENT_DEVICE/${GROUP}${DELIMITER}${DEVICE}/g" {} +
