within Modelica_LinearSystems2.Controller.Examples.Components;
model DoublePendulum "Crane trolley system"

  parameter Modelica.SIunits.Mass m_trolley = 5 "Mass of trolley";
  parameter Modelica.SIunits.Mass m_load = 20 "Mass of load on 2nd arm";
  parameter Modelica.SIunits.Length length = 2
    "Total length of double pendulum (i.e. length of each arm = length/2)";
  parameter Modelica.SIunits.Angle phi1_start = -80.0/180*pi
    "Initial rotation angle of 1st arm relative to trolley";
  parameter Modelica.SIunits.Angle phi2_start = 10
    "Initial rotation angle of 2nd arm relative to 1st arm";
  parameter Modelica.SIunits.AngularVelocity w1_start = 0.0
    "Initial angular velocity of 1st arm relative to trolley";
  parameter Modelica.SIunits.AngularVelocity w2_start = 0.0
    "Initial angular velocity of 2nd arm relative to 1st arm";

  constant Real pi = Modelica.Constants.pi;

  inner Modelica.Mechanics.MultiBody.World world(animateWorld=false,
      animateGravity=false)
                        annotation (Placement(transformation(extent={{-140,-80},
            {-120,-60}},
                      rotation=0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange=true)
    annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  Modelica.Mechanics.Translational.Components.Damper damper1(d=0)
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute rev(n={0,0,1},useAxisFlange=true,
    phi(fixed=true, start=phi1_start),
    w(fixed=true, start=w1_start))
                               annotation (Placement(transformation(extent={{-40,0},
            {-20,20}},      rotation=0)));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=0)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}},
                                                                   rotation=0)));
  Modelica.Mechanics.MultiBody.Parts.Body body(
    m=m_load,
    r_CM={0,0,0},
    specularCoefficient=4*world.defaultSpecularCoefficient,
    sphereDiameter=1.5*world.defaultBodyDiameter)
    annotation (Placement(transformation(extent={{80,0},{100,20}},rotation=0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(
    shapeType="box",
    m=m_trolley,
    sphereDiameter=world.defaultBodyDiameter,
    r={0,0,0},
    r_CM={0,0,0})
    annotation (Placement(transformation(extent={{-70,0},{-50,20}})));
  Modelica.Mechanics.Translational.Sources.Force force
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-190,-20},{-150,20}}),
        iconTransformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput s
    annotation (Placement(transformation(extent={{150,90},{170,110}}),
        iconTransformation(extent={{100,90},{120,110}})));
  Modelica.Blocks.Interfaces.RealOutput v
    annotation (Placement(transformation(extent={{150,50},{170,70}}),
        iconTransformation(extent={{100,50},{120,70}})));
 Modelica.Blocks.Interfaces.RealOutput phi
    annotation (Placement(transformation(extent={{150,10},{170,30}}),
        iconTransformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Interfaces.RealOutput w
    annotation (Placement(transformation(extent={{150,-30},{170,-10}}),
        iconTransformation(extent={{100,-30},{120,-10}})));

  Modelica.Blocks.Sources.Constant const(k=0.5*Modelica.Constants.pi)
    annotation (Placement(transformation(extent={{98,34},{110,46}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{120,30},{140,10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(
    phi(fixed=true, start=phi2_start),
    w(fixed=true, start=w2_start),
    cylinderDiameter=3*world.defaultJointWidth,
    cylinderColor={0,0,200})                             annotation (Placement(transformation(extent={{20,0},{
            40,20}}, rotation=0)));
 Modelica.Blocks.Interfaces.RealOutput phi1
    annotation (Placement(transformation(extent={{150,-70},{170,-50}}),
        iconTransformation(extent={{100,-70},{120,-50}})));
  Modelica.Blocks.Interfaces.RealOutput w1
    annotation (Placement(transformation(extent={{150,-110},{170,-90}}),
        iconTransformation(extent={{100,-110},{120,-90}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{120,-70},{140,-50}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{98,-82},{110,-70}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder(
    r={length/2,0,0},
    specularCoefficient=0.7,
    color={0,0,0},
    diameter=0.05,
    density=900)
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder1(
    r={length/2,0,0},
    specularCoefficient=0.7,
    color={0,0,0},
    diameter=0.05,
    density=900)
    annotation (Placement(transformation(extent={{50,0},{70,20}})));
  Modelica.Mechanics.MultiBody.Sensors.RelativeSensor relativeSensorAng1(
    get_w_rel=true,
    get_angles=true,
    animation=false)
    annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
  Modelica.Mechanics.MultiBody.Sensors.RelativeSensor relativeSensorAng2(
    get_w_rel=true,
    get_angles=true,
    animation=false)
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  Modelica.Mechanics.MultiBody.Sensors.RelativeSensor relativeSensorPrismatic(
    animation=false,
    get_r_rel=true,
    get_v_rel=true)
    annotation (Placement(transformation(extent={{-100,-30},{-80,-10}})));
equation
  connect(damper.flange_b, rev.axis) annotation (Line(points={{-20,30},{-20,30},
          {-20,22},{-20,20},{-30,20}},
                                  color={0,0,0}));
  connect(rev.support, damper.flange_a) annotation (Line(points={{-36,20},{-36,20},
          {-40,20},{-40,30}},              color={0,0,0}));
  connect(bodyShape.frame_b, rev.frame_a) annotation (Line(
      points={{-50,10},{-40,10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic.frame_a, world.frame_b) annotation (Line(
      points={{-100,10},{-110,10},{-110,-70},{-120,-70}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(force.flange, prismatic.axis) annotation (Line(
      points={{-80,50},{-80,16},{-82,16}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(damper1.flange_a, prismatic.support) annotation (Line(
      points={{-100,30},{-100,16},{-94,16}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(damper1.flange_b, prismatic.axis) annotation (Line(
      points={{-80,30},{-80,16},{-82,16}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(prismatic.frame_b, bodyShape.frame_a) annotation (Line(
      points={{-80,10},{-70,10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(u, force.f) annotation (Line(
      points={{-170,0},{-140,0},{-140,50},{-102,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(relativeSensorAng1.w_rel[3], w) annotation (Line(
      points={{-24,-30.3333},{-24,-46},{80,-46},{80,-20},{160,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(relativeSensorPrismatic.v_rel[1], v) annotation (Line(
      points={{-96,-31.6667},{-96,-40},{-46,-40},{-46,60},{160,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(relativeSensorPrismatic.r_rel[1], s) annotation (Line(
      points={{-100,-31.6667},{-100,-36},{-74,-36},{-74,100},{160,100}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(phi, phi) annotation (Line(
      points={{160,20},{160,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, phi) annotation (Line(
      points={{141,20},{160,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, add.u2) annotation (Line(
      points={{110.6,40},{114,40},{114,26},{118,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.u1, relativeSensorAng1.angles[3]) annotation (Line(
      points={{118,14},{112,14},{112,-10},{60,-10},{60,-40},{-28,-40},{-28,
          -30.3333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, add1.u2)
                           annotation (Line(
      points={{110.6,-76},{114,-76},{114,-66},{118,-66}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.u1, relativeSensorAng2.angles[3]) annotation (Line(
      points={{118,-54},{32,-54},{32,-30.3333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, phi1) annotation (Line(
      points={{141,-60},{160,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(relativeSensorAng2.w_rel[3], w1) annotation (Line(
      points={{36,-30.3333},{36,-100},{160,-100}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bodyCylinder1.frame_b, body.frame_a) annotation (Line(
      points={{70,10},{80,10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(bodyCylinder1.frame_a, revolute2.frame_b) annotation (Line(
      points={{50,10},{40,10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(bodyCylinder.frame_b, revolute2.frame_a) annotation (Line(
      points={{10,10},{20,10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(bodyCylinder.frame_a, rev.frame_b) annotation (Line(
      points={{-10,10},{-20,10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(relativeSensorAng1.frame_a, rev.frame_a) annotation (Line(
      points={{-40,-20},{-40,10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(relativeSensorAng1.frame_b, rev.frame_b) annotation (Line(
      points={{-20,-20},{-20,10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revolute2.frame_a, relativeSensorAng2.frame_a) annotation (Line(
      points={{20,10},{20,-20}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revolute2.frame_b, relativeSensorAng2.frame_b) annotation (Line(
      points={{40,10},{40,-20}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic.frame_a, relativeSensorPrismatic.frame_a) annotation (Line(
      points={{-100,10},{-100,-20}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic.frame_b, relativeSensorPrismatic.frame_b) annotation (Line(
      points={{-80,10},{-80,-20}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  annotation (
    experiment(
      StartTime=1,
      StopTime=10,
      Algorithm="Dassl"),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-150,-100},{150,100}},
        grid={2,2}), graphics),
    Documentation(info="<html>
 
Model of a simple double pendulum system. <br>
The physical Model is used in Modelica_LinearSystems2.Examples.StateSpace.doublePendulumController where it is being
linearized an used as a base for linear controller design. The results are used to control the crane system
in Modelica_LinearSystems2.Controller.Examples.DoublePendulum.mo
 
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-82,22},{82,18}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Forward),
        Rectangle(extent={{-44,54},{0,28}}, lineColor={0,0,0}),
        Ellipse(
          extent={{-40,34},{-28,22}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255},
          lineThickness=0.5),
        Ellipse(
          extent={{-16,34},{-4,22}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=0.5),
        Line(
          points={{-18,-16},{10,-62}},
          color={0,0,0},
          smooth=Smooth.None),
        Ellipse(
          extent={{4,-56},{20,-72}},
          lineColor={0,0,0},
          fillColor={0,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-25,44},{-19,38}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Line(
          points={{28,46},{4,46}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{34,40},{10,40}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-22,40},{-18,-16}},
          color={0,0,0},
          smooth=Smooth.None),
        Ellipse(
          extent={{-20,-15},{-14,-21}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,140},{150,100}},
          lineColor={0,0,255},
          textString="%name")}));
end DoublePendulum;
