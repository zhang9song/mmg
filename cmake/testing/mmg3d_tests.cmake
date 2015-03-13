## =============================================================================
##  This file is part of the Mmg software package for the tetrahedral
##  mesh modification.
##  Copyright (c) Inria - IMB (Université de Bordeaux) - LJLL (UPMC), 2004- .
##
##  Mmg is free software: you can redistribute it and/or modify it
##  under the terms of the GNU Lesser General Public License as published
##  by the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##
##  Mmg is distributed in the hope that it will be useful, but WITHOUT
##  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
##  FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
##  License for more details.
##
##  You should have received a copy of the GNU Lesser General Public
##  License and of the GNU General Public License along with Mmg (in
##  files COPYING.LESSER and COPYING). If not, see
##  <http://www.gnu.org/licenses/>. Please read their terms carefully and
##  use this copy of the Mmg distribution only if you accept them.
## =============================================================================

###############################################################################
#####
#####         Continuous Integration
#####
###############################################################################

# Simple test: must already pass
ADD_TEST(NAME SimpleCube
  COMMAND ${EXECUT} -v 6 -d
  ${MMG3D_CI_TESTS}/Cube/cube
  -out ${MMG3D_CI_TESTS}/Cube/cube.o.meshb)

###############################################################################
#####
#####         Check Build
#####
###############################################################################

# Build with different compilers

###############################################################################
#####
#####         Check Memory Leak
#####
###############################################################################
#####

FOREACH(EXEC ${LISTEXEC})
  ADD_TEST(NAME LeakCheck_AbnormalEnd2_${EXEC}
    COMMAND ${EXEC} -v 5
    ${MMG3D_CI_TESTS}/LeakCheck_AbnormalEnd2/d
    -out ${MMG3D_CI_TESTS}/LeakCheck_AbnormalEnd2/d.o.meshb)
  SET(passRegex "## Unable to scale mesh.")
  SET_PROPERTY(TEST LeakCheck_AbnormalEnd2_${EXEC}
    PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
  #####
  ADD_TEST(NAME LeakCheck_AbnormalEnd3_${EXEC}
    COMMAND ${EXEC} -v 5
    ${MMG3D_CI_TESTS}/LeakCheck_AbnormalEnd3/d -sol
    ${MMG3D_CI_TESTS}/LeakCheck_AbnormalEnd3/dsol.sol -ls 2
    -out ${MMG3D_CI_TESTS}/LeakCheck_AbnormalEnd3/d.o.meshb)
  SET(passRegex "## ERROR: A VALID SOLUTION FILE IS NEEDED")
  SET_PROPERTY(TEST LeakCheck_AbnormalEnd3_${EXEC}
    PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
  #####
  #ADD_TEST(NAME LeakCheck_AbnormalEnd4_${EXEC}
  #  COMMAND ${EXEC} -v 5
  #  ${MMG3D_CI_TESTS}/LeakCheck_AbnormalEnd4) ## no possible for now
  #SET(passRegex " ")
  #SET_PROPERTY(TEST LeakCheck_AbnormalEnd4_${EXEC}
  #  PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
  #####
  #ADD_TEST(NAME LeakCheck_AbnormalEnd5.1_${EXEC}
  #  COMMAND ${EXEC} -v 5
  #  ${MMG3D_CI_TESTS}/LeakCheck_AbnormalEnd5.1) ## todo mmg3d2
  #SET(passRegex " ")
  #SET_PROPERTY(TEST LeakCheck_AbnormalEnd5.1_${EXEC}
  #  PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
  #####
  #ADD_TEST(NAME LeakCheck_AbnormalEnd5.2_${EXEC}
  #  COMMAND ${EXEC} -v 5
  #  ${MMG3D_CI_TESTS}/LeakCheck_AbnormalEnd5.2) ## todo mmg3d1
  #SET(passRegex " ")
  #SET_PROPERTY(TEST LeakCheck_AbnormalEnd5.2_${EXEC}
  #  PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
  #####
  #ADD_TEST(NAME LeakCheck_AbnormalEnd6_${EXEC}
  #  COMMAND ${EXEC} -v 5
  #  ${MMG3D_CI_TESTS}/LeakCheck_AbnormalEnd6) ## todo analys.c
  #SET(passRegex " ")
  #SET_PROPERTY(TEST LeakCheck_AbnormalEnd6_${EXEC}
  #  PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
  #####
  ADD_TEST(NAME LeakCheck_AbnormalEnd7_${EXEC}
    COMMAND ${EXEC} -v 5
    ${MMG3D_CI_TESTS}/LeakCheck_AbnormalEnd7/d
    -out ${MMG3D_CI_TESTS}/LeakCheck_AbnormalEnd7/unwrittable.meshb)
  SET(passRegex "\\*\\* UNABLE TO OPEN.*")
  SET_PROPERTY(TEST LeakCheck_AbnormalEnd7_${EXEC}
    PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
  #####
  ADD_TEST(NAME LeakCheck_AbnormalEnd8_${EXEC}
    COMMAND ${EXEC} -v 5
    ${MMG3D_CI_TESTS}/LeakCheck_AbnormalEnd8/d
    -out ${MMG3D_CI_TESTS}/LeakCheck_AbnormalEnd8/unwrittable.meshb)
  SET(passRegex "\\*\\* UNABLE TO OPEN.*.sol")
  SET_PROPERTY(TEST LeakCheck_AbnormalEnd8_${EXEC}
    PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
  #####
  #####
  ADD_TEST(NAME LeakCheck_args0_${EXEC}
    COMMAND ${EXEC} -v 5
    ${MMG3D_CI_TESTS}/LeakCheck_args0/d
    -out ${MMG3D_CI_TESTS}/LeakCheck_args0/d.o.meshb)
  #####
  ADD_TEST(NAME LeakCheck_args1_${EXEC}
    COMMAND ${EXEC} -v 5
    -in ${MMG3D_CI_TESTS}/LeakCheck_args1/d -sol
    ${MMG3D_CI_TESTS}/LeakCheck_args1/dsol.sol
    -out ${MMG3D_CI_TESTS}/LeakCheck_args1/dout.meshb)
  #####
  ADD_TEST(NAME LeakCheck_optLevelSet_${EXEC}
    COMMAND ${EXEC} -v 5 -ls 0
    ${MMG3D_CI_TESTS}/LeakCheck_optLevelSet/rect03d
    -out ${MMG3D_CI_TESTS}/LeakCheck_optLevelSet/rect03d.o.meshb)

  ###############################################################################
  #####
  #####         Check Precision
  #####
  ###############################################################################
  #####
  ADD_TEST(NAME MeshVersionFormatted1_${EXEC}
    COMMAND ${EXEC} -v 5
    -in ${MMG3D_CI_TESTS}/MeshVersionFormatted1/d
    -sol ${MMG3D_CI_TESTS}/MeshVersionFormatted1/dsol.sol
    -out ${MMG3D_CI_TESTS}/MeshVersionFormatted1/d.o.meshb)
  #####
  ADD_TEST(NAME MeshVersionFormatted2_${EXEC}
    COMMAND ${EXEC} -v 5
    -in ${MMG3D_CI_TESTS}/MeshVersionFormatted2/d
    -sol ${MMG3D_CI_TESTS}/MeshVersionFormatted2/dsol.sol
    -out ${MMG3D_CI_TESTS}/MeshVersionFormatted2/d.o.meshb)

  ###############################################################################
  #####
  #####         Check Boundaries
  #####
  ###############################################################################
  #####
  ADD_TEST(NAME ChkBdry_optls_test4_${EXEC}
    COMMAND ${EXEC} -v 5 -ls
    -in ${MMG3D_CI_TESTS}/ChkBdry_optls_test4/test4
    -sol ${MMG3D_CI_TESTS}/ChkBdry_optls_test4/test4.sol
    -out ${MMG3D_CI_TESTS}/ChkBdry_optls_test4/test4.o.meshb)
  #####
  ADD_TEST(NAME ChkBdry_optls_temp_${EXEC}
    COMMAND ${EXEC} -v 5 -ls -hmin 5 -hmax 6
    -nr -hausd 0.5 -hgrad 1.2
    -in ${MMG3D_CI_TESTS}/ChkBdry_optls_temp/temp
    -sol ${MMG3D_CI_TESTS}/ChkBdry_optls_temp/temp.sol
    -out ${MMG3D_CI_TESTS}/ChkBdry_optls_temp/temp.o.meshb)
  ####
  ADD_TEST(NAME ChkBdry_optls_temp2_${EXEC}
    COMMAND ${EXEC} -v 5 -ls -hmin 5 -hmax 6
    -nr -hausd 0.5 -hgrad 1.2
    -in ${MMG3D_CI_TESTS}/ChkBdry_optls_temp/temp
    -sol ${MMG3D_CI_TESTS}/ChkBdry_optls_temp/temp.sol
    -out ${MMG3D_CI_TESTS}/ChkBdry_optls_temp/temp.o.meshb)
  #####
  ADD_TEST(NAME ChkBdry_cube_${EXEC}
    COMMAND ${EXEC}
    ${MMG3D_CI_TESTS}/ChkBdry_cube/cube)
  #####
  ADD_TEST(NAME ChkBdry_multidomCube_${EXEC}
    COMMAND ${EXEC} -hmax 0.1
    ${MMG3D_CI_TESTS}/ChkBdry_multidomCube/c)
  #####
  ADD_TEST(NAME ChkBdry_multidomCube2_${EXEC}
    COMMAND ${EXEC} -hmax 0.1
    ${MMG3D_CI_TESTS}/ChkBdry_multidomCube2/c)
  #####
  ADD_TEST(NAME ChkBdry_multidomCube3_${EXEC}
    COMMAND ${EXEC} -hmax 0.1
    ${MMG3D_CI_TESTS}/ChkBdry_multidomCube3/c)
  #####
  ADD_TEST(NAME HausdLoc_2Spheres${EXEC}
    COMMAND ${EXEC} -hgrad 1.3
    ${MMG3D_CI_TESTS}/HausdLoc_2Spheres/2spheres
    ${MMG3D_CI_TESTS}/HausdLoc_2Spheres/2spheres.o.meshb
    -hgrad 2
    )


ENDFOREACH(EXEC)



###############################################################################
#####
#####         Check Results
#####
###############################################################################
#####

# Check what happend when we refine an isotropic cube of size h with a constant
# metric (h, h/2, h/4, h/8 and h/16)
#---First with hmin=hmax
ADD_TEST(NAME CubeIso_h_hminMax
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/CubeIso_h_hminMax/CubeIso0.1 -hmax 0.1 -hmin 0.1
  -out ${MMG3D_CI_TESTS}/CubeIso_h_hminMax/CubeIso0.1.o.meshb)
ADD_TEST(NAME CubeIso_0.5h_hminMax
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/CubeIso_0.5h_hminMax/CubeIso0.1 -hmax 0.05 -hmin 0.05
  -out ${MMG3D_CI_TESTS}/CubeIso_0.5h_hminMax/CubeIso0.1.o.meshb)
ADD_TEST(NAME CubeIso_0.25h_hminMax
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/CubeIso_0.25h_hminMax/CubeIso0.1 -hmax 0.025 -hmin 0.025
  -out ${MMG3D_CI_TESTS}/CubeIso_0.25h_hminMax/CubeIso0.1.o.meshb)
#ADD_TEST(NAME CubeIso_0.125h_hminMax
#  COMMAND ${EXECUT} -v 5
#  ${MMG3D_CI_TESTS}/CubeIso_0.125h_hminMax/CubeIso0.1 -hmax 0.0125 -hmin 0.0125)

#---Second with sol file
ADD_TEST(NAME CubeIso_h_met
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/CubeIso_h_met/CubeIso0.1
  -out ${MMG3D_CI_TESTS}/CubeIso_h_met/CubeIso0.1.o.meshb)
ADD_TEST(NAME CubeIso_0.5h_met
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/CubeIso_0.5h_met/CubeIso0.1
  -out ${MMG3D_CI_TESTS}/CubeIso_0.5h_met/CubeIso0.1.o.meshb)
ADD_TEST(NAME CubeIso_0.25h_met
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/CubeIso_0.25h_met/CubeIso0.1
  -out ${MMG3D_CI_TESTS}/CubeIso_0.25h_met/CubeIso0.1.o.meshb)
ADD_TEST(NAME CubeIso_0.125h_met
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/CubeIso_0.125h_met/CubeIso0.1
  -out ${MMG3D_CI_TESTS}/CubeIso_0.125h_met/CubeIso0.1.o.meshb)

#####

# Check what happend when we refine a sphere of size h with a constant metric
# (h, h/2, h/4 and h/8)
##---First with hmin=hmax
#ADD_TEST(NAME SphereIso_h_hminMax
#  COMMAND ${EXECUT} -v 5
#  ${MMG3D_CI_TESTS}/SphereIso_h_hminMax/SphereIso0.5
#  -hmax 0.5 -hmin 0.5 -hausd 0.1)
#ADD_TEST(NAME SphereIso_0.5h_hminMax
#  COMMAND ${EXECUT} -v 5
#  ${MMG3D_CI_TESTS}/SphereIso_0.5h_hminMax/SphereIso0.5
#  -hmax 0.25 -hmin 0.25 -hausd 0.1)
#ADD_TEST(NAME SphereIso_0.25h_hminMax
#  COMMAND ${EXECUT} -v 5
#  ${MMG3D_CI_TESTS}/SphereIso_0.25h_hminMax/SphereIso0.5
#  -hmax 0.125 -hmin 0.125 -hausd 0.1)
#ADD_TEST(NAME SphereIso_0.125h_hminMax
#  COMMAND ${EXECUT} -v 5
#  ${MMG3D_CI_TESTS}/SphereIso_0.125h_hminMax/SphereIso0.5
#  -hmax 0.0625 -hmin 0.0625 -hausd 0.1)
#---Second with sol file
ADD_TEST(NAME SphereIso_h_met
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/SphereIso_h_met/SphereIso0.5 -hausd 0.1
  -out ${MMG3D_CI_TESTS}/SphereIso_h_met/SphereIso0.5.o.meshb)
ADD_TEST(NAME SphereIso_0.5h_met
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/SphereIso_0.5h_met/SphereIso0.5 -hausd 0.1
  -out ${MMG3D_CI_TESTS}/SphereIso_0.5h_met/SphereIso0.5.o.meshb)
ADD_TEST(NAME SphereIso_0.25h_met
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/SphereIso_0.25h_met/SphereIso0.5 -hausd 0.1
  -out ${MMG3D_CI_TESTS}/SphereIso_0.25h_met/SphereIso0.5.o.meshb)
ADD_TEST(NAME SphereIso_0.125h_met
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/SphereIso_0.125h_met/SphereIso0.5 -hausd 0.1
  -out ${MMG3D_CI_TESTS}/SphereIso_0.125h_met/SphereIso0.5.o.meshb)

# Check what happend when we unrefine a sphere of size smallh with a constant metric
# (2*smallh, 4*smallh and 8*smallh)
ADD_TEST(NAME SphereIso_2smallh_met
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/SphereIso_2smallh_met/SphereIso0.0625 -hausd 0.1
  -out ${MMG3D_CI_TESTS}/SphereIso_2smallh_met/SphereIso0.0625.o.meshb)
ADD_TEST(NAME SphereIso_4smallh_met
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/SphereIso_4smallh_met/SphereIso0.0625 -hausd 0.1
  -out ${MMG3D_CI_TESTS}/SphereIso_4smallh_met/SphereIso0.0625.o.meshb)
ADD_TEST(NAME SphereIso_8smallh_met
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/SphereIso_8smallh_met/SphereIso0.0625 -hausd 0.1
  -out ${MMG3D_CI_TESTS}/SphereIso_8smallh_met/SphereIso0.0625.o.meshb)

# Check what happend when we use hausdorff number to refine the skin and a big hgrad
# to have an inside of the initial size (0.5)
ADD_TEST(NAME SphereIso_h_hausd0.001
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/SphereIso_h_hausd0.001/SphereIso0.5 -hausd 0.001 -hgrad 500
  -out ${MMG3D_CI_TESTS}/SphereIso_h_hausd0.001/SphereIso0.5.o.meshb)
ADD_TEST(NAME SphereIso_h_hausd0.005
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/SphereIso_h_hausd0.005/SphereIso0.5 -hausd 0.005 -hgrad 100
  -out ${MMG3D_CI_TESTS}/SphereIso_h_hausd0.005/SphereIso0.5.o.meshb)

# Check what happend when we refine a cube whose skin has already the good size
ADD_TEST(NAME CubeSkin0.05_Inside0.4
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/CubeSkin0.05_Inside0.4/CubeSkin0.05
  ${MMG3D_CI_TESTS}/CubeSkin0.05_Inside0.4/CubeSkin0.05.o.meshb)
ADD_TEST(NAME CubeSkin0.1_Inside0.4
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/CubeSkin0.1_Inside0.4/CubeSkin0.1
  ${MMG3D_CI_TESTS}/CubeSkin0.1_Inside0.4/CubeSkin0.1.o.meshb)
ADD_TEST(NAME CubeSkin0.2_Inside0.4
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/CubeSkin0.2_Inside0.4/CubeSkin0.2
  ${MMG3D_CI_TESTS}/CubeSkin0.2_Inside0.4/CubeSkin0.2.o.meshb)
ADD_TEST(NAME CubeSkin0.0125_Inside0.125
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/CubeSkin0.0125_Inside0.125/CubeSkin0.125
  -out ${MMG3D_CI_TESTS}/CubeSkin0.0125_Inside0.125/CubeSkin0.125.o.meshb)
ADD_TEST(NAME CubeSkin0.0125_Inside0.25
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/CubeSkin0.0125_Inside0.25/CubeSkin0.25
  -out ${MMG3D_CI_TESTS}/CubeSkin0.0125_Inside0.25/CubeSkin0.25.o.meshb)
ADD_TEST(NAME CubeSkin0.0125_Inside0.5
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/CubeSkin0.0125_Inside0.5/CubeSkin0.5
  ${MMG3D_CI_TESTS}/CubeSkin0.0125_Inside0.5/CubeSkin0.5.o.meshb)


# Check results on various meshes
# First: Meshes that we want unrefined
ADD_TEST(NAME Various_unref_Linkrods_met0.2
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/Various_unref_Linkrods_met0.2/linkrods -hausd 0.1
  ${MMG3D_CI_TESTS}/Various_unref_Linkrods_met0.2/linkrods.o.meshb)
ADD_TEST(NAME Various_unref_Linkrods_met0.2_hausd0.01
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/Various_unref_Linkrods_met0.2_hausd0.01/linkrods
  -hausd 0.01
  ${MMG3D_CI_TESTS}/Various_unref_Linkrods_met0.2_hausd0.01/linkrods.o.meshb)



# Second: Meshes that we want refined
ADD_TEST(NAME Various_ref_Linkrods_met0.05
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/Various_ref_Linkrods_met0.05/linkrods -hausd 0.1
  ${MMG3D_CI_TESTS}/Various_ref_Linkrods_met0.05/linkrods.o.meshb)
ADD_TEST(NAME Various_ref_Linkrods_met0.05_hausd0.01
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/Various_ref_Linkrods_met0.05_hausd0.01/linkrods
  -hausd 0.01
  ${MMG3D_CI_TESTS}/Various_ref_Linkrods_met0.05_hausd0.01/linkrods.o.meshb)
ADD_TEST(NAME Various_ref_Linkrods_met0.05_hausd0.001
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/Various_ref_Linkrods_met0.05_hausd0.001/linkrods
  -hausd 0.001
  ${MMG3D_CI_TESTS}/Various_ref_Linkrods_met0.05_hausd0.001/linkrods.o.meshb)

# Third: We refine some parts and unrefined others
ADD_TEST(NAME Various_refunref_Santa_met0.05_hausd0.001_ar90
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/Various_refunref_Santa_met0.05_hausd0.001_ar90/santa
  -hausd 0.001 -ar 90
  ${MMG3D_CI_TESTS}/Various_refunref_Santa_met0.05_hausd0.001_ar90/santa.o.meshb)
ADD_TEST(NAME Various_refunref_Santa_met0.05_hausd0.0001_ar90
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/Various_refunref_Santa_met0.05_hausd0.0001_ar90/santa
  -hausd 0.0001 -ar 90
  ${MMG3D_CI_TESTS}/Various_refunref_Santa_met0.05_hausd0.0001_ar90/santa.o.meshb)

# 4: Refinment on a solution
IF ( PATTERN )
ADD_TEST(NAME Various_adpsol_hgrad1_M6Mach_Eps0.001_hmin0.001_hmax2
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/Various_adpsol_hgrad1_M6Mach_Eps0.001_hmin0.001_hmax2/M6
  -sol ${MMG3D_CI_TESTS}/Various_adpsol_hgrad1_M6Mach_Eps0.001_hmin0.001_hmax2/metM6.sol
  -hausd 0.1 -ar 60
  ${MMG3D_CI_TESTS}/Various_adpsol_hgrad1_M6Mach_Eps0.001_hmin0.001_hmax2/M6.o.meshb)
ADD_TEST(NAME Various_adpsol_hgrad1_M6Mach_Eps0.0005_hmin0.0001_hmax3
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/Various_adpsol_hgrad1_M6Mach_Eps0.0005_hmin0.0001_hmax3/M6
  -sol
  ${MMG3D_CI_TESTS}/Various_adpsol_hgrad1_M6Mach_Eps0.0005_hmin0.0001_hmax3/metM6.sol
  -hausd 0.1 -ar 60
  ${MMG3D_CI_TESTS}/Various_adpsol_hgrad1_M6Mach_Eps0.0005_hmin0.0001_hmax3/M6.o.meshb)
ELSE ()
ADD_TEST(NAME Various_adpsol_hgrad1_M6Mach_Eps0.001_hmin0.001_hmax2
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/Various_adpsol_hgrad1_M6Mach_Eps0.001_hmin0.001_hmax2/M6
  -sol ${MMG3D_CI_TESTS}/Various_adpsol_hgrad1_M6Mach_Eps0.001_hmin0.001_hmax2/metM6.sol
  -hausd 0.1 -ar 60 -bucket 800
  ${MMG3D_CI_TESTS}/Various_adpsol_hgrad1_M6Mach_Eps0.001_hmin0.001_hmax2/M6.o.meshb)
ADD_TEST(NAME Various_adpsol_hgrad1_M6Mach_Eps0.0005_hmin0.0001_hmax3
  COMMAND ${EXECUT} -v 5
  ${MMG3D_CI_TESTS}/Various_adpsol_hgrad1_M6Mach_Eps0.0005_hmin0.0001_hmax3/M6
  -sol
  ${MMG3D_CI_TESTS}/Various_adpsol_hgrad1_M6Mach_Eps0.0005_hmin0.0001_hmax3/metM6.sol
  -hausd 0.1 -ar 60 -bucket 800
  ${MMG3D_CI_TESTS}/Various_adpsol_hgrad1_M6Mach_Eps0.0005_hmin0.0001_hmax3/M6.o.meshb)
ENDIF()

# Test the Ls option
ADD_TEST(NAME OptLs_cube303d_hminMax_hgrad1.2_hausd0.005
  COMMAND ${EXECUT} -ls
  ${MMG3D_CI_TESTS}/OptLs_cube303d_hminMax_hgrad1.2_hausd0.005/cube303d
  -sol ${MMG3D_CI_TESTS}/OptLs_cube303d_hminMax_hgrad1.2_hausd0.005/cube303d.sol
  -hausd 0.005 -nr -hgrad 1.2 -hmin 0.001 -hmax 0.1
  ${MMG3D_CI_TESTS}/OptLs_cube303d_hminMax_hgrad1.2_hausd0.005/cube303d.o.meshb)
ADD_TEST(NAME OptLs_temp_hminMax_hgrad1.2_hausd0.1
  COMMAND ${EXECUT} -v 6 -d -ls
  ${MMG3D_CI_TESTS}/OptLs_temp_hminMax_hgrad1.2_hausd0.1/temp
  -sol ${MMG3D_CI_TESTS}/OptLs_temp_hminMax_hgrad1.2_hausd0.1/temp.sol
  -hausd 0.1 -nr -hgrad 1.2 -hmin 3 -hmax 4
  ${MMG3D_CI_TESTS}/OptLs_temp_hminMax_hgrad1.2_hausd0.1/temp.o.meshb)


# Test multi-domain remeshing
ADD_TEST(NAME MultiDom_Cube
  COMMAND ${EXECUT} -v 6 -hmax 0.02 ${MMG3D_CI_TESTS}/MultiDom_Cube/c
  -out ${MMG3D_CI_TESTS}/MultiDom_Cube/c.o.meshb)

ADD_TEST(NAME MultiDom_Ellipse
  COMMAND ${EXECUT} -v 6 -hausd 0.0003 ${MMG3D_CI_TESTS}/MultiDom_Ellipse/c.d
  -out ${MMG3D_CI_TESTS}/MultiDom_Ellipse/c.d.o.meshb)

# Non-manifold test case
ADD_TEST(NAME NM_Cube
  COMMAND ${EXECUT} -v 6 -d -hmax 0.05 ${MMG3D_CI_TESTS}/NM_Cube/nm
  -out ${MMG3D_CI_TESTS}/NM_Cube/nm.o.meshb)


# Compare with a reference result when we run
#ADD_TEST(NAME RefCube
#  COMMAND ${EXECUT} -v 5
#  ${MMG3D_CI_TESTS}/RefCube/cube) marre... a finir




###############################################################################
#####
#####         Bug Fix
#####
###############################################################################
#####
ADD_TEST(NAME BUG_OptLsSingularities
 COMMAND ${EXECUT} -v 5 -ls
 ${MMG3D_CI_TESTS}/BUG_OptLsSingularities/test4
 ${MMG3D_CI_TESTS}/BUG_OptLsSingularities/test4.o.meshb)

ADD_TEST(NAME TestDoSol_1
 COMMAND ${EXECUT} -v 5 -hgrad -1 -hausd 1 -m 100
 ${MMG3D_CI_TESTS}/TestDoSol_1/66_shaver3.mesh
 ${MMG3D_CI_TESTS}/TestDoSol_1/66_shaver3.o.meshb)
