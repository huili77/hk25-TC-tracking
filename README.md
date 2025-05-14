# hk25-TC-tracking
Scripts for tracking TCs in MPAS-DYAMOND simulations, using intake, healpix, and TempestExtremes. 
Scripts are adapted from Bryce Harrop
https://github.com/digital-earths-global-hackathon/hk25-teams/tree/main/hk25-Tracking


Steps:
1. Convert climate model data from Zarr to Netcdf, with convert_zarr2nc_4TE.ipynb
2. Generate connectivity files for TempestExtremes, reference Bryce Harrop's repository.
3. Now you have the files needed for TempestExtremes. 
