# from http://wiki.tcl.tk/1474#pagetoc1a2fba1b in "recursive globs" section
# Originally written by Jeffrey Hobbs and posted 2006-05-16

proc glob-r {{dir .} args} {
    set res {}
    foreach i [lsort [glob -nocomplain -dir $dir *]] {
	if {[file isdirectory $i]} {
	    eval [list lappend res] [eval [linsert $args 0 glob-r $i]]
	} else {
	    if {[llength $args]} {
		foreach arg $args {
		    if {[string match $arg $i]} {
			lappend res $i
			break
		    }
		}
	    } else {
		lappend res $i
	    }
	}
    }
    return $res
} ;# JH
