#!/bin/bash

abs() { [ $1 -lt 0 ] && echo $(( $1 * -1 )) || echo $1; }

