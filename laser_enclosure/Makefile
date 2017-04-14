DIR := $(dir $(lastword $(MAKEFILE_LIST)))
TEST_NAME := $(lastword $(subst /, ,$(DIR)))

laser_enclosure-output := $(DIR)enclosure.stl
laser_enclosure-input := $(DIR)enclosure.scad
laser_enclosure-flags :=

stl-target += laser_enclosure
