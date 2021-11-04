# BMT_ogs6
from GMSH to working prj for OGS6

Three folders, for three different tools.

0_GMSH: gmsh, generating the mesh via gmsh

1_OGSTOOLS: all the ogs tools needed to convert the gmsh mesh to a quadratic mesh with boundaries to run an OGS6 simulation. Paraview is still needed for a short step (injection zone definition). In principle it can be included in the GMSH file, for flexibility at the moment is here.

2_OGS6: all the input generated from folders 0_ and 1_ , with the set-up of the model to solve for a  <type>HYDRO_MECHANICS</type> with            <coupling_scheme>staggered</coupling_scheme>
