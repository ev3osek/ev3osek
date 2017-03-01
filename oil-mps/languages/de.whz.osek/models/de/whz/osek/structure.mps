<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:aa04fc7a-6e20-48c4-b6ac-7c1ce8638ec4(de.whz.osek.structure)">
  <persistence version="9" />
  <languages>
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="3" />
    <use id="61c69711-ed61-4850-81d9-7714ff227fb0" name="com.mbeddr.core.expressions" version="3" />
    <use id="982eb8df-2c96-4bd7-9963-11712ea622e5" name="jetbrains.mps.lang.resources" version="2" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="mj1l" ref="r:c371cf98-dcc8-4a43-8eb8-8a8096de18b2(com.mbeddr.core.expressions.structure)" />
    <import index="vs0r" ref="r:f7764ca4-8c75-4049-922b-08516400a727(com.mbeddr.core.base.structure)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="bpn0" ref="r:4732c7ac-787e-441b-b7cf-cc879d583fbc(de.whz.osek.sandboxLanguage.structure)" />
    <import index="51wr" ref="r:b31f1c3c-99aa-4f1e-a329-cba27efb1a6b(com.mbeddr.core.buildconfig.structure)" implicit="true" />
    <import index="yq40" ref="r:152b3fc0-83a1-4bab-a8cd-565eb8483785(com.mbeddr.core.pointers.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="982eb8df-2c96-4bd7-9963-11712ea622e5" name="jetbrains.mps.lang.resources">
      <concept id="8974276187400029883" name="jetbrains.mps.lang.resources.structure.FileIcon" flags="ng" index="1QGGSu">
        <property id="2756621024541341363" name="file" index="1iqoE4" />
      </concept>
    </language>
    <language id="63e0e566-5131-447e-90e3-12ea330e1a00" name="com.mbeddr.mpsutil.blutil">
      <concept id="3693790620639876318" name="com.mbeddr.mpsutil.blutil.structure.BLDoc" flags="ng" index="2aEySx">
        <child id="3693790620639876319" name="text" index="2aEySw" />
      </concept>
    </language>
    <language id="92d2ea16-5a42-4fdf-a676-c7604efe3504" name="de.slisson.mps.richtext">
      <concept id="2557074442922380897" name="de.slisson.mps.richtext.structure.Text" flags="ng" index="19SGf9">
        <child id="2557074442922392302" name="words" index="19SJt6" />
      </concept>
      <concept id="2557074442922438156" name="de.slisson.mps.richtext.structure.Word" flags="ng" index="19SUe$">
        <property id="2557074442922438158" name="escapedValue" index="19SUeA" />
      </concept>
    </language>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="1224240836180" name="jetbrains.mps.lang.structure.structure.DeprecatedNodeAnnotation" flags="ig" index="asaX9" />
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
        <property id="6714410169261853888" name="conceptId" index="EcuMT" />
        <property id="4628067390765907488" name="conceptShortDescription" index="R4oN_" />
        <property id="4628067390765956807" name="final" index="R5$K2" />
        <property id="4628067390765956802" name="abstract" index="R5$K7" />
        <property id="5092175715804935370" name="conceptAlias" index="34LRSv" />
        <child id="1071489727083" name="linkDeclaration" index="1TKVEi" />
        <child id="1071489727084" name="propertyDeclaration" index="1TKVEl" />
      </concept>
      <concept id="1169125989551" name="jetbrains.mps.lang.structure.structure.InterfaceConceptDeclaration" flags="ig" index="PlHQZ" />
      <concept id="1169127622168" name="jetbrains.mps.lang.structure.structure.InterfaceConceptReference" flags="ig" index="PrWs8">
        <reference id="1169127628841" name="intfc" index="PrY4T" />
      </concept>
      <concept id="1071489090640" name="jetbrains.mps.lang.structure.structure.ConceptDeclaration" flags="ig" index="1TIwiD">
        <property id="1096454100552" name="rootable" index="19KtqR" />
        <reference id="1071489389519" name="extends" index="1TJDcQ" />
        <child id="6327362524875300597" name="icon" index="rwd14" />
        <child id="1169129564478" name="implements" index="PzmwI" />
      </concept>
      <concept id="1071489288299" name="jetbrains.mps.lang.structure.structure.PropertyDeclaration" flags="ig" index="1TJgyi">
        <property id="241647608299431129" name="propertyId" index="IQ2nx" />
        <reference id="1082985295845" name="dataType" index="AX2Wp" />
      </concept>
      <concept id="1071489288298" name="jetbrains.mps.lang.structure.structure.LinkDeclaration" flags="ig" index="1TJgyj">
        <property id="1071599776563" name="role" index="20kJfa" />
        <property id="1071599893252" name="sourceCardinality" index="20lbJX" />
        <property id="1071599937831" name="metaClass" index="20lmBu" />
        <property id="241647608299431140" name="linkId" index="IQ2ns" />
        <reference id="1071599976176" name="target" index="20lvS9" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
        <child id="5169995583184591170" name="smodelAttribute" index="lGtFl" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="1TIwiD" id="2UjW4IkI07e">
    <property role="TrG5h" value="DeclareCounterMacro" />
    <property role="34LRSv" value="DeclareCounter" />
    <property role="3GE5qa" value="Timer" />
    <property role="EcuMT" value="3356290354729451982" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="2UjW4IkI07f" role="PzmwI">
      <ref role="PrY4T" to="x27k:5_l8w1EmTdf" resolve="IModuleContent" />
    </node>
  </node>
  <node concept="1TIwiD" id="6Jey9O34sBE">
    <property role="TrG5h" value="OilFileRef" />
    <property role="EcuMT" value="7768296615203424746" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="3biQP485jA6" role="PzmwI">
      <ref role="PrY4T" to="vs0r:7P$_wJpwSfc" resolve="IConfigurationItemWithImport" />
    </node>
    <node concept="1TJgyj" id="6Jey9O34sBH" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="oilFile" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="7768296615203424749" />
      <ref role="20lvS9" node="1x4fgD93Cjb" resolve="OilFile" />
    </node>
  </node>
  <node concept="1TIwiD" id="4B0n6H25803">
    <property role="TrG5h" value="OilObjectRef" />
    <property role="R4oN_" value="References Events, Tasks and Resources in ImplementationModules" />
    <property role="34LRSv" value="OilObjectRef" />
    <property role="EcuMT" value="5314349176037081091" />
    <ref role="1TJDcQ" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    <node concept="PrWs8" id="4B0n6H25804" role="PzmwI">
      <ref role="PrY4T" to="vs0r:7jSUHHvkAp9" resolve="IModuleContentRef" />
    </node>
    <node concept="1TJgyj" id="4B0n6H258gR" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="oilObject" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="5314349176037082167" />
      <ref role="20lvS9" to="x27k:5_l8w1EmTdf" resolve="IModuleContent" />
    </node>
  </node>
  <node concept="1TIwiD" id="4EZxVF6o_1Q">
    <property role="TrG5h" value="OsekExecutable" />
    <property role="R4oN_" value="An Executable dropping check for one main" />
    <property role="EcuMT" value="5386172915620401270" />
    <ref role="1TJDcQ" to="51wr:4o9sgv8QoKi" resolve="Executable" />
  </node>
  <node concept="1TIwiD" id="5YkaFUJYIz$">
    <property role="TrG5h" value="OilFilesConfigItem" />
    <property role="34LRSv" value="OilFiles" />
    <property role="R4oN_" value="reference all Oil-Files configuring a project" />
    <property role="EcuMT" value="6887176728640940260" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="5YkaFUJYIz_" role="PzmwI">
      <ref role="PrY4T" to="vs0r:3R$6B6bKw0C" resolve="IConfigurationItem" />
    </node>
    <node concept="1TJgyj" id="5YkaFUJYIzB" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="OilFiles" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="6887176728640940263" />
      <ref role="20lvS9" node="6Jey9O34sBE" resolve="OilFileRef" />
    </node>
  </node>
  <node concept="1TIwiD" id="6g77ZYUpzaO">
    <property role="TrG5h" value="ResourceLiteral" />
    <property role="3GE5qa" value="Resource" />
    <property role="34LRSv" value="Resource" />
    <property role="EcuMT" value="7207764911834149556" />
    <ref role="1TJDcQ" to="mj1l:1UQ4qqfUXf_" resolve="NumericLiteral" />
    <node concept="1TJgyi" id="6g77ZYUpzCl" role="1TKVEl">
      <property role="TrG5h" value="property" />
      <property role="IQ2nx" value="7207764911834151445" />
      <ref role="AX2Wp" node="7FCpXS_UQxV" resolve="ResourcePropertyType" />
    </node>
    <node concept="PrWs8" id="6g77ZYUpzCr" role="PzmwI">
      <ref role="PrY4T" node="6g77ZYUpzdT" resolve="IResource" />
    </node>
  </node>
  <node concept="PlHQZ" id="6g77ZYUpzdT">
    <property role="3GE5qa" value="Resource" />
    <property role="TrG5h" value="IResource" />
    <property role="EcuMT" value="7207764911834149753" />
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
    <property role="3GE5qa" value="Resource" />
    <property role="TrG5h" value="ResourceDeclaration" />
    <property role="EcuMT" value="7207764911834169913" />
    <ref role="1TJDcQ" to="x27k:3ilck8KpYYm" resolve="GlobalConstantDeclaration" />
  </node>
  <node concept="1TIwiD" id="7FCpXS_UQRX">
    <property role="TrG5h" value="LinkedResource" />
    <property role="R4oN_" value="property of a linked resource. Can link only standard and internal resources" />
    <property role="3GE5qa" value="Resource" />
    <property role="EcuMT" value="8856442871040667133" />
    <ref role="1TJDcQ" to="mj1l:1UQ4qqfUXf_" resolve="NumericLiteral" />
    <node concept="1TJgyj" id="1a22ASGcefT" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="linkedResource" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="1333639907959170041" />
      <ref role="20lvS9" node="1x4fgD956dR" resolve="ResourceRef" />
    </node>
    <node concept="PrWs8" id="6g77ZYUpJS7" role="PzmwI">
      <ref role="PrY4T" node="6g77ZYUpzdT" resolve="IResource" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956dR">
    <property role="TrG5h" value="ResourceRef" />
    <property role="R4oN_" value="link to a resource" />
    <property role="3GE5qa" value="Resource" />
    <property role="EcuMT" value="1748589669711635319" />
    <node concept="1TJgyj" id="58wCuMl1UJ2" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="resource" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="5917907947849493442" />
      <ref role="20lvS9" node="6g77ZYUpC8T" resolve="ResourceDeclaration" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956ve">
    <property role="TrG5h" value="EventRef" />
    <property role="3GE5qa" value="Event" />
    <property role="EcuMT" value="1748589669711636430" />
    <node concept="1TJgyj" id="5JhwNflEF4y" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="event" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="6616213586235273506" />
      <ref role="20lvS9" node="4B0n6H25BL_" resolve="EventDeclaration" />
    </node>
  </node>
  <node concept="1TIwiD" id="4B0n6H25BL_">
    <property role="TrG5h" value="EventDeclaration" />
    <property role="3GE5qa" value="Event" />
    <property role="EcuMT" value="5314349176037211237" />
    <ref role="1TJDcQ" to="x27k:3ilck8KpYYm" resolve="GlobalConstantDeclaration" />
  </node>
  <node concept="1TIwiD" id="1x4fgD956iF">
    <property role="TrG5h" value="EventLiteral" />
    <property role="R4oN_" value="notifies tasks, that a specific event has occurred" />
    <property role="34LRSv" value="Event" />
    <property role="3GE5qa" value="Event" />
    <property role="EcuMT" value="1748589669711635627" />
    <ref role="1TJDcQ" to="mj1l:1UQ4qqfUXf_" resolve="NumericLiteral" />
    <node concept="1TJgyj" id="78S7ngm5xPO" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="mask" />
      <property role="20lbJX" value="0..1" />
      <property role="IQ2ns" value="8230360703443541364" />
      <ref role="20lvS9" to="mj1l:1UQ4qqfUXf_" resolve="NumericLiteral" />
    </node>
  </node>
  <node concept="1TIwiD" id="4F1Ib7ChyL$">
    <property role="TrG5h" value="ExtendedTask" />
    <property role="R4oN_" value="an extended task is a task and can also use events" />
    <property role="34LRSv" value="extendedTask" />
    <property role="3GE5qa" value="Task" />
    <property role="EcuMT" value="5386789703557459044" />
    <ref role="1TJDcQ" node="1x4fgD956cc" resolve="TaskDeclaration" />
    <node concept="1TJgyj" id="4F1Ib7ChyL_" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="events" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="5386789703557459045" />
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
    <property role="3GE5qa" value="Task" />
    <property role="EcuMT" value="1748589669711636310" />
    <ref role="1TJDcQ" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    <node concept="1TJgyj" id="1x4fgD956tn" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="task" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="1748589669711636311" />
      <ref role="20lvS9" node="1x4fgD956cc" resolve="TaskDeclaration" />
    </node>
    <node concept="PrWs8" id="1Y5JHpRyyu$" role="PzmwI">
      <ref role="PrY4T" to="vs0r:7jSUHHvkAp9" resolve="IModuleContentRef" />
    </node>
  </node>
  <node concept="1TIwiD" id="2ZNMQTB12lN">
    <property role="TrG5h" value="TaskMacro" />
    <property role="34LRSv" value="TASK" />
    <property role="3GE5qa" value="Task" />
    <property role="EcuMT" value="3455329014158468467" />
    <ref role="1TJDcQ" to="x27k:5_l8w1EmTvx" resolve="Function" />
    <node concept="1TJgyj" id="2ZNMQTB12lR" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="oilTask" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="3455329014158468471" />
      <ref role="20lvS9" node="1x4fgD956cc" resolve="TaskDeclaration" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956cc">
    <property role="TrG5h" value="TaskDeclaration" />
    <property role="R4oN_" value="an OIL Task" />
    <property role="34LRSv" value="task" />
    <property role="3GE5qa" value="Task" />
    <property role="EcuMT" value="1748589669711635212" />
    <ref role="1TJDcQ" to="x27k:5_l8w1EmTvw" resolve="FunctionPrototype" />
    <node concept="1TJgyj" id="58wCuMkZKxs" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="stacksize" />
      <property role="IQ2ns" value="5917907947848927324" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="4F1Ib7ChyLh" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="messages" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="5386789703557459025" />
      <ref role="20lvS9" node="1x4fgD956$h" resolve="MessageType" />
    </node>
    <node concept="1TJgyj" id="4F1Ib7ChyLB" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="resources" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="5386789703557459047" />
      <ref role="20lvS9" node="1x4fgD956dR" resolve="ResourceRef" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6fOz" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="appModes" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="6962994334519590179" />
      <ref role="20lvS9" node="1x4fgD956_n" resolve="AppModeType" />
    </node>
    <node concept="1TJgyi" id="3QwuWjHllkV" role="1TKVEl">
      <property role="TrG5h" value="schedule" />
      <property role="IQ2nx" value="4440685318312908091" />
      <ref role="AX2Wp" node="3QwuWjHllky" resolve="Schedule" />
    </node>
    <node concept="1TJgyi" id="1Bd1FdQXRUz" role="1TKVEl">
      <property role="TrG5h" value="priority" />
      <property role="IQ2nx" value="1859149589038726819" />
      <ref role="AX2Wp" to="tpck:fKAQMTA" resolve="integer" />
    </node>
    <node concept="1TJgyi" id="1Bd1FdQXRUA" role="1TKVEl">
      <property role="TrG5h" value="activationAmount" />
      <property role="IQ2nx" value="1859149589038726822" />
      <ref role="AX2Wp" to="tpck:fKAQMTA" resolve="integer" />
    </node>
  </node>
  <node concept="1TIwiD" id="4NwoSLUgvyg">
    <property role="TrG5h" value="TerminateTaskStatement" />
    <property role="34LRSv" value="terminate" />
    <property role="3GE5qa" value="Task" />
    <property role="EcuMT" value="5539536996663425168" />
    <ref role="1TJDcQ" to="x27k:7LOsK3rQkU_" resolve="ReturnStatement" />
  </node>
  <node concept="1TIwiD" id="1x4fgD956fc">
    <property role="TrG5h" value="Alarm" />
    <property role="R4oN_" value="do something periodically" />
    <property role="3GE5qa" value="Timer" />
    <property role="EcuMT" value="1748589669711635404" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956fd" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6gkR" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="appModes" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="6962994334519592247" />
      <ref role="20lvS9" node="1x4fgD956_n" resolve="AppModeType" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_WYwf" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="autostart" />
      <property role="IQ2ns" value="8856442871041222671" />
      <ref role="20lvS9" node="7FCpXS_WSTn" resolve="AlarmAutostart" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_WYQV" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="action" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="8856442871041224123" />
      <ref role="20lvS9" node="7FCpXS_WYzo" resolve="IAlarmAction" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_WYu$" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="counter" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="8856442871041222564" />
      <ref role="20lvS9" node="3WvbRq1R3ja" resolve="CounterDeclaration" />
    </node>
  </node>
  <node concept="1TIwiD" id="7FCpXS_WSTn">
    <property role="TrG5h" value="AlarmAutostart" />
    <property role="R4oN_" value="properties for an autostarting alarm" />
    <property role="3GE5qa" value="Timer" />
    <property role="EcuMT" value="8856442871041199703" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="78S7ngm5xPA" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="alarmTime" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="8230360703443541350" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="78S7ngm5xPC" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="cycleTime" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="8230360703443541352" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_WSQo" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="appModes" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="8856442871041199512" />
      <ref role="20lvS9" node="1x4fgD956_n" resolve="AppModeType" />
    </node>
  </node>
  <node concept="1TIwiD" id="5KtH1a6jX_3">
    <property role="TrG5h" value="CounterLiteral" />
    <property role="R4oN_" value="Base for alarms" />
    <property role="3GE5qa" value="Timer" />
    <property role="EcuMT" value="6637659417469770051" />
    <ref role="1TJDcQ" to="mj1l:7FQByU3CrDB" resolve="NumberLiteral" />
    <node concept="1TJgyj" id="78S7ngm5xPc" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="maxAllowedValue" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="8230360703443541324" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="78S7ngm5xPv" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="ticksPerBase" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="8230360703443541343" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="78S7ngm5xPy" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="minCycle" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="8230360703443541346" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
  </node>
  <node concept="1TIwiD" id="7FCpXS_WYAv">
    <property role="TrG5h" value="AlarmActionCallback" />
    <property role="R4oN_" value="defines a callback, that should be called, if a alarm is fired" />
    <property role="3GE5qa" value="Timer" />
    <property role="EcuMT" value="8856442871041223071" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyi" id="7FCpXS_WYAw" role="1TKVEl">
      <property role="TrG5h" value="callbackName" />
      <property role="IQ2nx" value="8856442871041223072" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="PrWs8" id="62xxBiE6Vbk" role="PzmwI">
      <ref role="PrY4T" node="7FCpXS_WYzo" resolve="IAlarmAction" />
    </node>
  </node>
  <node concept="1TIwiD" id="7FCpXS_WYDG">
    <property role="TrG5h" value="AlarmActionActivateTask" />
    <property role="R4oN_" value="action, that activates a task, if an alarm expires" />
    <property role="3GE5qa" value="Timer" />
    <property role="EcuMT" value="8856442871041223276" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="7FCpXS_WYGX" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="task" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="8856442871041223485" />
      <ref role="20lvS9" node="1x4fgD956cc" resolve="TaskDeclaration" />
    </node>
    <node concept="PrWs8" id="7FCpXS_WYDH" role="PzmwI">
      <ref role="PrY4T" node="7FCpXS_WYzo" resolve="IAlarmAction" />
    </node>
  </node>
  <node concept="PlHQZ" id="7FCpXS_WYzo">
    <property role="TrG5h" value="IAlarmAction" />
    <property role="3GE5qa" value="Timer" />
    <property role="EcuMT" value="8856442871041222872" />
  </node>
  <node concept="1TIwiD" id="7FCpXS_WYIB">
    <property role="TrG5h" value="AlarmActionSetEvent" />
    <property role="R4oN_" value="action, that sets an event, if an alarm expires" />
    <property role="3GE5qa" value="Timer" />
    <property role="EcuMT" value="8856442871041223591" />
    <ref role="1TJDcQ" node="7FCpXS_WYDG" resolve="AlarmActionActivateTask" />
    <node concept="1TJgyj" id="1Bd1FdR0aYZ" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="event" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="1859149589039329215" />
      <ref role="20lvS9" node="1x4fgD956ve" resolve="EventRef" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956sq">
    <property role="TrG5h" value="NetworkManagement" />
    <property role="R4oN_" value="represents the network management system" />
    <property role="EcuMT" value="1748589669711636250" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956sr" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956lJ">
    <property role="TrG5h" value="NetworkMessage" />
    <property role="R4oN_" value="defines network specific details of a message" />
    <property role="3GE5qa" value="Message" />
    <property role="EcuMT" value="1748589669711635823" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956lK" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956$h">
    <property role="TrG5h" value="MessageType" />
    <property role="3GE5qa" value="Message" />
    <property role="EcuMT" value="1748589669711636753" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="1x4fgD956$i" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="message" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="1748589669711636754" />
      <ref role="20lvS9" node="1x4fgD956kb" resolve="Message" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956kb">
    <property role="TrG5h" value="Message" />
    <property role="R4oN_" value="represents OSEK messages" />
    <property role="3GE5qa" value="Message" />
    <property role="EcuMT" value="1748589669711635723" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956kc" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyj" id="6zjU44HG6xG" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="MessageProperty" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="7553636366667507820" />
      <ref role="20lvS9" node="6zjU44HG6xs" resolve="MessagePropertyType" />
    </node>
    <node concept="1TJgyj" id="6zjU44HG6xI" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="Notification" />
      <property role="IQ2ns" value="7553636366667507822" />
      <ref role="20lvS9" node="6zjU44HG6yG" resolve="Notification" />
    </node>
    <node concept="1TJgyj" id="6zjU44HG6xL" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="NotificationError" />
      <property role="IQ2ns" value="7553636366667507825" />
      <ref role="20lvS9" node="6zjU44HG6yG" resolve="Notification" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956B$">
    <property role="TrG5h" value="NetworkMessageType" />
    <property role="3GE5qa" value="Message" />
    <property role="EcuMT" value="1748589669711636964" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="1x4fgD956B_" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="networkMessage" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="1748589669711636965" />
      <ref role="20lvS9" node="1x4fgD956lJ" resolve="NetworkMessage" />
    </node>
  </node>
  <node concept="1TIwiD" id="62xxBiE6fO3">
    <property role="TrG5h" value="ISRType" />
    <property role="3GE5qa" value="ISR" />
    <property role="EcuMT" value="6962994334519590147" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="62xxBiE6fO4" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="isr" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="6962994334519590148" />
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
    <property role="3GE5qa" value="ISR" />
    <property role="EcuMT" value="1748589669711635320" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956dT" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyi" id="2WOANQOwsfT" role="1TKVEl">
      <property role="TrG5h" value="category" />
      <property role="IQ2nx" value="3401514307895280633" />
      <ref role="AX2Wp" node="1x4fgD956de" resolve="IsrCategory" />
    </node>
    <node concept="1TJgyj" id="2WOANQOwsi8" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="resources" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="3401514307895280776" />
      <ref role="20lvS9" node="v5qeus8Gck" resolve="ResourceType" />
    </node>
    <node concept="1TJgyj" id="2WOANQOwsia" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="messages" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="3401514307895280778" />
      <ref role="20lvS9" node="1x4fgD956$h" resolve="MessageType" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD94T$4">
    <property role="TrG5h" value="CPU" />
    <property role="R4oN_" value="root element for osek application configuration. It is the container for all configuration elements like Tasks, Resources, etc. of an application. Itself it does not define any attributes" />
    <property role="3GE5qa" value="Core" />
    <property role="EcuMT" value="1748589669711583492" />
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
      <property role="IQ2ns" value="1748589669711635098" />
      <ref role="20lvS9" node="1x4fgD94T$g" resolve="OS" />
    </node>
    <node concept="1TJgyj" id="1x4fgD956bG" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="appModes" />
      <property role="20lbJX" value="1..n" />
      <property role="IQ2ns" value="1748589669711635180" />
      <ref role="20lvS9" node="1x4fgD956aP" resolve="AppMode" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_W1Kk" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="tasks" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="8856442871040973844" />
      <ref role="20lvS9" node="1x4fgD956cc" resolve="TaskDeclaration" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_W1Ko" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="resources" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="8856442871040973848" />
      <ref role="20lvS9" node="6g77ZYUpC8T" resolve="ResourceDeclaration" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_WSLS" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="alarms" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="8856442871041199224" />
      <ref role="20lvS9" node="1x4fgD956fc" resolve="Alarm" />
    </node>
    <node concept="1TJgyj" id="5KtH1a6kkoW" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="counters" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="6637659417469863484" />
      <ref role="20lvS9" node="3WvbRq1R3ja" resolve="CounterDeclaration" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6sz5" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="events" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="6962994334519642309" />
      <ref role="20lvS9" node="4B0n6H25BL_" resolve="EventDeclaration" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6szd" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="isrs" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="6962994334519642317" />
      <ref role="20lvS9" node="1x4fgD956dS" resolve="ISR" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6szm" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="com" />
      <property role="IQ2ns" value="6962994334519642326" />
      <ref role="20lvS9" node="1x4fgD956o9" resolve="COM" />
    </node>
    <node concept="1TJgyj" id="62xxBiE6szO" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="ipdus" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="6962994334519642356" />
      <ref role="20lvS9" node="1x4fgD956pO" resolve="IPDU" />
    </node>
    <node concept="1TJgyj" id="62xxBiE7yQ$" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="messages" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="6962994334519930276" />
      <ref role="20lvS9" node="1x4fgD956kb" resolve="Message" />
    </node>
    <node concept="1TJgyj" id="6g77ZYUpcAO" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="sandboxes" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="7207764911834057140" />
      <ref role="20lvS9" to="bpn0:6g77ZYUpcAM" resolve="SandboxDeclaration" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956aP">
    <property role="TrG5h" value="AppMode" />
    <property role="R4oN_" value="defines OSEK OS properties for an application mode" />
    <property role="3GE5qa" value="Core" />
    <property role="EcuMT" value="1748589669711635125" />
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
    <property role="3GE5qa" value="Core" />
    <property role="EcuMT" value="1748589669711636823" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="1x4fgD956_o" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="appMode" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="1748589669711636824" />
      <ref role="20lvS9" node="1x4fgD956aP" resolve="AppMode" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD94T$g">
    <property role="TrG5h" value="OS" />
    <property role="R4oN_" value="represents the operating system. It defines some general properties of the system" />
    <property role="3GE5qa" value="Core" />
    <property role="EcuMT" value="1748589669711583504" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD94T$h" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T$u" role="1TKVEl">
      <property role="TrG5h" value="status" />
      <property role="IQ2nx" value="1748589669711583518" />
      <ref role="AX2Wp" node="1x4fgD94TB3" resolve="OsStatus" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T$w" role="1TKVEl">
      <property role="TrG5h" value="startupHook" />
      <property role="IQ2nx" value="1748589669711583520" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T$K" role="1TKVEl">
      <property role="TrG5h" value="errorHook" />
      <property role="IQ2nx" value="1748589669711583536" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T$O" role="1TKVEl">
      <property role="TrG5h" value="shutdownHook" />
      <property role="IQ2nx" value="1748589669711583540" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T$T" role="1TKVEl">
      <property role="TrG5h" value="preTaskHook" />
      <property role="IQ2nx" value="1748589669711583545" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T$Z" role="1TKVEl">
      <property role="TrG5h" value="postTaskHook" />
      <property role="IQ2nx" value="1748589669711583551" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T_n" role="1TKVEl">
      <property role="TrG5h" value="useGetServiceID" />
      <property role="IQ2nx" value="1748589669711583575" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T_v" role="1TKVEl">
      <property role="TrG5h" value="useParamterAccess" />
      <property role="IQ2nx" value="1748589669711583583" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="1x4fgD94T_C" role="1TKVEl">
      <property role="TrG5h" value="useResScheduler" />
      <property role="IQ2nx" value="1748589669711583592" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956pO">
    <property role="TrG5h" value="IPDU" />
    <property role="R4oN_" value="Interaction Layer Protocol Data Unit. Defines properties for message transaction" />
    <property role="3GE5qa" value="COM" />
    <property role="EcuMT" value="1748589669711636084" />
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
    <property role="3GE5qa" value="COM" />
    <property role="EcuMT" value="1748589669711635977" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="1x4fgD956oX" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyi" id="6pX2__D8l6Q" role="1TKVEl">
      <property role="TrG5h" value="errorHook" />
      <property role="IQ2nx" value="7385070343089639862" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="6pX2__D8l6T" role="1TKVEl">
      <property role="TrG5h" value="useServiceID" />
      <property role="IQ2nx" value="7385070343089639865" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="6pX2__D8l7a" role="1TKVEl">
      <property role="TrG5h" value="useParameterAccess" />
      <property role="IQ2nx" value="7385070343089639882" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="6pX2__D8l7f" role="1TKVEl">
      <property role="TrG5h" value="startCOMExtension" />
      <property role="IQ2nx" value="7385070343089639887" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
    </node>
    <node concept="1TJgyi" id="6pX2__D8l7l" role="1TKVEl">
      <property role="TrG5h" value="status" />
      <property role="IQ2nx" value="7385070343089639893" />
      <ref role="AX2Wp" node="6pX2__D8qM3" resolve="COMStatus" />
    </node>
    <node concept="1TJgyi" id="6pX2__D8qNa" role="1TKVEl">
      <property role="TrG5h" value="use" />
      <property role="IQ2nx" value="7385070343089663178" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="1TJgyj" id="6pX2__D8qMC" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="appModes" />
      <property role="20lbJX" value="0..n" />
      <property role="IQ2ns" value="7385070343089663144" />
      <ref role="20lvS9" node="1x4fgD956_n" resolve="AppModeType" />
    </node>
    <node concept="1TJgyj" id="7ZTJPb1S2Cz" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="timebase" />
      <property role="IQ2ns" value="9221612074178718243" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrCM" resolve="Expression" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD956x7">
    <property role="TrG5h" value="IPDUType" />
    <property role="3GE5qa" value="COM" />
    <property role="EcuMT" value="1748589669711636551" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="1x4fgD956x8" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="idu" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="1748589669711636552" />
      <ref role="20lvS9" node="1x4fgD956pO" resolve="IPDU" />
    </node>
  </node>
  <node concept="1TIwiD" id="1x4fgD93Cjb">
    <property role="TrG5h" value="OilFile" />
    <property role="19KtqR" value="true" />
    <property role="R4oN_" value="The root part of an OSEK Implementation Language configuration file. It defines some general attributes and is the container the root configuration element CPU" />
    <property role="EcuMT" value="1748589669711250635" />
    <ref role="1TJDcQ" to="x27k:5_l8w1EmTcX" resolve="Module" />
    <node concept="1TJgyi" id="1x4fgD93NIt" role="1TKVEl">
      <property role="TrG5h" value="oilVersion" />
      <property role="IQ2nx" value="1748589669711297437" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="PrWs8" id="1JmJJmp2QHw" role="PzmwI">
      <ref role="PrY4T" to="vs0r:IviauXabd" resolve="IMbeddrIDERoot" />
    </node>
    <node concept="PrWs8" id="6cbBThjym80" role="PzmwI">
      <ref role="PrY4T" to="vs0r:3Y7ywckEJZi" resolve="IKeepAliveInGeneration" />
    </node>
    <node concept="1TJgyj" id="1a22ASGenpX" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="implementationDefinition" />
      <property role="IQ2ns" value="1333639907959731837" />
      <ref role="20lvS9" node="1a22ASGenpJ" resolve="ImplementationDefinition" />
    </node>
    <node concept="1TJgyj" id="7FCpXS_VYUZ" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="applicationDefinition" />
      <property role="20lbJX" value="0..1" />
      <property role="IQ2ns" value="8856442871040962239" />
      <ref role="20lvS9" node="1x4fgD94T$4" resolve="CPU" />
    </node>
    <node concept="1QGGSu" id="2GIoH5YZ1_c" role="rwd14">
      <property role="1iqoE4" value="${module}/icons/osek_symbol.gif" />
    </node>
  </node>
  <node concept="1TIwiD" id="1JmJJmp3CpZ">
    <property role="3GE5qa" value="Event" />
    <property role="TrG5h" value="EventMaskType" />
    <property role="34LRSv" value="EventMaskType" />
    <property role="EcuMT" value="2006000646084265599" />
    <ref role="1TJDcQ" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
  </node>
  <node concept="1TIwiD" id="v5qeus8Gck">
    <property role="TrG5h" value="ResourceType" />
    <property role="34LRSv" value="ResourceType" />
    <property role="3GE5qa" value="Resource" />
    <property role="EcuMT" value="559969072643752724" />
    <ref role="1TJDcQ" to="mj1l:7lNBHBNBzyt" resolve="UnsignedInt8tType" />
  </node>
  <node concept="1TIwiD" id="1Y5JHpRyzdS">
    <property role="TrG5h" value="TaskType" />
    <property role="34LRSv" value="TaskType" />
    <property role="3GE5qa" value="Task" />
    <property role="EcuMT" value="2271431415416107896" />
    <ref role="1TJDcQ" to="mj1l:7lNBHBNB4PU" resolve="UnsignedIntType" />
  </node>
  <node concept="1TIwiD" id="3WvbRq1R3ja">
    <property role="3GE5qa" value="Timer" />
    <property role="TrG5h" value="CounterDeclaration" />
    <property role="EcuMT" value="4548406334698829002" />
    <ref role="1TJDcQ" to="x27k:3ilck8KpYYm" resolve="GlobalConstantDeclaration" />
  </node>
  <node concept="1TIwiD" id="3WvbRq1R9yv">
    <property role="3GE5qa" value="Timer" />
    <property role="TrG5h" value="CounterRef" />
    <property role="EcuMT" value="4548406334698854559" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="3WvbRq1R9yw" role="1TKVEi">
      <property role="20lmBu" value="reference" />
      <property role="20kJfa" value="counter" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="4548406334698854560" />
      <ref role="20lvS9" node="3WvbRq1R3ja" resolve="CounterDeclaration" />
    </node>
  </node>
  <node concept="1TIwiD" id="7JdyDzjc6eg">
    <property role="3GE5qa" value="ISR" />
    <property role="TrG5h" value="User1msIsrType2Function" />
    <property role="34LRSv" value="user_1ms_isr_type2" />
    <property role="R4oN_" value="This hook routine is invoked from a 1msec periodical ISR in category 2." />
    <property role="EcuMT" value="8920938825873646480" />
    <ref role="1TJDcQ" to="x27k:5_l8w1EmTvx" resolve="Function" />
  </node>
  <node concept="1TIwiD" id="7JdyDzjqbBp">
    <property role="3GE5qa" value="Timer" />
    <property role="TrG5h" value="CounterType" />
    <property role="EcuMT" value="8920938825877338585" />
    <ref role="1TJDcQ" to="mj1l:7lNBHBNBzyt" resolve="UnsignedInt8tType" />
  </node>
  <node concept="1TIwiD" id="1a22ASGenpJ">
    <property role="TrG5h" value="ImplementationDefinition" />
    <property role="EcuMT" value="1333639907959731823" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="2aEySx" id="1a22ASGenpM" role="lGtFl">
      <node concept="19SGf9" id="1a22ASGenpN" role="2aEySw">
        <node concept="19SUe$" id="1a22ASGenpO" role="19SJt6">
          <property role="19SUeA" value="TODO: has to be implemented" />
        </node>
      </node>
    </node>
    <node concept="asaX9" id="1a22ASGenpS" role="lGtFl" />
  </node>
  <node concept="1TIwiD" id="4IIl9K1dBNL">
    <property role="3GE5qa" value="Core" />
    <property role="TrG5h" value="StartupHookFunction" />
    <property role="34LRSv" value="StartupHook" />
    <property role="R4oN_" value="called at the end of operating system initialisation and before the scheduler is running" />
    <property role="EcuMT" value="5453389227804228849" />
    <ref role="1TJDcQ" to="x27k:5_l8w1EmTvx" resolve="Function" />
    <node concept="asaX9" id="4IIl9K1jrB1" role="lGtFl" />
  </node>
  <node concept="1TIwiD" id="4IIl9K1dDkt">
    <property role="3GE5qa" value="Core" />
    <property role="TrG5h" value="PreTaskHookFunction" />
    <property role="R4oN_" value="called before executing a new task" />
    <property role="34LRSv" value="PreTaskHook" />
    <property role="EcuMT" value="5453389227804235037" />
    <ref role="1TJDcQ" to="x27k:5_l8w1EmTvx" resolve="Function" />
    <node concept="asaX9" id="4IIl9K1jrAZ" role="lGtFl" />
  </node>
  <node concept="1TIwiD" id="4IIl9K1dFdi">
    <property role="3GE5qa" value="Core" />
    <property role="TrG5h" value="PostTaskHookFunction" />
    <property role="R4oN_" value="called after executing the current task" />
    <property role="34LRSv" value="PostTaskHook" />
    <property role="EcuMT" value="5453389227804242770" />
    <ref role="1TJDcQ" to="x27k:5_l8w1EmTvx" resolve="Function" />
    <node concept="asaX9" id="4IIl9K1jrAX" role="lGtFl" />
  </node>
  <node concept="1TIwiD" id="6zjU44HG6xs">
    <property role="3GE5qa" value="Message.MessagePropertyType" />
    <property role="TrG5h" value="MessagePropertyType" />
    <property role="R5$K7" value="true" />
    <property role="R5$K2" value="false" />
    <property role="EcuMT" value="7553636366667507804" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
  </node>
  <node concept="PlHQZ" id="6zjU44HG6xt">
    <property role="3GE5qa" value="Message" />
    <property role="TrG5h" value="ICDataType" />
    <property role="EcuMT" value="7553636366667507805" />
    <node concept="1TJgyi" id="6zjU44HG6xu" role="1TKVEl">
      <property role="TrG5h" value="CDataType" />
      <property role="IQ2nx" value="7553636366667507806" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="2aEySx" id="6zjU44HG6xx" role="lGtFl">
      <node concept="19SGf9" id="6zjU44HG6xy" role="2aEySw">
        <node concept="19SUe$" id="6zjU44HG6xz" role="19SJt6">
          <property role="19SUeA" value="The CDataType attribute describes the data type of the message data using C language types (e.g. int or a structure name)." />
        </node>
      </node>
    </node>
  </node>
  <node concept="1TIwiD" id="6zjU44HG6xw">
    <property role="3GE5qa" value="Message.MessagePropertyType" />
    <property role="TrG5h" value="SendStaticInternal" />
    <property role="EcuMT" value="7553636366667507808" />
    <ref role="1TJDcQ" node="6zjU44HG6xs" resolve="MessagePropertyType" />
  </node>
  <node concept="1TIwiD" id="6zjU44HG6yG">
    <property role="3GE5qa" value="Message.Notification" />
    <property role="TrG5h" value="Notification" />
    <property role="R5$K7" value="true" />
    <property role="R5$K2" value="false" />
    <property role="EcuMT" value="7553636366667507884" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
  </node>
  <node concept="1TIwiD" id="6zjU44HG6yH">
    <property role="3GE5qa" value="Message.Notification" />
    <property role="TrG5h" value="None" />
    <property role="R4oN_" value="No notification is performed." />
    <property role="EcuMT" value="7553636366667507885" />
    <ref role="1TJDcQ" node="6zjU44HG6yG" resolve="Notification" />
  </node>
  <node concept="1TIwiD" id="6zjU44HG6yI">
    <property role="3GE5qa" value="Message.Notification" />
    <property role="TrG5h" value="ActivateTask" />
    <property role="R4oN_" value="a task is activated" />
    <property role="EcuMT" value="7553636366667507886" />
    <ref role="1TJDcQ" node="6zjU44HG6yG" resolve="Notification" />
    <node concept="1TJgyj" id="6zjU44HG6yR" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="Task" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="7553636366667507895" />
      <ref role="20lvS9" node="1x4fgD956tm" resolve="TaskRef" />
    </node>
  </node>
  <node concept="1TIwiD" id="6zjU44HG6yJ">
    <property role="3GE5qa" value="Message.Notification" />
    <property role="TrG5h" value="SetEvent" />
    <property role="R4oN_" value="an event is set for a task" />
    <property role="EcuMT" value="7553636366667507887" />
    <ref role="1TJDcQ" node="6zjU44HG6yG" resolve="Notification" />
    <node concept="1TJgyj" id="6zjU44HG6yT" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="Event" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="7553636366667507897" />
      <ref role="20lvS9" node="1x4fgD956ve" resolve="EventRef" />
    </node>
    <node concept="1TJgyj" id="6zjU44HG6yV" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="Task" />
      <property role="20lbJX" value="1" />
      <property role="IQ2ns" value="7553636366667507899" />
      <ref role="20lvS9" node="1x4fgD956tm" resolve="TaskRef" />
    </node>
  </node>
  <node concept="1TIwiD" id="6zjU44HG6yQ">
    <property role="3GE5qa" value="Message.Notification" />
    <property role="TrG5h" value="ComCallback" />
    <property role="R4oN_" value="a callback routine is called" />
    <property role="EcuMT" value="7553636366667507894" />
    <ref role="1TJDcQ" node="6zjU44HG6yG" resolve="Notification" />
    <node concept="1TJgyi" id="6zjU44HG6yY" role="1TKVEl">
      <property role="TrG5h" value="CallbackRoutineName" />
      <property role="IQ2nx" value="7553636366667507902" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
  <node concept="1TIwiD" id="6zjU44HG6z0">
    <property role="3GE5qa" value="Message.Notification" />
    <property role="TrG5h" value="Flag" />
    <property role="R4oN_" value="a Flag is set" />
    <property role="EcuMT" value="7553636366667507904" />
    <ref role="1TJDcQ" node="6zjU44HG6yG" resolve="Notification" />
    <node concept="PrWs8" id="6zjU44HG6z1" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="6zjU44HG6z3">
    <property role="3GE5qa" value="Message.Notification" />
    <property role="TrG5h" value="INMCallback" />
    <property role="R4oN_" value="A callback routine in an OSEK NM sub-system is called." />
    <property role="EcuMT" value="7553636366667507907" />
    <ref role="1TJDcQ" node="6zjU44HG6yG" resolve="Notification" />
    <node concept="1TJgyj" id="6zjU44HG6za" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="CallbackRoutineName" />
      <property role="IQ2ns" value="7553636366667507914" />
      <ref role="20lvS9" to="yq40:5jmmCdx$f5R" resolve="StringLiteral" />
    </node>
    <node concept="1TJgyj" id="6zjU44HG6z4" role="1TKVEi">
      <property role="20lmBu" value="aggregation" />
      <property role="20kJfa" value="MonitoredIpdu" />
      <property role="IQ2ns" value="7553636366667507908" />
      <ref role="20lvS9" to="mj1l:7FQByU3CrDB" resolve="NumberLiteral" />
    </node>
  </node>
</model>

