within Modelica_LinearSystems2.Utilities.Streams;
function readMatrixC "Read the output matrix of the state space form of a system from MATLAB MAT file"
  extends Modelica.Icons.Function;
  extends Modelica_LinearSystems2.Utilities.Streams.Internal.readStateSpaceMatrix;

public
  output Real C[ny,nx] = matrixABCD[nx + 1:nx + ny, 1:nx];
algorithm

  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
C = Streams.<strong>readMatrixC</strong>(fileName, matrixName)
</pre></blockquote>

<h4>Description</h4>
<p>
This function opens the given MATLAB MAT file
and reads the given <b>output matrix&nbsp;C</b> of a state space system from this file.
</p>
</html>"));
end readMatrixC;
