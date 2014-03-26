HaxeNEONPerformanceTest
=======================

A simple test of performance with matrix multiplications using the NEON instruction set.

In order for it to work on android you need to change the android toolchain in HXCPP or HXLIBC (whatever you are using). On this part:

<section if="HXCPP_ARMV7">
	<flag value="-march=armv7-a"  />
	<flag value="-mfpu=vfpv3-d16"  />
	<flag value="-mfloat-abi=softfp" />
</section>

change to:

<section if="HXCPP_ARMV7">
	<flag value="-march=armv7-a"  />
	<flag value="-mfpu=neon"  />
	<flag value="-mfloat-abi=softfp" />
</section>


I found that while there is a noticeable improvement on iOS, on Android it is actually worse. That lead me to this:http://www.crickettechnology.com/blog/?p=691 . 
The problem seems to be gcc...

Results

iOS iPad Mini Retina - With Neon
Main.hx:33: took:3.006291634
Main.hx:33: took:3.365333308
Main.hx:33: took:3.007791645
Main.hx:33: took:6.63037505
Main.hx:33: took:3.196291684
Main.hx:33: took:3.016708302
Main.hx:33: took:6.496416696
Main.hx:33: took:3.032041714
Main.hx:33: took:2.63379165
Main.hx:33: took:2.626083384
Main.hx:33: took:2.62754166
Main.hx:33: took:2.627458307
Main.hx:33: took:2.903208311
Main.hx:33: took:2.610249969
Main.hx:33: took:2.707916661
Main.hx:33: took:3.505166678

iOS iPad Mini Retina - Without Neon
Main.hx:33: took:13.77933333
Main.hx:33: took:13.72462499
Main.hx:33: took:13.77220836
Main.hx:33: took:13.82629166
Main.hx:33: took:14.00537498
Main.hx:33: took:18.24145834
Main.hx:33: took:13.73891666
Main.hx:33: took:14.85312503
Main.hx:33: took:13.63754168
Main.hx:33: took:13.83866667
Main.hx:33: took:13.86112504
Main.hx:33: took:14.59758333
Main.hx:33: took:13.78233329
Main.hx:33: took:13.96004163

Android Archos 97 Platinum HD - With Neon
I/trace   (19349): Main.hx:33: took:34.923958
I/trace   (19349): Main.hx:33: took:35.0315
I/trace   (19349): Main.hx:33: took:35.153416
I/trace   (19349): Main.hx:33: took:34.603667
I/trace   (19349): Main.hx:33: took:36.22825
I/trace   (19349): Main.hx:33: took:33.995375
I/trace   (19349): Main.hx:33: took:36.841792
I/trace   (19349): Main.hx:33: took:34.094334
I/trace   (19349): Main.hx:33: took:36.8305
I/trace   (19349): Main.hx:33: took:36.183875
I/trace   (19349): Main.hx:33: took:34.277542
I/trace   (19349): Main.hx:33: took:37.071042
I/trace   (19349): Main.hx:33: took:34.507292
I/trace   (19349): Main.hx:33: took:34.503375

Android Archos 97 Platinum HD - Without Neon
I/trace   (12339): Main.hx:33: took:28.631666
I/trace   (12339): Main.hx:33: took:30.682416
I/trace   (12339): Main.hx:33: took:28.127459
I/trace   (12339): Main.hx:33: took:31.157834
I/trace   (12339): Main.hx:33: took:27.715458
I/trace   (12339): Main.hx:33: took:31.206625
I/trace   (12339): Main.hx:33: took:27.918917
I/trace   (12339): Main.hx:33: took:30.78
I/trace   (12339): Main.hx:33: took:28.565917
I/trace   (12339): Main.hx:33: took:29.833458
I/trace   (12339): Main.hx:33: took:28.422917
I/trace   (12339): Main.hx:33: took:30.684416
I/trace   (12339): Main.hx:33: took:27.627959
I/trace   (12339): Main.hx:33: took:30.856667
