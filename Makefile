


SCAD_FOLDER := power_box

FOLDER_MAKEFILES := $(addsuffix /Makefile,$(SCAD_FOLDER))

stl-target =

include $(FOLDER_MAKEFILES)

define gen_stl

$($(1)-output): $($(1)-input)
	openscad --render -o $$@ $$< $($(1)-flags)

.PHONY: $(1)
$(1): $($(1)-output)

endef

$(foreach stl,$(stl-target),$(eval $(call gen_stl,$(stl))))

all: $(stl-target)
