within Modelica_LinearSystems2.Utilities.Streams;
function readMatrixABCD "Read the generalized state space matrix of a system from MATLAB MAT file"
  extends Modelica.Icons.Function;
  extends Modelica_LinearSystems2.Utilities.Streams.Internal.readStateSpaceMatrix;

public
  output Real ABCD[nx + ny, nx + nu] = matrixABCD[1:nx + ny, 1:nx + nu];

algorithm

  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
ABCD = Streams.<strong>readMatrixABCD</strong>(fileName, matrixName)
</pre></blockquote>

<h4>Description</h4>
<p>
This function opens the given MATLAB MAT file
and reads the given matrix of a state space system from this file.
</p>
</html>"));
end readMatrixABCD;
