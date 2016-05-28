<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:8664625f-e528-4bef-85fe-ee87292976ff(de.whz.osek.primitives.structure)">
  <persistence version="9" />
  <languages>
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="1" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="mj1l" ref="r:c371cf98-dcc8-4a43-8eb8-8a8096de18b2(com.mbeddr.core.expressions.structure)" />
    <import index="vs0r" ref="r:f7764ca4-8c75-4049-922b-08516400a727(com.mbeddr.core.base.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="5092175715804935370" name="conceptAlias" index="34LRSv" />
        <property id="1587916991969465369" name="conceptId" index="1pbfSe" />
      </concept>
      <concept id="1169125989551" name="jetbrains.mps.lang.structure.structure.InterfaceConceptDeclaration" flags="ig" index="PlHQZ">
        <child id="1169127546356" name="extends" index="PrDN$" />
      </concept>
      <concept id="1169127622168" name="jetbrains.mps.lang.structure.structure.InterfaceConceptReference" flags="ig" index="PrWs8">
        <reference id="1169127628841" name="intfc" index="PrY4T" />
      </concept>
      <concept id="1071489090640" name="jetbrains.mps.lang.structure.structure.ConceptDeclaration" flags="ig" index="1TIwiD">
        <reference id="1071489389519" name="extends" index="1TJDcQ" />
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
  <node concept="1TIwiD" id="v5qeus8Gck">
    <property role="1pbfSe" value="1545065477" />
    <property role="TrG5h" value="ResourceType" />
    <property role="34LRSv" value="ResourceType" />
    <ref role="1TJDcQ" to="mj1l:7lNBHBNBzyt" resolve="UnsignedInt8tType" />
  </node>
  <node concept="1TIwiD" id="1JmJJmp3CpZ">
    <property role="1pbfSe" value="1260042892" />
    <property role="3GE5qa" value="" />
    <property role="TrG5h" value="EventMaskType" />
    <property role="34LRSv" value="EventMaskType" />
    <ref role="1TJDcQ" to="mj1l:7FQByU3CrCU" resolve="BooleanType" />
  </node>
  <node concept="1TIwiD" id="1Y5JHpRyzdS">
    <property role="1pbfSe" value="1760562610" />
    <property role="TrG5h" value="TaskType" />
    <property role="34LRSv" value="TaskType" />
    <ref role="1TJDcQ" to="mj1l:7lNBHBNB4PU" resolve="UnsignedIntType" />
  </node>
  <node concept="PlHQZ" id="4B0n6H25806">
    <property role="1pbfSe" value="1948984207" />
    <property role="TrG5h" value="IImplementationModuleReferencable" />
    <node concept="PrWs8" id="4B0n6H258mk" role="PrDN$">
      <ref role="PrY4T" to="vs0r:65XyadYKJgN" resolve="IIdentifierNamedConcept" />
    </node>
  </node>
</model>

