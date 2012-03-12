#! /usr/bin/python
#updated version, with command line parsing

import fileinput, os, sys
from types import *

print sys.argv[1]

#load[3] vel[3] mass bcfla
params = [
['NO_DATA','0   0   0   0   0   0   0.1   0'],
['BC','0   0   0   0   0   0   0.1   1'],
['LOAD','333   0   0   0   0   0   0.1   0'],
['VEL1','0   0   0   0   0   0.5   0.1   1']]   #la bcflag dipende un po' dal problema

f = open('input.per.bak','w')
for line in fileinput.input(sys.argv[1]):  #gli scrivo il nome del file
	a = line.split()
	if len(a) > 0:
		try :
			int(a[0])
			if len(a) > 10:
				print >>f,'  ',a[3],' ',a[6],' ',a[9],' ',a[12]
			else :
				print >>f,'  ',a[3],' ',a[6],' ',a[9],'  NO_DATA'
		except:
			pass
f.close()

f = open('input.per','w')
for i in range(0, len(params)):
	with open('input.per.bak') as oldf:   
		for line in oldf:
			line = line.rstrip()
	#for line in fileinput.input(['input.per.bak']):
			repl_string = line.replace(params[i][0],params[i][1])
			if line != repl_string:
				print >>f,repl_string
f.close()

#os.system('mv input.per build')
#os.system('build/peri_mp 5 0.000001 100 0.001 10 2 999999 > md_open_mp_run_output.txt')
