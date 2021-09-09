#!/bin/bash

layoutName=$(leftwm-state -w 0 -s "{{ workspace.layout }}")
echo Test
echo $layoutName
