#!/bin/bash
tdir=./cgenff3.0.1

export CHARMMEXEC=/apps/charmm/bin/charmm.c40a2.orange

#Short minimization to obtain structure with hydrogens. Minimiazation is performed with 50.0 kcal/mol constrains on all heavy (non hydrogen) atoms.
#Note that terminal residues were already added. 
minCHARMM.pl -par minsteps=10, -par param=36,xpar=$tdir/par_all36_cgenff.prm,xtop=$tdir/top_all36_cgenff.rtf,pstream=toppar_all36_pna-lna.opt3.str,nodeoxy,terlist=PROB:ACE:CTN -cons heavy self N01A:1:8_50.0=PROB:101:108_50.0 5emf_ter.pdb > 5emf_ter_h.pdb

#solvation
convpdb.pl -solvate -cutoff 15 -cubic 5emf_ter_h.pdb > 5emf.solvated.pdb

#adding ions
convpdb.pl -ions SOD:7 -log 5emf.ions.log 5emf.solvated.pdb > 5emf.solvated.ions.pdb

#preparing psf and crd files needed for simulation
genPSF.pl -log 5emf-psf.log -par param=36,xpar=$tdir/par_all36_cgenff.prm,xtop=$tdir/top_all36_cgenff.rtf,pstream=toppar_all36_pna-lna.opt3.str,nodeoxy,terlist=PROB:ACE:CTN -crdout 5emf.crd 5emf.solvated.ions.pdb > 5emf.psf
