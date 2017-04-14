

SPACE := 
all: list

stls: _stl

FOLDER_MAKEFILES := $(wildcard */Makefile)

stl-target =
output_stl =

include $(FOLDER_MAKEFILES)

define gen_stl

$($(1)-output): $($(1)-input)
	openscad --render -o $$@ $$< $($(1)-flags)

.PHONY: $(1)
$(1): $($(1)-output)

output_stl += $($(1)-output)

endef

$(foreach stl,$(stl-target),$(eval $(call gen_stl,$(stl))))

_stl: $(stl-target)
clean:
	rm -f $(output_stl)
list:
	@echo 'Use "make stls" to build all stl files (this may take a long time)'
	@echo 'Otherwise, the following target can be individually built:'
	@$(foreach stl,$(stl-target),echo '   - $(stl)';)
