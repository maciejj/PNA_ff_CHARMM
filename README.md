====
This directory contains CHARMM forcefield parameters for Peptide Nucleic Acids with optimized backbone torsions described in:
Jasinski, M.; Feig, M.; Trylska, J.; JCTC 2018; DOI 10.1021/acs.jctc.8b00291
The file with corrected torsion angles parameters is: ./toppar_all36_pna-lna.opt3.str

====
The directory contains also a CGenFF parameters v3.0.1 that are compatible with the .str file

===
The directory contains also an example, prepared with MMTSB toolset and CHARMM showing how to prepare a simulation of a PNA:RNA crystal structure (5EMF).
It uses a PDB file with PNA:RNA complex '5emf_ter.pdb', to prepare simulation box with water and ions and all necessary parameters.
Atom names in 5emf_ter.pdb match the names in the .str file. The ./rename-pna.sh script may be useful to rename atoms present in the PDB file from PDB database but there is no guarantee. 

To run the example, you need to have MMTSB toolset and CHARMM installed. For MMTSB please see:
http://feig.bch.msu.edu/mmtsb/Main_Page

Then change the location of your CHARMM distribution in the mmtsb-prep.sh script and run it.
If the script runs correctly, it will produce the following files: 5emf_ter_h.pdb  5emf.solvated.pdb  5emf.solvated.ions.pdb  5emf-psf.log  5emf.psf  5emf.crd
Example outputs are in folder example_outputs.

===
To run simulations in NAMD you have to specify following parameter files in the input:

parameters  par_all36_prot.prm
parameters  par_all36_na.prm
parameters  par_all36_cgenff.prm
parameters  toppar_all36_pna-lna.opt3.str

For the first two files please see: http://mackerell.umaryland.edu/charmm_ff.shtml
