DIR := $(dir $(lastword $(MAKEFILE_LIST)))


sewing_main_box-output := $(DIR)sewing_cushion_box.stl
sewing_main_box-input := $(DIR)sewing_cushion.scad
sewing_main_box-flags := -DBUILD_MAIN_BOX=1

sewing_ring-output := $(DIR)sewing_cushion_ring.stl
sewing_ring-input := $(DIR)sewing_cushion.scad
sewing_ring-flags := -DBUILD_INNER_RING=1

stl-target += sewing_ring sewing_main_box
