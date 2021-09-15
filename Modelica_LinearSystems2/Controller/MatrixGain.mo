within Modelica_LinearSystems2.Controller;
block MatrixGain
  "Output the product of a gain matrix with the input signal vector. The matrix can be loaded from a file optionally"

  extends Modelica.Blocks.Interfaces.MIMO(
    final nin=size(K2, 2),
    final nout=size(K2, 1));
  extends Controller.Icons.PartialBlockIcon(cont=false);

  parameter Boolean matrixOnFile=false
    "True, if matrix should be read from file";
  parameter String fileName=Modelica_LinearSystems2.DataDir + "k.mat"
    "Name of the matrix data file"
    annotation(Dialog(
        loadSelector(
          filter="MAT files (*.mat);; All files (*.*)",
          caption="matrix data file"),
        enable = matrixOnFile));
  parameter String matrixName="K" "Name of the matrix" annotation(Dialog(enable = matrixOnFile));

  parameter Real K[:,:]=[1] "Matrix  gain" annotation(Dialog(enable = not matrixOnFile));

protected
  parameter Integer mn[2]=if matrixOnFile then
    Modelica.Utilities.Streams.readMatrixSize(fileName, matrixName) else size(K);
  parameter Integer m=mn[1];
  parameter Integer n=mn[2];
  parameter Real K2[:,:]=if matrixOnFile then
    Modelica.Utilities.Streams.readRealMatrix(fileName, matrixName, m, n) else K;

equation
  y = K2*u;
  annotation (
    Documentation(info="<html>
<p>
This block is similar to Modelica.Blocks.Math.MatrixGain. Additionally
this block offers to load the matrix from a MATLAB-file. It
computes output vector <strong>y</strong> as <em>product</em> of the
gain matrix <strong>K</strong> with the input signal vector <strong>u</strong>:
</p>
<pre>
    <strong>y</strong> = <strong>K</strong> * <strong>u</strong>;
</pre>
<p>
Example:
</p>
<pre>
   parameter: <strong>K</strong> = [0.12 2; 3 1.5]

   results in the following equations:

     | y[1] |     | 0.12  2.00 |   | u[1] |
     |      |  =  |            | * |      |
     | y[2] |     | 3.00  1.50 |   | u[2] |
</pre>
</html>"), Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={Text(
          extent={{-88,-62},{92,58}},
          lineColor={160,160,164},
          textString="*[kij]")}));
end MatrixGain;
