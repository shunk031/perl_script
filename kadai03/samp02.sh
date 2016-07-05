#!/bin/bash

grep [0-9][0-9][0-9]$2 KEN_ALL_ROME.CSV | grep $1 | nkf -w 
