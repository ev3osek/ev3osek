<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:bd641933-ad1e-436e-ae92-247a9a3b4aa2(oil.core.structure)">
  <persistence version="9" />
  <languages>
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="1" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="vs0r" ref="r:f7764ca4-8c75-4049-922b-08516400a727(com.mbeddr.core.base.structure)" implicit="true" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" implicit="true" />
    <import index="sxb1" ref="r:e0f1041f-50c7-4cb6-be85-b08f97c50ebb(oil.task.structure)" implicit="true" />
    <import index="bwbq" ref="r:aa04fc7a-6e20-48c4-b6ac-7c1ce8638ec4(de.whz.osek.structure)" implicit="true" />
    <import index="oo9t" ref="r:418b8b47-9721-4050-9bc9-93530e3b68a5(oil.timer.structure)" implicit="true" />
    <import index="rx5q" ref="r:8e560f65-464b-43d8-97bf-faadc37f178e(oil.event.structure)" implicit="true" />
    <import index="pm0g" ref="r:a120e144-5a26-480a-a1f6-9c08266ca2f6(oil.isr.structure)" implicit="true" />
    <import index="lx67" ref="r:7462cdd3-8504-48e1-9b09-3f342b4ddf29(oil.com.structure)" implicit="true" />
    <import index="qx8g" ref="r:264779d5-6695-4b5b-ba0a-eb616299242f(oil.message.structure)" implicit="true" />
    <import index="bpn0" ref="r:4732c7ac-787e-441b-b7cf-cc879d583fbc(de.whz.osek.sandboxLanguage.structure)" implicit="true" />
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
  <node concept="1TIwiD" id="1x4fgD94T$g">
    <property role="TrG5h" value="OS" />
    <property role="R4oN_" value="represents the operating system. It defines some general properties of the system" />
    <property role="1pbfSe" value="1633146394" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD94T$h" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T$u" role="1TKVEl">
      <property role="TrG5h" value="status" />
      <ref role="AX2Wp" node="1x4fgD94TB3" resolve="OsStatus" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T$w" role="1TKVEl">
      <property role="TrG5h" value="startupHook" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T$K" role="1TKVEl">
      <property role="TrG5h" value="errorHook" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T$O" role="1TKVEl">
      <property role="TrG5h" value="shutdownHook" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T$T" role="1TKVEl">
      <property role="TrG5h" value="preTaskHook" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T$Z" role="1TKVEl">
      <property role="TrG5h" value="postTaskHook" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T_n" role="1TKVEl">
      <property role="TrG5h" value="useServiceID" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T_v" role="1TKVEl">
      <property role="TrG5h" value="useParamterAccess" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T_C" role="1TKVEl">
      <property role="TrG5h" value="useResScheduler" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
  </node>
  <node concept="AxPO7" id="1x4fgD94TB3">
    <property role="TrG5h" value="OsStatus" />
    <property role="PDuV0" value="false" />
    <property role="3lZH7k" value="derive_from_internal_value" />
    <ref role="M4eZT" to="tpck:fKAOsGN" resolve="string" />
    <node concept="M4N5e" id="1x4fgD94TB4" role="M5hS2">
      <property role="1uS6qo" value="standard" />
      <property role="1uS6qv" value="standard" />
    </node>
    <node concept="M4N5e" id="1x4fgD94TB5" role="M5hS2">
      <property role="1uS6qo" value="extended" />
      <property role="1uS6qv" value="extended" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956aP">
    <property role="TrG5h" value="AppMode" />
    <property role="R4oN_" value="defines OSEK OS properties for an application mode" />
    <property role="1pbfSe" value="1633198015" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956bf" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956_n">
    <property role="TrG5h" value="AppModeType" />
    <property role="1pbfSe" value="1633199713" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="1x4fgD956_o" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="appMode" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="1x4fgD956aP" resolve="AppMode" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD94T$4">
    <property role="TrG5h" value="CPU" />
    <property role="R4oN_" value="root element for osek application configuration. It is the container for all configuration elements like Tasks, Resources, etc. of an application. Itself it does not define any attributes" />
    <property role="1pbfSe" value="1633146382" />
    <ref role="1TJDcQ" to="vs0r:6clJcrJYOUA" resolve="Chunk" />
    <node concept="PrWs8" id="1x4fgD94T$5" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="PrWs8" id="2DZxK4vRguW" role="PzmwI">
      <ref role="PrY4T" to="x27k:3hgxKzbiKKM" resolve="IReferenceFinder" />
    </node>
    <node concept="PrWs8" id="4B0n6H25Qiq" role="PzmwI">
      <ref role="PrY4T" to="x27k:19a6$uAAqkn" resolve="IModuleContentContainer" />
    </node>
    <node concept="1TJgyj" id="1x4fgD956aq" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="os" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="1x4fgD94T$g" resolve="OS" />
    </node>
    <node concept="1TJgyj" id="1x4fgD956bG" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="appModes" />
      <property role="20lbJX" value="1..n" />
      <ref role="20lvS9" node="1x4fgD956aP" resolve="AppMode" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_W1Kk" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="tasks" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="sxb1:1x4fgD956cc" resolve="Task" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_W1Ko" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="resources" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="bwbq:6g77ZYUpC8T" resolve="ResourceDeclaration" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_WSLS" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="alarms" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="oo9t:1x4fgD956fc" resolve="Alarm" />
    </node>
    <node concept="1TJgyj" id="5KtH1a6kkoW" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="counters" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="oo9t:5KtH1a6jX_3" resolve="Counter" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6sz5" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="events" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="rx5q:4B0n6H25BL_" resolve="EventDeclaration" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6szd" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="isrs" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="pm0g:1x4fgD956dS" resolve="ISR" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6szm" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="com" />
      <ref role="20lvS9" to="lx67:1x4fgD956o9" resolve="COM" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6szO" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="ipdus" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="lx67:1x4fgD956pO" resolve="IPDU" />
    </node>
    <node concept="1TJgyj" id="62xxBiE7yQ$" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="messages" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="qx8g:1x4fgD956kb" resolve="Message" />
    </node>
    <node concept="1TJgyj" id="6g77ZYUpcAO" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="sandboxes" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="bpn0:6g77ZYUpcAM" resolve="SandboxDeclaration" />
    </node>
  </node>
</model>

