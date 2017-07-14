within Modelica_LinearSystems2.Utilities.Streams;
function readMatrixD "Read the feed forward matrix of the state space form of a system from MATLAB MAT file"
  extends Modelica.Icons.Function;
  extends Modelica_LinearSystems2.Utilities.Streams.Internal.readStateSpaceMatrix;

public
  output Real D[ny,nu] = matrixABCD[nx + 1:nx + ny, nx + 1:nx + nu];
algorithm

  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
D = Streams.<strong>readMatrixD</strong>(fileName, matrixName)
</pre></blockquote>

<h4>Description</h4>
<p>
This function opens the given MATLAB MAT file
and reads the given <b>feed forward matrix&nbsp;D</b> of a state space system from this file.
</p>
</html>"));
end readMatrixD;
