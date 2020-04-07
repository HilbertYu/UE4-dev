.PHONY: default build-dev-editor run-dev-editor

########### custom ########
PROJECT_NAME = $(shell basename `pwd`)
UE4_HOME = ~/opt/Epic-Games/UE_4.24/
DEV_PLATFORM = Mac


########### custom ########
UE4_HOME_PATH = $(shell readlink -f $(UE4_HOME))
UE4_BUILD_PATH = Engine/Build/BatchFiles/$(DEV_PLATFORM)
BUILDER_PRE = $(UE4_HOME_PATH)/$(UE4_BUILD_PATH)/Build.sh

BUILDER = $(wildcard $(BUILDER_PRE))
PROJECT_FILE = $(shell pwd)/$(PROJECT_NAME).uproject
UE4_EDITOR = $(wildcard $(UE4_HOME_PATH)/Engine/Binaries/$(DEV_PLATFORM)/UE4Editor.app/Contents/MacOS/UE4Editor)



default:
	@echo "hello"

build-dev-editor:
	@echo $(PROJECT_FILE)
	@$(BUILDER) $(PROJECT_NAME)Editor $(DEV_PLATFORM) Development $(PROJECT_FILE) -waitmutex


run-dev-editor:
	@$(UE4_EDITOR) $(PROJECT_FILE)


