set terminal postscript 
set termoption enhanced

set style data histogram
set style fill solid border -1
#set boxwidth 0.9
unset key

set xrange [0:]

set tic scale 0
unset ytics
set ytics ("0:00" 0, "0:30" 1800, "1:00" 3600, "1:30" 5400, "2:00" 7200, "2:30" 9000)
set ylabel "run time (hr:min)"

set xtics nomirror
set xtic rotate by -45
set grid y2tics

set bmargin 6
set rmargin 6

set output "mnist.ps"
set title "MNIST dataset (70000 datapoints; 784 dimensions)"
set yrange [0:9000]
set y2tics ("0:17.11" 1031)
plot "runtimes.dat" using 2:xticlabels(1) lc rgb "#7777ff" lt 1

set output "twitter.ps"
set title "Twitter dataset (583250 datapoints; 78 dimensions)"
set yrange [0:9000]
set y2tics ("0:26.5" 1589)
set label 1 at 4.3,8000 'took more than 5 hours'
set arrow 1 from 3.8,7500 to 3.4,7000 fill
set arrow 2 from 7.5,7500 to 7.9,7000 fill
plot "runtimes.dat" using 3:xticlabels(1) lc rgb "#7777ff" lt 1

unset label 1
unset arrow 1
unset arrow 2

set output "tinyImages.ps"
set title "TinyImages100k dataset (100000 datapoints; 384 dimensions)"
set yrange [0:9000]
set y2tics ("0:13.6" 814)
plot "runtimes.dat" using 4:xticlabels(1) lc rgb "#7777ff" lt 1

set output "yearpredict.ps"
set title "YearPredict dataset (515345 datapoints; 90 dimensions)"
set yrange [0:18000]
set ytics ("0:00" 0, "1:00" 3600, "2:00" 7200, "3:00" 10800, "4:00" 14400, "5:00" 18000)
set y2tics ("3:12.2" 11531)
set label 1 at 1.4,16000 'took more than 5 hours'
set arrow 1 from 4.6,15600,1 to 4.9,15500,1 fill front
set arrow 2 from 4.6,15800,1 to 6.9,15500,1 head filled size 0.15,12 front
set arrow 3 from 4.6,16000,1 to 7.9,16000,1 head filled size 0.15,12 front
set arrow 4 from 4.6,16200,1 to 9.9,17000,1 head filled size 0.15,12 front
plot "runtimes.dat" using 5:xticlabels(1) lc rgb "#7777ff" lt 1

unset label 1
unset arrow 1
unset arrow 2
unset arrow 3
unset arrow 4

set output "mnist-approx.ps"
unset y2tics
set ytics ("0:00" 0, "0:30" 1800, "1:00" 3600, "1:30" 5400, "2:00" 7200, "2:30" 9000)
set ytics ("0:00" 0, "0:10" 600, "0:20" 1200, "0:30" 3600)
set yrange [0:1800]
set xrange [1:2]
set xtic rotate by 0
set tic scale 1
set xlabel "Approximation factor $\epsilon$"
set title "Effect of approximations on runtime"
plot "runtimes-approx.dat" using 1:2 with lines,\
     "runtimes-approx.dat" using 1:3 with lines

set output "yearpredict-parallel.ps"
unset ytics
#set ytics ("0:00" 0, "0:30" 1800, "1:00" 3600, "1:30" 5400, "2:00" 7200, "2:30" 9000)
set ytics ("0:00" 0, "1:00" 3600, "2:00" 7200, "3:00" 10800, "4:00" 14400, "5:00" 18000)
set yrange [0:14400]
set xrange [1:16]
set logscale x
set xtics ("1" 1,"2" 2, "4" 4, "8" 8, "16" 16)
set xtic rotate by 0
set tic scale 1
set xlabel "Number of cores"
set title "Parallel scaling on YearPredict dataset" # (515345 datapoints; 90 dimensions)"
set label 1 at 1.5,2000 'perfect speedup' tc rgb '#007700'
set label 2 at 5.2,4400 'observed speedup' tc rgb '#ff0000'
set arrow 1 from 6.6,3800 to 6.0,3000 fill lc rgb '#ff0000'
set arrow 2 from 3,2500 to 3.3,3300 fill lc rgb '#007700'
set label 3 at 3,7500 "MLPack's kd-tree (one core only)" tc rgb '#555555'
set bmargin 3
#set y2tics ("" 6673) scale 0
plot "runtimes-parallel.dat" using 1:2 with lines lw 2 lc rgb '#ff0000',\
     "runtimes-parallel.dat" using 1:3 with lines lw 2 lc rgb '#007700',\
     "runtimes-parallel.dat" using 1:4 with lines lw 2 lc rgb '#555555'
