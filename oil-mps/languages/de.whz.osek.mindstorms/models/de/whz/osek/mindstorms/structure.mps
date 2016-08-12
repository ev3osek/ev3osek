<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:d71c8116-04a3-4636-a4a4-ecaa1d59d2d4(de.whz.osek.mindstorms.structure)">
  <persistence version="9" />
  <languages>
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="1" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="51wr" ref="r:b31f1c3c-99aa-4f1e-a329-cba27efb1a6b(com.mbeddr.core.buildconfig.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="4628067390765907488" name="conceptShortDescription" index="R4oN_" />
        <property id="5092175715804935370" name="conceptAlias" index="34LRSv" />
        <property id="1587916991969465369" name="conceptId" index="1pbfSe" />
        <child id="1071489727084" name="propertyDeclaration" index="1TKVEl" />
      </concept>
      <concept id="1071489090640" name="jetbrains.mps.lang.structure.structure.ConceptDeclaration" flags="ig" index="1TIwiD">
        <reference id="1071489389519" name="extends" index="1TJDcQ" />
      </concept>
      <concept id="1071489288299" name="jetbrains.mps.lang.structure.structure.PropertyDeclaration" flags="ig" index="1TJgyi">
        <reference id="1082985295845" name="dataType" index="AX2Wp" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="1TIwiD" id="4NwoSLUfe0h">
    <property role="1pbfSe" value="954383459" />
    <property role="TrG5h" value="EV3Platform" />
    <property role="3GE5qa" value="platform" />
    <property role="34LRSv" value="EV3" />
    <ref role="1TJDcQ" to="51wr:4BxItZJ4BoF" resolve="Platform" />
    <node concept="1TJgyi" id="6uyTK8G8sWA" role="1TKVEl">
      <property role="TrG5h" value="compiler" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="1TJgyi" id="6uyTK8G8sWC" role="1TKVEl">
      <property role="TrG5h" value="make" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="1TJgyi" id="2UjW4IkGiwW" role="1TKVEl">
      <property role="TrG5h" value="ev3_osekDotMakPath" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="1TJgyi" id="75ETgceep0U" role="1TKVEl">
      <property role="TrG5h" value="ev3osek_Root" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
  <node concept="1TIwiD" id="46z1WQnkGHW">
    <property role="1pbfSe" value="654978231" />
    <property role="TrG5h" value="DeviceInitialization" />
    <property role="34LRSv" value="init" />
    <property role="R4oN_" value="void ecrobot_device_initialize()" />
    <ref role="1TJDcQ" to="x27k:5_l8w1EmTvx" resolve="Function" />
  </node>
  <node concept="1TIwiD" id="3DyPeXjX0wR">
    <property role="1pbfSe" value="1906909914" />
    <property role="TrG5h" value="DeviceTermination" />
    <property role="34LRSv" value="terminate" />
    <property role="R4oN_" value="void ecrobot_device_terminate()" />
    <ref role="1TJDcQ" to="x27k:5_l8w1EmTvx" resolve="Function" />
  </node>
  <node concept="1TIwiD" id="1I2SOvka8e2">
    <property role="1pbfSe" value="273979703" />
    <property role="3GE5qa" value="platform" />
    <property role="TrG5h" value="NxtPlatform" />
    <property role="34LRSv" value="NXT" />
    <ref role="1TJDcQ" to="51wr:4BxItZJ4BoF" resolve="Platform" />
    <node concept="1TJgyi" id="1I2SOvka8e3" role="1TKVEl">
      <property role="TrG5h" value="compiler" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="1TJgyi" id="1I2SOvka8e5" role="1TKVEl">
      <property role="TrG5h" value="make" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
</model>

