<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:e0f1041f-50c7-4cb6-be85-b08f97c50ebb(oil.task.structure)">
  <persistence version="9" />
  <languages>
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="1" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="vs0r" ref="r:f7764ca4-8c75-4049-922b-08516400a727(com.mbeddr.core.base.structure)" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="mj1l" ref="r:c371cf98-dcc8-4a43-8eb8-8a8096de18b2(com.mbeddr.core.expressions.structure)" implicit="true" />
    <import index="qx8g" ref="r:264779d5-6695-4b5b-ba0a-eb616299242f(oil.message.structure)" implicit="true" />
    <import index="yf3" ref="r:5ec975bd-2614-4742-bf8e-649686402e56(oil.resource.structure)" implicit="true" />
    <import index="u1z9" ref="r:bd641933-ad1e-436e-ae92-247a9a3b4aa2(oil.core.structure)" implicit="true" />
    <import index="rx5q" ref="r:8e560f65-464b-43d8-97bf-faadc37f178e(oil.event.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="1082978164219" name="jetbrains.mps.lang.structure.structure.EnumerationDataTypeDeclaration" flags="ng" index="AxPO7">
        <property id="1212080844762" name="hasNoDefaultMember" index="PDuV0" />
        <property id="1197591154882" name="memberIdentifierPolicy" index="3lZH7k" />
        <reference id="1083171729157" name="memberDataType" index="M4eZT" />
        <child id="1083172003582" name="member" index="M5hS2" />
      </concept>
      <concept id="1083171877298" name="jetbrains.mps.lang.structure.structure.EnumerationMemberDeclaration" flags="ig" index="M4N5e">
        <property id="1083923523172" name="externalValue" index="1uS6qo" />
        <property id="1083923523171" name="internalValue" index="1uS6qv" />
      </concept>
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="4628067390765907488" name="conceptShortDescription" index="R4oN_" />
        <property id="5092175715804935370" name="conceptAlias" index="34LRSv" />
        <property id="1587916991969465369" name="conceptId" index="1pbfSe" />
        <child id="1071489727083" name="linkDeclaration" index="1TKVEi" />
        <child id="1071489727084" name="propertyDeclaration" index="1TKVEl" />
      </concept>
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
  <node concept="1TIwiD" id="1x4fgD956tm">
    <property role="TrG5h" value="TaskRef" />
    <property role="1pbfSe" value="1633199200" />
    <ref role="1TJDcQ" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    <node concept="1TJgyj" id="1x4fgD956tn" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="task" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="1x4fgD956cc" resolve="Task" />
    </node>
    <node concept="PrWs8" id="1Y5JHpRyyu$" role="PzmwI">
      <ref role="PrY4T" to="vs0r:7jSUHHvkAp9" resolve="IModuleContentRef" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956cc">
    <property role="TrG5h" value="Task" />
    <property role="R4oN_" value="an OIL Task" />
    <property role="1pbfSe" value="1633198102" />
    <property role="34LRSv" value="task" />
    <ref role="1TJDcQ" to="mj1l:68dbbc7rHp$" resolve="UnsignedIntegerLiteral" />
    <node concept="1TJgyj" id="78S7ngm5xPF" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="priority" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="78S7ngm5xPJ" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="activationAmount" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
    <node concept="PrWs8" id="1Y5JHpRyzZt" role="PzmwI">
      <ref role="PrY4T" to="vs0r:65XyadYKJgN" resolve="IIdentifierNamedConcept" />
    </node>
    <node concept="1TJgyj" id="4F1Ib7ChyLh" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="messages" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="qx8g:1x4fgD956$h" resolve="MessageType" />
    </node>
    <node concept="1TJgyj" id="4F1Ib7ChyLB" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="resources" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="yf3:1x4fgD956dR" resolve="ResourceRef" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6fOz" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="appModes" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="u1z9:1x4fgD956_n" resolve="AppModeType" />
    </node>
    <node concept="1TJgyi" id="3QwuWjHllkV" role="1TKVEl">
      <property role="TrG5h" value="schedule" />
      <ref role="AX2Wp" node="3QwuWjHllky" resolve="Schedule" />
    </node>
  </node>
  <node concept="1TIwiD" id="4F1Ib7ChyL$">
    <property role="TrG5h" value="ExtendedTask" />
    <property role="R4oN_" value="an extended task is a task and can also use events" />
    <property role="1pbfSe" value="856155413" />
    <property role="34LRSv" value="extendedTask" />
    <ref role="1TJDcQ" node="1x4fgD956cc" resolve="Task" />
    <node concept="1TJgyj" id="4F1Ib7ChyL_" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="events" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="rx5q:1x4fgD956ve" resolve="EventRef" />
    </node>
  </node>
  <node concept="AxPO7" id="3QwuWjHllky">
    <property role="TrG5h" value="Schedule" />
    <property role="PDuV0" value="true" />
    <property role="3lZH7k" value="derive_from_internal_value" />
    <ref role="M4eZT" to="tpck:fKAOsGN" resolve="string" />
    <node concept="M4N5e" id="3QwuWjHllkz" role="M5hS2">
      <property role="1uS6qv" value="FULL" />
      <property role="1uS6qo" value="full-preemptive" />
    </node>
    <node concept="M4N5e" id="3QwuWjHllk$" role="M5hS2">
      <property role="1uS6qv" value="NON" />
      <property role="1uS6qo" value="non-preemptive" />
    </node>
  </node>
  <node concept="1TIwiD" id="2ZNMQTB12lN">
    <property role="1pbfSe" value="1762135839" />
    <property role="TrG5h" value="TaskMacro" />
    <property role="34LRSv" value="TASK" />
    <ref role="1TJDcQ" to="x27k:5_l8w1EmTvx" resolve="Function" />
    <node concept="1TJgyj" id="2ZNMQTB12lR" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="oilTask" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="1x4fgD956cc" resolve="Task" />
    </node>
  </node>
  <node concept="1TIwiD" id="4NwoSLUgvyg">
    <property role="1pbfSe" value="954049508" />
    <property role="TrG5h" value="TerminateTaskStatement" />
    <property role="34LRSv" value="terminate" />
    <ref role="1TJDcQ" to="x27k:7LOsK3rQkU_" resolve="ReturnStatement" />
  </node>
</model>

