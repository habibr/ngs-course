#from here: http://seqanswers.com/forums/archive/index.php/t-19874.html

#fastq header should be checked for prefix, not just @. Better use more characters...

grep -hn '^@???' R1_in.clipped.fq R2_in.clipped.fq | \
perl -F: -ane 'print if ($F[0]-1)%4==0;' | \
perl -ane 'my ($read_name)=m{^\d+:@([^/ ]+)[/ ]}; print $read_name,"\n";' | \
sort | \
uniq -d > paired.list
