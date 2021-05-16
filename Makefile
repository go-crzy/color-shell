
PID := $(shell  ps -ef | grep "color.[s]h" | awk '{print $$2}')

test: start curl end

start:
ifndef PID
	nohup ./color.sh >/dev/null 2>&1 &
endif

curl: 
	curl --fail --silent http://localhost:1500 | jq -r '.color' | grep "red"

end:
	make stop

stop:
ifdef PID
	kill -9 $(PID)
	@curl --silent http://localhost:1500 >/dev/null
endif

.PHONY: stop start test curl end
