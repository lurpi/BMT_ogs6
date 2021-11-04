#!/bin/bash

GMSH2OGS -i BMT_2d_D19.msh -o BMT_2d_test.vtu -e 
NodeReordering -i BMT_2d_test.vtu -o BMT_2d_test_reorder.vtu 

swapNodeCoordinateAxes -i BMT_2d_test_reorder.vtu  -0 BMT_2d_test_reorder_swap.vtu  -n yzx 

editMaterialID -i BMT_2d_test_reorder_swap.vtu -o BMT_2d_test_reorder_swap.vtu -r -m 50 -n 0 
editMaterialID -i BMT_2d_test_reorder_swap.vtu -o BMT_2d_test_reorder_swap.vtu -r -m 49 -n 1 
editMaterialID -i BMT_2d_test_reorder_swap.vtu -o BMT_2d_test_reorder_swap.vtu -r -m 48 -n 2 
editMaterialID -i BMT_2d_test_reorder_swap.vtu -o BMT_2d_test_reorder_swap.vtu -r -m 47 -n 3 
editMaterialID -i BMT_2d_test_reorder_swap.vtu -o BMT_2d_test_reorder_swap.vtu -r -m 46 -n 4 

createQuadraticMesh -i BMT_2d_test_reorder_swap.vtu  -o BMT_2d_test_quadratic.vtu

ExtractBoundary -i BMT_2d_test_quadratic.vtu  -o ext_b.vtu 
removeMeshElements -i ext_b.vtu -o top.vtu --y-max -0.001 
removeMeshElements -i ext_b.vtu -o bottom.vtu --y-min -19.999 
removeMeshElements -i ext_b.vtu -o right.vtu --x-max 19.999 
removeMeshElements -i ext_b.vtu -o left.vtu --x-min .001

# submesh for the injection points is generated manually in Paraview via crop tools, cropping the needed elements 
# output of paraview: BMT_2d_quad_inj_elems.vtu

ExtractBoundary -i BMT_2d_inj_elems_quadratic.vtu  -o ext_inj.vtu
