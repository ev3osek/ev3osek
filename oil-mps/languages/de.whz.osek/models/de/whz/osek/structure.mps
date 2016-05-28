<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:aa04fc7a-6e20-48c4-b6ac-7c1ce8638ec4(de.whz.osek.structure)">
  <persistence version="9" />
  <languages>
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="1" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="mj1l" ref="r:c371cf98-dcc8-4a43-8eb8-8a8096de18b2(com.mbeddr.core.expressions.structure)" />
    <import index="oo9t" ref="r:418b8b47-9721-4050-9bc9-93530e3b68a5(oil.timer.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="vs0r" ref="r:f7764ca4-8c75-4049-922b-08516400a727(com.mbeddr.core.base.structure)" implicit="true" />
    <import index="scpz" ref="r:dcec6791-9de2-4c75-82ab-f19ead96211d(oil.structure)" implicit="true" />
    <import index="51wr" ref="r:b31f1c3c-99aa-4f1e-a329-cba27efb1a6b(com.mbeddr.core.buildconfig.structure)" implicit="true" />
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
      <concept id="1169125989551" name="jetbrains.mps.lang.structure.structure.InterfaceConceptDeclaration" flags="ig" index="PlHQZ">
        <child id="1169127546356" name="extends" index="PrDN$" />
      </concept>
      <concept id="1169127622168" name="jetbrains.mps.lang.structure.structure.InterfaceConceptReference" flags="ig" index="PrWs8">
        <reference id="1169127628841" name="intfc" index="PrY4T" />
      </concept>
      <concept id="1071489090640" name="jetbrains.mps.lang.structure.structure.ConceptDeclaration" flags="ig" index="1TIwiD">
        <property id="1096454100552" name="rootable" index="19KtqR" />
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
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="1TIwiD" id="2UjW4IkGBZG">
    <property role="1pbfSe" value="1018793929" />
    <property role="TrG5h" value="User1msIsrType2" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="x27k:5_l8w1EmTde" resolve="ImplementationModule" />
    <node concept="1TJgyj" id="2UjW4IkGBZM" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="counters" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="oo9t:3nHUyvAzu98" resolve="CounterType" />
    </node>
  </node>
  <node concept="1TIwiD" id="2UjW4IkI07e">
    <property role="1pbfSe" value="1018432999" />
    <property role="TrG5h" value="DeclareCounterMacro" />
    <property role="34LRSv" value="DeclareCounter" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="2UjW4IkI07f" role="PzmwI">
      <ref role="PrY4T" to="x27k:5_l8w1EmTdf" resolve="IModuleContent" />
    </node>
  </node>
  <node concept="1TIwiD" id="6Jey9O34sBE">
    <property role="1pbfSe" value="1860194951" />
    <property role="TrG5h" value="OilFileRef" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="3biQP485jA6" role="PzmwI">
      <ref role="PrY4T" to="vs0r:7P$_wJpwSfc" resolve="IConfigurationItemWithImport" />
    </node>
    <node concept="1TJgyj" id="6Jey9O34sBH" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="oilFile" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" to="scpz:1x4fgD93Cjb" resolve="OilFile" />
    </node>
  </node>
  <node concept="1TIwiD" id="4B0n6H25803">
    <property role="1pbfSe" value="1948984210" />
    <property role="TrG5h" value="OilObjectRef" />
    <property role="R4oN_" value="References Events, Tasks and Resources in ImplementationModules" />
    <property role="34LRSv" value="OilObjectRef" />
    <ref role="1TJDcQ" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    <node concept="PrWs8" id="4B0n6H25804" role="PzmwI">
      <ref role="PrY4T" to="vs0r:7jSUHHvkAp9" resolve="IModuleContentRef" />
    </node>
    <node concept="1TJgyj" id="4B0n6H258gR" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="oilObject" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" to="x27k:5_l8w1EmTdf" resolve="IModuleContent" />
    </node>
  </node>
  <node concept="1TIwiD" id="4EZxVF6o_1Q">
    <property role="1pbfSe" value="287430704" />
    <property role="TrG5h" value="OsekExecutable" />
    <property role="R4oN_" value="An Executable dropping check for one main" />
    <ref role="1TJDcQ" to="51wr:4o9sgv8QoKi" resolve="Executable" />
  </node>
  <node concept="1TIwiD" id="5YkaFUJYIz$">
    <property role="1pbfSe" value="261034914" />
    <property role="TrG5h" value="OilFilesConfigItem" />
    <property role="34LRSv" value="OilFiles" />
    <property role="R4oN_" value="reference all Oil-Files configuring a project" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="5YkaFUJYIz_" role="PzmwI">
      <ref role="PrY4T" to="vs0r:3R$6B6bKw0C" resolve="IConfigurationItem" />
    </node>
    <node concept="1TJgyj" id="5YkaFUJYIzB" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="OilFiles" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="6Jey9O34sBE" resolve="OilFileRef" />
    </node>
  </node>
  <node concept="1TIwiD" id="6g77ZYUpzaO">
    <property role="1pbfSe" value="510481075" />
    <property role="TrG5h" value="ResourceLiteral" />
    <property role="3GE5qa" value="Resource" />
    <property role="34LRSv" value="Resource" />
    <ref role="1TJDcQ" to="mj1l:1UQ4qqfUXf_" resolve="NumericLiteral" />
    <node concept="1TJgyi" id="6g77ZYUpzCl" role="1TKVEl">
      <property role="TrG5h" value="property" />
      <ref role="AX2Wp" node="7FCpXS_UQxV" resolve="ResourcePropertyType" />
    </node>
    <node concept="PrWs8" id="6g77ZYUpzCr" role="PzmwI">
      <ref role="PrY4T" node="6g77ZYUpzdT" resolve="IResource" />
    </node>
  </node>
  <node concept="PlHQZ" id="6g77ZYUpzdT">
    <property role="1pbfSe" value="510481272" />
    <property role="3GE5qa" value="Resource" />
    <property role="TrG5h" value="IResource" />
    <node concept="PrWs8" id="6g77ZYUpKEC" role="PrDN$">
      <ref role="PrY4T" to="vs0r:65XyadYKJgN" resolve="IIdentifierNamedConcept" />
    </node>
  </node>
  <node concept="AxPO7" id="7FCpXS_UQxV">
    <property role="TrG5h" value="ResourcePropertyType" />
    <property role="PDuV0" value="true" />
    <property role="3lZH7k" value="derive_from_internal_value" />
    <property role="3GE5qa" value="Resource" />
    <ref role="M4eZT" to="tpck:fKAOsGN" resolve="string" />
    <node concept="M4N5e" id="7FCpXS_UQxW" role="M5hS2">
      <property role="1uS6qo" value="standard" />
      <property role="1uS6qv" value="STANDARD" />
    </node>
    <node concept="M4N5e" id="7FCpXS_UQxX" role="M5hS2">
      <property role="1uS6qo" value="internal" />
      <property role="1uS6qv" value="INTERNAL" />
    </node>
  </node>
  <node concept="1TIwiD" id="6g77ZYUpC8T">
    <property role="1pbfSe" value="510501432" />
    <property role="3GE5qa" value="Resource" />
    <property role="TrG5h" value="ResourceDeclaration" />
    <ref role="1TJDcQ" to="x27k:3ilck8KpYYm" resolve="GlobalConstantDeclaration" />
  </node>
  <node concept="1TIwiD" id="7FCpXS_UQRX">
    <property role="TrG5h" value="LinkedResource" />
    <property role="R4oN_" value="property of a linked resource. Can link only standard and internal resources" />
    <property role="1pbfSe" value="1596729893" />
    <property role="3GE5qa" value="Resource" />
    <ref role="1TJDcQ" to="mj1l:68dbbc7rHp$" resolve="UnsignedIntegerLiteral" />
    <node concept="1TJgyj" id="7FCpXS_UQS7" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="linkedResource" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="6g77ZYUpzaO" resolve="ResourceLiteral" />
    </node>
    <node concept="PrWs8" id="6g77ZYUpJS7" role="PzmwI">
      <ref role="PrY4T" node="6g77ZYUpzdT" resolve="IResource" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956dR">
    <property role="TrG5h" value="ResourceRef" />
    <property role="R4oN_" value="link to a resource" />
    <property role="1pbfSe" value="1633198209" />
    <property role="3GE5qa" value="Resource" />
    <ref role="1TJDcQ" to="x27k:3ilck8KqBqr" resolve="GlobalConstantRef" />
  </node>
</model>

