within Modelica_LinearSystems2.WorkInProgress.StateSpace.Conversion;
function toTransferFunction
  "Generate a transfer function from a SISO state space representation"

    import Modelica;
    import Modelica_LinearSystems2;
    import Modelica_LinearSystems2.TransferFunction;
    import Modelica_LinearSystems2.WorkInProgress.StateSpace;
    import Modelica_LinearSystems2.WorkInProgress.ZerosAndPoles;

  input StateSpace ss "StateSpace object";

  output TransferFunction tf;

protected
  ZerosAndPoles zp;

algorithm
  zp := Modelica_LinearSystems2.WorkInProgress.StateSpace.toZerosAndPoles(ss);
  tf := Modelica_LinearSystems2.WorkInProgress.ZerosAndPoles.Conversion.toTransferFunction(zp);

    annotation (Documentation(info="<html>
<h4>Syntax</h4>
<table>
<tr> <td align=right>  tf </td><td align=center> =  </td>  <td> StateSpace.Conversion.<b>toTransferFunction</b>(ss)  </td> </tr>
</table>
<h4>Description</h4>
<p>
Computes a TransferFunction record
<blockquote><pre>
           n(s)     b0 + b1*s + ... + bn*s^n
   tf = -------- = -------------------------- 
           d(s)     a0 + a1*s + ... + an*s^n
 </pre></blockquote>

The algorithm uses <a href=\"modelica://Modelica_LinearSystems2.StateSpace.Conversion.toZerosAndPoles\">toZerosAndPoles</a> to convert the state space system into a zeros and poles representation first and after that href=\"Modelica://Modelica_LinearSystems2.ZerosAndPoles.Conversion.toTransferFunction\">ZerosAndPoles.Conversion.toTransferFunction</a> to generate the transfer function.

<h4>Example</h4>
<blockquote><pre>
   Modelica_LinearSystems2.StateSpace ss=Modelica_LinearSystems2.StateSpace(
      A = [-1.0, 0.0, 0.0;
            0.0,-2.0, 0.0;
            0.0, 0.0,-3.0],
      B = [1.0;
           1.0;
           0.0],
      C = [1.0,1.0,1.0],
      D = [0.0]);

<b>algorithm</b>
  tf:=Modelica_LinearSystems2.StateSpace.Conversion.toZerosAndPoles(ss);
//             2*s + 3  
//   tf =  -----------------
             s^2 + 3*s + 2
</pre></blockquote>




</html> ",
         revisions="<html>
<ul>
<li><i>2010/05/31 </i>
       by Marcus Baur, DLR-RM</li>
</ul>
</html>"));
end toTransferFunction;
