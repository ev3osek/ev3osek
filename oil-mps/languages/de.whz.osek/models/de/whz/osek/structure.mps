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
    <import index="vs0r" ref="r:f7764ca4-8c75-4049-922b-08516400a727(com.mbeddr.core.base.structure)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="bpn0" ref="r:4732c7ac-787e-441b-b7cf-cc879d583fbc(de.whz.osek.sandboxLanguage.structure)" />
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
        <property id="1160488491229" name="iconPath" index="MwhBj" />
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
    <property role="3GE5qa" value="ISR" />
    <ref role="1TJDcQ" to="x27k:5_l8w1EmTde" resolve="ImplementationModule" />
    <node concept="1TJgyj" id="2UjW4IkGBZM" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="counters" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="3nHUyvAzu98" resolve="CounterType" />
    </node>
  </node>
  <node concept="1TIwiD" id="2UjW4IkI07e">
    <property role="1pbfSe" value="1018432999" />
    <property role="TrG5h" value="DeclareCounterMacro" />
    <property role="34LRSv" value="DeclareCounter" />
    <property role="3GE5qa" value="Timer" />
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
      <ref role="20lvS9" node="1x4fgD93Cjb" resolve="OilFile" />
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
    <node concept="1TJgyj" id="58wCuMl1UJ2" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="resource" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="6g77ZYUpC8T" resolve="ResourceDeclaration" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956ve">
    <property role="TrG5h" value="EventRef" />
    <property role="1pbfSe" value="1633199320" />
    <property role="3GE5qa" value="Event" />
    <node concept="1TJgyj" id="5JhwNflEF4y" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="event" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="4B0n6H25BL_" resolve="EventDeclaration" />
    </node>
  </node>
  <node concept="1TIwiD" id="4B0n6H25BL_">
    <property role="1pbfSe" value="1948854064" />
    <property role="TrG5h" value="EventDeclaration" />
    <property role="3GE5qa" value="Event" />
    <ref role="1TJDcQ" to="x27k:3ilck8KpYYm" resolve="GlobalConstantDeclaration" />
  </node>
  <node concept="1TIwiD" id="1x4fgD956iF">
    <property role="TrG5h" value="EventLiteral" />
    <property role="R4oN_" value="notifies tasks, that a specific event has occurred" />
    <property role="1pbfSe" value="1633198517" />
    <property role="34LRSv" value="Event" />
    <property role="3GE5qa" value="Event" />
    <ref role="1TJDcQ" to="mj1l:1UQ4qqfUXf_" resolve="NumericLiteral" />
    <node concept="PrWs8" id="4B0n6H258pq" role="PzmwI">
      <ref role="PrY4T" to="x27k:5_l8w1EmTdf" resolve="IModuleContent" />
    </node>
    <node concept="1TJgyj" id="78S7ngm5xPO" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="mask" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
  </node>
  <node concept="1TIwiD" id="4F1Ib7ChyL$">
    <property role="TrG5h" value="ExtendedTask" />
    <property role="R4oN_" value="an extended task is a task and can also use events" />
    <property role="1pbfSe" value="856155413" />
    <property role="34LRSv" value="extendedTask" />
    <property role="3GE5qa" value="Task" />
    <ref role="1TJDcQ" node="1x4fgD956cc" resolve="Task" />
    <node concept="1TJgyj" id="4F1Ib7ChyL_" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="events" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="1x4fgD956ve" resolve="EventRef" />
    </node>
  </node>
  <node concept="AxPO7" id="3QwuWjHllky">
    <property role="TrG5h" value="Schedule" />
    <property role="PDuV0" value="true" />
    <property role="3lZH7k" value="derive_from_internal_value" />
    <property role="3GE5qa" value="Task" />
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
  <node concept="1TIwiD" id="1x4fgD956tm">
    <property role="TrG5h" value="TaskRef" />
    <property role="1pbfSe" value="1633199200" />
    <property role="3GE5qa" value="Task" />
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
  <node concept="1TIwiD" id="2ZNMQTB12lN">
    <property role="1pbfSe" value="1762135839" />
    <property role="TrG5h" value="TaskMacro" />
    <property role="34LRSv" value="TASK" />
    <property role="3GE5qa" value="Task" />
    <ref role="1TJDcQ" to="x27k:5_l8w1EmTvx" resolve="Function" />
    <node concept="1TJgyj" id="2ZNMQTB12lR" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="oilTask" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="1x4fgD956cc" resolve="Task" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956cc">
    <property role="TrG5h" value="Task" />
    <property role="R4oN_" value="an OIL Task" />
    <property role="1pbfSe" value="1633198102" />
    <property role="34LRSv" value="task" />
    <property role="3GE5qa" value="Task" />
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
    <node concept="1TJgyj" id="58wCuMkZKxs" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="stacksize" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
    <node concept="PrWs8" id="1Y5JHpRyzZt" role="PzmwI">
      <ref role="PrY4T" to="vs0r:65XyadYKJgN" resolve="IIdentifierNamedConcept" />
    </node>
    <node concept="1TJgyj" id="4F1Ib7ChyLh" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="messages" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="1x4fgD956$h" resolve="MessageType" />
    </node>
    <node concept="1TJgyj" id="4F1Ib7ChyLB" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="resources" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="1x4fgD956dR" resolve="ResourceRef" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6fOz" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="appModes" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="1x4fgD956_n" resolve="AppModeType" />
    </node>
    <node concept="1TJgyi" id="3QwuWjHllkV" role="1TKVEl">
      <property role="TrG5h" value="schedule" />
      <ref role="AX2Wp" node="3QwuWjHllky" resolve="Schedule" />
    </node>
  </node>
  <node concept="1TIwiD" id="4NwoSLUgvyg">
    <property role="1pbfSe" value="954049508" />
    <property role="TrG5h" value="TerminateTaskStatement" />
    <property role="34LRSv" value="terminate" />
    <property role="3GE5qa" value="Task" />
    <ref role="1TJDcQ" to="x27k:7LOsK3rQkU_" resolve="ReturnStatement" />
  </node>
  <node concept="1TIwiD" id="1x4fgD956fc">
    <property role="TrG5h" value="Alarm" />
    <property role="R4oN_" value="do something periodically" />
    <property role="1pbfSe" value="1633198294" />
    <property role="3GE5qa" value="Timer" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956fd" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6gkR" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="appModes" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="1x4fgD956_n" resolve="AppModeType" />
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
  <node concept="1TIwiD" id="7FCpXS_WSTn">
    <property role="TrG5h" value="AlarmAutostart" />
    <property role="R4oN_" value="properties for an autostarting alarm" />
    <property role="1pbfSe" value="1596197323" />
    <property role="3GE5qa" value="Timer" />
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
      <ref role="20lvS9" node="1x4fgD956_n" resolve="AppModeType" />
    </node>
  </node>
  <node concept="1TIwiD" id="5KtH1a6jX_3">
    <property role="TrG5h" value="Counter" />
    <property role="R4oN_" value="Base for alarms" />
    <property role="1pbfSe" value="496136875" />
    <property role="3GE5qa" value="Timer" />
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
  <node concept="1TIwiD" id="7FCpXS_WYAv">
    <property role="TrG5h" value="AlarmActionCallback" />
    <property role="R4oN_" value="defines a callback, that should be called, if a alarm is fired" />
    <property role="1pbfSe" value="1596173955" />
    <property role="3GE5qa" value="Timer" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyi" id="7FCpXS_WYAw" role="1TKVEl">
      <property role="TrG5h" value="callbackName" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="PrWs8" id="62xxBiE6Vbk" role="PzmwI">
      <ref role="PrY4T" node="7FCpXS_WYzo" resolve="IAlarmAction" />
    </node>
  </node>
  <node concept="1TIwiD" id="7FCpXS_WYDG">
    <property role="TrG5h" value="AlarmActionActivateTask" />
    <property role="R4oN_" value="action, that activates a task, if an alarm expires" />
    <property role="1pbfSe" value="1596173750" />
    <property role="3GE5qa" value="Timer" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7FCpXS_WYGX" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="task" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="1x4fgD956cc" resolve="Task" />
    </node>
    <node concept="PrWs8" id="7FCpXS_WYDH" role="PzmwI">
      <ref role="PrY4T" node="7FCpXS_WYzo" resolve="IAlarmAction" />
    </node>
  </node>
  <node concept="1TIwiD" id="3nHUyvAzu98">
    <property role="1pbfSe" value="477875311" />
    <property role="TrG5h" value="CounterType" />
    <property role="3GE5qa" value="Timer" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="3nHUyvAzu9b" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="Counter" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="5KtH1a6jX_3" resolve="Counter" />
    </node>
  </node>
  <node concept="PlHQZ" id="7FCpXS_WYzo">
    <property role="TrG5h" value="IAlarmAction" />
    <property role="1pbfSe" value="1596174154" />
    <property role="3GE5qa" value="Timer" />
  </node>
  <node concept="1TIwiD" id="7FCpXS_WYIB">
    <property role="TrG5h" value="AlarmActionSetEvent" />
    <property role="R4oN_" value="action, that sets an event, if an alarm expires" />
    <property role="1pbfSe" value="1596173435" />
    <property role="3GE5qa" value="Timer" />
    <ref role="1TJDcQ" node="7FCpXS_WYDG" resolve="AlarmActionActivateTask" />
    <node concept="1TJgyj" id="7FCpXS_WYKh" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="event" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="1x4fgD956iF" resolve="EventLiteral" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956sq">
    <property role="TrG5h" value="NetworkManagement" />
    <property role="R4oN_" value="represents the network management system" />
    <property role="1pbfSe" value="1633199140" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956sr" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956lJ">
    <property role="TrG5h" value="NetworkMessage" />
    <property role="R4oN_" value="defines network specific details of a message" />
    <property role="1pbfSe" value="1633198713" />
    <property role="3GE5qa" value="Message" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956lK" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956$h">
    <property role="TrG5h" value="MessageType" />
    <property role="1pbfSe" value="1633199643" />
    <property role="3GE5qa" value="Message" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="1x4fgD956$i" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="message" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="1x4fgD956kb" resolve="Message" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956kb">
    <property role="TrG5h" value="Message" />
    <property role="R4oN_" value="represents OSEK messages. " />
    <property role="1pbfSe" value="1633198613" />
    <property role="3GE5qa" value="Message" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956kc" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956B$">
    <property role="TrG5h" value="NetworkMessageType" />
    <property role="1pbfSe" value="1633199854" />
    <property role="3GE5qa" value="Message" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="1x4fgD956B_" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="networkMessage" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="1x4fgD956lJ" resolve="NetworkMessage" />
    </node>
  </node>
  <node concept="1TIwiD" id="62xxBiE6fO3">
    <property role="1pbfSe" value="179995511" />
    <property role="TrG5h" value="ISRType" />
    <property role="3GE5qa" value="ISR" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="62xxBiE6fO4" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="isr" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="1x4fgD956dS" resolve="ISR" />
    </node>
  </node>
  <node concept="AxPO7" id="1x4fgD956de">
    <property role="TrG5h" value="IsrCategory" />
    <property role="PDuV0" value="true" />
    <property role="3lZH7k" value="derive_from_internal_value" />
    <property role="3GE5qa" value="ISR" />
    <ref role="M4eZT" to="tpck:fKAOsGN" resolve="string" />
    <node concept="M4N5e" id="1x4fgD956df" role="M5hS2">
      <property role="1uS6qo" value="category 1" />
      <property role="1uS6qv" value="1" />
    </node>
    <node concept="M4N5e" id="1x4fgD956dg" role="M5hS2">
      <property role="1uS6qo" value="category 2" />
      <property role="1uS6qv" value="2" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956dS">
    <property role="TrG5h" value="ISR" />
    <property role="R4oN_" value="Interrupt Service Routine" />
    <property role="1pbfSe" value="1633198210" />
    <property role="3GE5qa" value="ISR" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956dT" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyi" id="2WOANQOwsfT" role="1TKVEl">
      <property role="TrG5h" value="category" />
      <ref role="AX2Wp" node="1x4fgD956de" resolve="IsrCategory" />
    </node>
    <node concept="1TJgyj" id="2WOANQOwsi8" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="resources" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="v5qeus8Gck" resolve="ResourceType" />
    </node>
    <node concept="1TJgyj" id="2WOANQOwsia" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="messages" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="1x4fgD956$h" resolve="MessageType" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD94T$4">
    <property role="TrG5h" value="CPU" />
    <property role="R4oN_" value="root element for osek application configuration. It is the container for all configuration elements like Tasks, Resources, etc. of an application. Itself it does not define any attributes" />
    <property role="1pbfSe" value="1633146382" />
    <property role="3GE5qa" value="Core" />
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
      <ref role="20lvS9" node="1x4fgD956cc" resolve="Task" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_W1Ko" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="resources" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="6g77ZYUpC8T" resolve="ResourceDeclaration" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_WSLS" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="alarms" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="1x4fgD956fc" resolve="Alarm" />
    </node>
    <node concept="1TJgyj" id="5KtH1a6kkoW" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="counters" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="5KtH1a6jX_3" resolve="Counter" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6sz5" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="events" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="4B0n6H25BL_" resolve="EventDeclaration" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6szd" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="isrs" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="1x4fgD956dS" resolve="ISR" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6szm" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="com" />
      <ref role="20lvS9" node="1x4fgD956o9" resolve="COM" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6szO" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="ipdus" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="1x4fgD956pO" resolve="IPDU" />
    </node>
    <node concept="1TJgyj" id="62xxBiE7yQ$" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="messages" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="1x4fgD956kb" resolve="Message" />
    </node>
    <node concept="1TJgyj" id="6g77ZYUpcAO" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="sandboxes" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" to="bpn0:6g77ZYUpcAM" resolve="SandboxDeclaration" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956aP">
    <property role="TrG5h" value="AppMode" />
    <property role="R4oN_" value="defines OSEK OS properties for an application mode" />
    <property role="1pbfSe" value="1633198015" />
    <property role="3GE5qa" value="Core" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956bf" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="AxPO7" id="1x4fgD94TB3">
    <property role="TrG5h" value="OsStatus" />
    <property role="PDuV0" value="false" />
    <property role="3lZH7k" value="derive_from_internal_value" />
    <property role="3GE5qa" value="Core" />
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
  <node concept="1TIwiD" id="1x4fgD956_n">
    <property role="TrG5h" value="AppModeType" />
    <property role="1pbfSe" value="1633199713" />
    <property role="3GE5qa" value="Core" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="1x4fgD956_o" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="appMode" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="1x4fgD956aP" resolve="AppMode" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD94T$g">
    <property role="TrG5h" value="OS" />
    <property role="R4oN_" value="represents the operating system. It defines some general properties of the system" />
    <property role="1pbfSe" value="1633146394" />
    <property role="3GE5qa" value="Core" />
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
      <property role="TrG5h" value="useGetServiceID" />
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
  <node concept="1TIwiD" id="1x4fgD956pO">
    <property role="TrG5h" value="IPDU" />
    <property role="R4oN_" value="Interaction Layer Protocol Data Unit. Defines properties for message transaction" />
    <property role="1pbfSe" value="1633198974" />
    <property role="3GE5qa" value="COM" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956pP" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="AxPO7" id="6pX2__D8qM3">
    <property role="TrG5h" value="COMStatus" />
    <property role="3lZH7k" value="derive_from_internal_value" />
    <property role="3GE5qa" value="COM" />
    <ref role="M4eZT" to="tpck:fKAOsGN" resolve="string" />
    <node concept="M4N5e" id="6pX2__D8qM5" role="M5hS2">
      <property role="1uS6qv" value="standard" />
      <property role="1uS6qo" value="standard" />
    </node>
    <node concept="M4N5e" id="6pX2__D8qM4" role="M5hS2">
      <property role="1uS6qv" value="extended" />
      <property role="1uS6qo" value="extended" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956o9">
    <property role="TrG5h" value="COM" />
    <property role="R4oN_" value="defines properties of the OSEK communication system" />
    <property role="1pbfSe" value="1633198867" />
    <property role="3GE5qa" value="COM" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956oX" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyi" id="6pX2__D8l6Q" role="1TKVEl">
      <property role="TrG5h" value="errorHook" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="6pX2__D8l6T" role="1TKVEl">
      <property role="TrG5h" value="useServiceID" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="6pX2__D8l7a" role="1TKVEl">
      <property role="TrG5h" value="useParameterAccess" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="6pX2__D8l7f" role="1TKVEl">
      <property role="TrG5h" value="startCOMExtension" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="6pX2__D8l7l" role="1TKVEl">
      <property role="TrG5h" value="status" />
      <ref role="AX2Wp" node="6pX2__D8qM3" resolve="COMStatus" />
    </node>
    <node concept="1TJgyi" id="6pX2__D8qNa" role="1TKVEl">
      <property role="TrG5h" value="use" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="1TJgyj" id="6pX2__D8qMC" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="appModes" />
      <property role="20lbJX" value="0..n" />
      <ref role="20lvS9" node="1x4fgD956_n" resolve="AppModeType" />
    </node>
    <node concept="1TJgyj" id="7ZTJPb1S2Cz" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="timebase" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956x7">
    <property role="TrG5h" value="IPDUType" />
    <property role="1pbfSe" value="1633199441" />
    <property role="3GE5qa" value="COM" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="1x4fgD956x8" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="idu" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="1x4fgD956pO" resolve="IPDU" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD93Cjb">
    <property role="TrG5h" value="OilFile" />
    <property role="19KtqR" value="true" />
    <property role="R4oN_" value="The root part of an OSEK Implementation Language configuration file. It defines some general attributes and is the container the root configuration element CPU" />
    <property role="1pbfSe" value="1632813525" />
    <property role="MwhBj" value="${module}/icons/osek_symbol.gif" />
    <ref role="1TJDcQ" to="x27k:5_l8w1EmTcX" resolve="Module" />
    <node concept="1TJgyi" id="1x4fgD93NIt" role="1TKVEl">
      <property role="TrG5h" value="oilVersion" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="PrWs8" id="1JmJJmp2QHw" role="PzmwI">
      <ref role="PrY4T" to="vs0r:IviauXabd" resolve="IMbeddrIDERoot" />
    </node>
    <node concept="PrWs8" id="6cbBThjym80" role="PzmwI">
      <ref role="PrY4T" to="vs0r:3Y7ywckEJZi" resolve="IKeepAliveInGeneration" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_VYUZ" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="cpu" />
      <property role="20lbJX" value="1" />
      <ref role="20lvS9" node="1x4fgD94T$4" resolve="CPU" />
    </node>
  </node>
  <node concept="1TIwiD" id="1JmJJmp3CpZ">
    <property role="1pbfSe" value="1260042892" />
    <property role="3GE5qa" value="Event" />
    <property role="TrG5h" value="EventMaskType" />
    <property role="34LRSv" value="EventMaskType" />
    <ref role="1TJDcQ" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
  </node>
  <node concept="1TIwiD" id="v5qeus8Gck">
    <property role="1pbfSe" value="1545065477" />
    <property role="TrG5h" value="ResourceType" />
    <property role="34LRSv" value="ResourceType" />
    <property role="3GE5qa" value="Resource" />
    <ref role="1TJDcQ" to="mj1l:7lNBHBNBzyt" resolve="UnsignedInt8tType" />
  </node>
  <node concept="1TIwiD" id="1Y5JHpRyzdS">
    <property role="1pbfSe" value="1760562610" />
    <property role="TrG5h" value="TaskType" />
    <property role="34LRSv" value="TaskType" />
    <property role="3GE5qa" value="Task" />
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

