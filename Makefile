this_week=${shell date +%V}
this_day=${shell date +%u}
which_day=${shell expr \( ${this_week} - 44 \) \* 7 + ${this_day}}
this_date=$(shell date -I)

link_file="link.md"
append_link:
	echo "* [Day${which_day} ${this_date}](#day-${which_day})" >>${link_file}

daily_file="daily.md"
append_daily: append_link
	echo "## Day ${which_day}\n" >> ${daily_file}
	echo "### 计划\n" >> ${daily_file}
	echo "### 成果\n" >> ${daily_file}

clean:
	rm -rf README.md

daily: clean
	touch README.md
	echo "# Learning OS Daily\n" >> README.md
	cat ${link_file} >> README.md
	echo >> README.md
	cat ${daily_file} >> README.md