within Modelica_LinearSystems2.Utilities.Streams;
function readMatrixB "Read the input matrix of the state space form of a system from MATLAB MAT file"
  extends Modelica.Icons.Function;
  extends Modelica_LinearSystems2.Utilities.Streams.Internal.readStateSpaceMatrix;

public
  output Real B[nx,nu] = matrixABCD[1:nx, nx + 1:nx + nu];
algorithm

  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
B = Streams.<strong>readMatrixB</strong>(fileName, matrixName)
</pre></blockquote>

<h4>Description</h4>
<p>
This function opens the given MATLAB MAT file
and reads the given <b>input matrix&nbsp;B</b> of a state space system from this file.
</p>
</html>"));
end readMatrixB;
