within Modelica_LinearSystems2.Controller.Examples;
model DoublePendulum "Crane trolley controlled by a state feedback controller"
  extends Modelica.Icons.Example;
  extends Templates.SimpleStateSpaceControl(
    redeclare Components.DoublePendulum2 plant(
      additionalMeasurableOutputs=true,
      m_trolley=5,
      m_load=20,
      length=2,
      n=6,
      l=6,
      phi1_start=-0.69813170079773,
      phi2_start=-0.34906585039887),
    preFilter(
      matrixName="M_pa",
      fileName=Modelica_LinearSystems2.DataDir + "doublePendulumController.mat",
      matrixOnFile=true),
    feedbackMatrix(
      matrixOnFile=true,
      matrixName="K_pa",
      fileName=Modelica_LinearSystems2.DataDir + "doublePendulumController.mat"),
    sampleClock(sampleTime=0.01, blockType=Modelica_LinearSystems2.Controller.Types.BlockType.Continuous));

  Modelica.Blocks.Sources.Pulse pulse(
    offset=0,
    amplitude=3,
    width=50,
    startTime=5,
    period=10)
              annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  FirstOrder firstOrder(T=0.25)
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
equation
  connect(firstOrder.u, pulse.y) annotation (Line(
      points={{-72,0},{-76,0},{-76,0},{-79,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(firstOrder.y, preFilter.u[1]) annotation (Line(
      points={{-49,0},{-46,0},{-46,0},{-42,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    experiment(
      StopTime=40,
      NumberOfIntervals=2000,
      Tolerance=1e-005),
    Documentation(info="<html>
<p>
This example shows a control system with constant state feedback.
The system model of a crane trolley system is taken from [1]. The
feedback matrix and the pre filter can be loaded from MATLAB files.
<!-- The following text was commented by Tobolar (DLR) since the example
cited is still in WorkInProgress (see also documentation source of
other examples of double pendulum):
By default, this files are generated by call of
<a href=\"Modelica_LinearSystems2.WorkInProgress.StateSpace.Examples.designCraneController\">
Examples.StateSpace.designCraneController</a>.
-->
</p>

<h4><a name=\"References\">References</a></h4>
<dl>
<dt>&nbsp;[1] F&ouml;llinger O.:</dt>
<dd> <b>Regelungstechnik</b>.
     H&uuml;thig-Verlag.<br>&nbsp;</dd>
</dl>
</html>"));
end DoublePendulum;
