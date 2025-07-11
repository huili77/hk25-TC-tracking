#!/bin/bash -l                                                                                                                                     

###=======================================================================                                                                         
#PBS -N tempest                                                                                                                                
#PBS -A ucis0005                                                                                                                                  
#PBS -l walltime=00:15:00                                                                                                                          
#PBS -q main                                                                                                                                       
#PBS -j oe                                                                                                                                         
#PBS -l select=1:ncpus=128:mpiprocs=128

echo setting up stuff
### Case specifiers (change these for each run)
output_dir="/glade/derecho/scratch/huili7/mpas_tracking/"

inputfile="/glade/derecho/scratch/huili7/mpas_tracking/mpas_dyamond3_hp8.nc"

# A name to attach to intermediate files
shortname="mpas_dyamond3_hp8"

connectfile="/glade/work/huili7/hk25/grids/connect_healpix_grid_zoom_8_format_exodus_corrected_by_scrip.txt"



# TC files
tc_detected_nodes=${output_dir}/${shortname}".tc_detected_nodes.csv"
tc_stitched_nodes=${output_dir}/${shortname}".tc_stitched_nodes.csv"

# DetectNodes --in_data ${inputfile} --out ${tc_detected_nodes} \
# 	    --searchbymin mslp --closedcontourcmd "mslp,200.0,5.5,0;_DIFF(height_250hPa,height_500hPa),-6.0,6.5,1.0" \
# 	    --mergedist 6.0 \
# 	    --outputcmd "mslp,min,0;_VECMAG(u10,v10),max,2" \
# 	    --timefilter "3hr" \
# 	    --in_connect ${connectfile}



 StitchNodes --in ${tc_detected_nodes} \
	     --out ${tc_stitched_nodes} \
	     --out_file_format "csv" \
	     --in_fmt "lon,lat,slp,wind" \
	     --range 8.0 --mintime "54h" --maxgap "24h" \
	     --threshold "wind,>=,10.0,20;lat,<=,50.0,20;lat,>=,-50.0,20" \
	     --in_connect ${connectfile}
