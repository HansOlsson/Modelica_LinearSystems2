within Modelica_LinearSystems2.Utilities.Streams.Internal;
function readStateSpaceMatrix "Read the ABCD matrix of the state space form of a system from MATLAB MAT file"
  extends Modelica.Icons.Function;
  import Modelica.Utilities.Streams;

  input String fileName = "dslin.mat" "File where matrixName data is stored"
    annotation (
      Dialog(
        loadSelector(
          filter="MAT files (*.mat);; All files (*.*)",
          caption="Open MATLAB MAT file")));
  input String matrixName = "ABCD"
    "Name of the generalized state space system matrix on file";

protected
  Integer xuy[3] = Modelica_LinearSystems2.Internal.Streams.ReadSystemDimension(fileName, matrixName);
  Integer nx = xuy[1];
  Integer nu = xuy[2];
  Integer ny = xuy[3];
  Real matrixABCD[nx + ny, nx + nu] = Streams.readRealMatrix(fileName, matrixName, nx + ny, nx + nu);

  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
() = Streams.<strong>readStateSpaceMatrix</strong>(fileName, matrixName)
</pre></blockquote>

<h4>Description</h4>
<p>
This function opens the given MATLAB MAT file
and reads the given matrix of a state space system from this file.
This function has no outputs, beining considered as a &quot;partial&quot;
function to be further extended.
Especially, operations on the protected <code>matrixABCD</code> can be
done in an extending function.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_LinearSystems2.Internal.Streams.ReadSystemDimension\">ReadSystemDimension</a>,
<a href=\"modelica://Modelica.Utilities.Streams.readRealMatrix\">Modelica.Utilities.Streams.readRealMatrix</a>
</p>
</html>"));
end readStateSpaceMatrix;
