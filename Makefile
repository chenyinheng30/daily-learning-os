this_week=${shell date +%V}
this_day=${shell date +%u}
which_day=${shell expr \( ${this_week} - 44 \) \* 7 + ${this_day}}
this_date=$(shell date -I)
daily_file="README.md"

append_daily:
	echo "## Day ${which_day}\n" >> ${daily_file}
	echo "### 计划\n" >> ${daily_file}
	echo "### 成果\n" >> ${daily_file}