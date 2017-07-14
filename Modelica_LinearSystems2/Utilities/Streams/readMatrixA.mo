within Modelica_LinearSystems2.Utilities.Streams;
function readMatrixA "Read the state matrix of the state space form of a system from MATLAB MAT file"
  extends Modelica.Icons.Function;
  extends Modelica_LinearSystems2.Utilities.Streams.Internal.readStateSpaceMatrix;

public
  output Real A[nx,nx] = matrixABCD[1:nx, 1:nx];

algorithm

  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
A = Streams.<strong>readMatrixA</strong>(fileName, matrixName)
</pre></blockquote>

<h4>Description</h4>
<p>
This function opens the given MATLAB MAT file
and reads the given <b>state matrix&nbsp;A</b> of a state space system from this file.
</p>
</html>"));
end readMatrixA;
