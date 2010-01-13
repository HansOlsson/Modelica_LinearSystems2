within Modelica_LinearSystems2.Math.Matrices;
function conditionNumber "Calculate the condition number norm(A)*norm(inv(A))"
  extends Modelica.Icons.Function;

  input Real A[:,:] "Input matrix";
  input Real p(min=1) = 2
    "Type of p-norm (only allowed: 1, 2 or Modelica.Constants.inf)";
  output Real result=0.0 "p-norm of matrix A";

protected
  Real eps=1e-25;
  Real s[size(A, 1)] "singular values";

algorithm
  if p == 2 then
    s := Modelica.Math.Matrices.singularValues(A);
    if min(s) < eps then
result := Modelica.Constants.inf;
    else
result := max(s)/min(s);
    end if;
  else
    result := Modelica.Math.Matrices.norm(A, p)*Modelica.Math.Matrices.norm(
      Modelica.Math.Matrices.inv(A), p);
  end if;

  annotation (Documentation(info="<html>
  <h4>Syntax</h4>
<blockquote><pre>
r = Matrices.<b>conditionNumber</b>(A);
</pre></blockquote>
<h4>Description</h4>
<p>
This function calculates the the condition number (norm(A) * norm(inv(A))) of a general real matrix A, in either the 1-norm, 2-norm or the infinity-norm.
In the case of 2-norm the result is he ratio of the largest to the smallest singular value to A.
</p>
<p>
<h4>Example</h4>
<blockquote><pre>
  A = [1, 2
       2, 1];
  r = conditionNumber(A);
  
  results in:
  
  r = 3.0
</pre></blockquote>
</p>
<h4>See also</h4>
<a href=\"Modelica://Modelica_LinearSystems2.Math.Matrices.rcond\">Matrices.rcond</a>
</html>"));
end conditionNumber;