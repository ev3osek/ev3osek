<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:418b8b47-9721-4050-9bc9-93530e3b68a5(oil.timer.structure)">
  <persistence version="9" />
  <languages>
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="1" />
  </languages>
  <imports>
    <import index="u1z9" ref="r:bd641933-ad1e-436e-ae92-247a9a3b4aa2(oil.core.structure)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="mj1l" ref="r:c371cf98-dcc8-4a43-8eb8-8a8096de18b2(com.mbeddr.core.expressions.structure)" implicit="true" />
    <import index="sxb1" ref="r:e0f1041f-50c7-4cb6-be85-b08f97c50ebb(oil.task.structure)" implicit="true" />
    <import index="rx5q" ref="r:8e560f65-464b-43d8-97bf-faadc37f178e(oil.event.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="4628067390765907488" name="conceptShortDescription" index="R4oN_" />
        <property id="1587916991969465369" name="conceptId" index="1pbfSe" />
        <child id="1071489727083" name="linkDeclaration" index="1TKVEi" />
        <child id="1071489727084" name="propertyDeclaration" index="1TKVEl" />
      </concept>
      <concept id="1169125989551" name="jetbrains.mps.lang.structure.structure.InterfaceConceptDeclaration" flags="ig" index="PlHQZ" />
      <concept id="1169127622168" name="jetbrains.mps.lang.structure.structure.InterfaceConceptReference" flags="ig" index="PrWs8">
        <reference id="1169127628841" name="intfc" index="PrY4T" />
      </concept>
      <concept id="1071489090640" name="jetbrains.mps.lang.structure.structure.ConceptDeclaration" flags="ig" index="1TIwiD">
        <reference id="1071489389519" name="extends" index="1TJDcQ" />
        <child id="1169129564478" name="implements" index="PzmwI" />
      </concept>
      <concept id="1071489288299" name="jetbrains.mps.lang.structure.structure.PropertyDeclaration" flags="ig" index="1TJgyi">
        <reference id="1082985295845" name="dataType" index="AX2Wp" />
      </concept>
      <concept id="1071489288298" name="jetbrains.mps.lang.structure.structure.LinkDeclaration" flags="ig" index="1TJgyj">
        <property id="1071599776563" name="role" index="20kJfa" />
        <property id="1071599893252" name="sourceCardinality" index="20lbJX" />
        <property id="1071599937831" name="metaClass" index="20lmBu" />
        <reference id="1071599976176" name="target" index="20lvS9" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="1TIwiD" id="5KtH1a6jX_3">
    <property role="TrG5h" value="Counter" />
    <property role="R4oN_" value="Base for alarms" />
    <property role="1pbfSe" value="496136875" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="5KtH1a6kbwH" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyj" id="78S7ngm5xPc" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="maxAllowedValue" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="78S7ngm5xPv" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="ticksPerBase" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="78S7ngm5xPy" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="minCycle" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956fc">
    <property role="TrG5h" value="Alarm" />
    <property role="R4oN_" value="do something periodically" />
    <property role="1pbfSe" value="1633198294" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956fd" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6gkR" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="appModes" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="u1z9:1x4fgD956_n" resolve="AppModeType" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_WYwf" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="autostart" />
      <ref role="20lvS9" node="7FCpXS_WSTn" resolve="AlarmAutostart" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_WYQV" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="action" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="7FCpXS_WYzo" resolve="IAlarmAction" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_WYu$" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="counter" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="5KtH1a6jX_3" resolve="Counter" />
    </node>
  </node>
  <node concept="1TIwiD" id="7FCpXS_WYDG">
    <property role="TrG5h" value="AlarmActionActivateTask" />
    <property role="R4oN_" value="action, that activates a task, if an alarm expires" />
    <property role="1pbfSe" value="1596173750" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7FCpXS_WYGX" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="task" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" to="sxb1:1x4fgD956cc" resolve="Task" />
    </node>
    <node concept="PrWs8" id="7FCpXS_WYDH" role="PzmwI">
      <ref role="PrY4T" node="7FCpXS_WYzo" resolve="IAlarmAction" />
    </node>
  </node>
  <node concept="1TIwiD" id="7FCpXS_WYAv">
    <property role="TrG5h" value="AlarmActionCallback" />
    <property role="R4oN_" value="defines a callback, that should be called, if a alarm is fired" />
    <property role="1pbfSe" value="1596173955" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyi" id="7FCpXS_WYAw" role="1TKVEl">
      <property role="TrG5h" value="callbackName" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="PrWs8" id="62xxBiE6Vbk" role="PzmwI">
      <ref role="PrY4T" node="7FCpXS_WYzo" resolve="IAlarmAction" />
    </node>
  </node>
  <node concept="1TIwiD" id="7FCpXS_WYIB">
    <property role="TrG5h" value="AlarmActionSetEvent" />
    <property role="R4oN_" value="action, that sets an event, if an alarm expires" />
    <property role="1pbfSe" value="1596173435" />
    <ref role="1TJDcQ" node="7FCpXS_WYDG" resolve="AlarmActionActivateTask" />
    <node concept="1TJgyj" id="7FCpXS_WYKh" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="event" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" to="rx5q:1x4fgD956iF" resolve="EventLiteral" />
    </node>
  </node>
  <node concept="1TIwiD" id="7FCpXS_WSTn">
    <property role="TrG5h" value="AlarmAutostart" />
    <property role="R4oN_" value="properties for an autostarting alarm" />
    <property role="1pbfSe" value="1596197323" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="78S7ngm5xPA" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="alarmTime" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="78S7ngm5xPC" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="cycleTime" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_WSQo" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="appModes" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="u1z9:1x4fgD956_n" resolve="AppModeType" />
    </node>
  </node>
  <node concept="PlHQZ" id="7FCpXS_WYzo">
    <property role="TrG5h" value="IAlarmAction" />
    <property role="1pbfSe" value="1596174154" />
  </node>
  <node concept="1TIwiD" id="3nHUyvAzu98">
    <property role="1pbfSe" value="477875311" />
    <property role="TrG5h" value="CounterType" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="3nHUyvAzu9b" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="Counter" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="5KtH1a6jX_3" resolve="Counter" />
    </node>
  </node>
</model>

