<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:39bdb3b7-4bc3-45c6-92da-645d6d953b0d(de.whz.osek.mindstorms.generator.template.main@generator)">
  <persistence version="9" />
  <languages>
    <use id="c1c2a88a-323c-4605-a37d-9ab77a2ccbd2" name="com.mbeddr.mpsutil.suppresswarning" version="0" />
    <use id="223dd778-c44f-4ef3-9535-7aa7d12244a6" name="com.mbeddr.core.debug" version="0" />
    <use id="a9d69647-0840-491e-bf39-2eb0805d2011" name="com.mbeddr.core.statements" version="1" />
    <use id="3bf5377a-e904-4ded-9754-5a516023bfaa" name="com.mbeddr.core.pointers" version="0" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="4" />
    <use id="479c7a8c-02f9-43b5-9139-d910cb22f298" name="jetbrains.mps.core.xml" version="0" />
    <use id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core" version="1" />
    <use id="a482b416-d0c9-473f-8f67-725ed642b3f3" name="com.mbeddr.mpsutil.breadcrumb" version="0" />
    <use id="d09a16fb-1d68-4a92-a5a4-20b4b2f86a62" name="com.mbeddr.mpsutil.jung" version="0" />
    <use id="b4d28e19-7d2d-47e9-943e-3a41f97a0e52" name="com.mbeddr.mpsutil.plantuml.node" version="0" />
    <use id="63e0e566-5131-447e-90e3-12ea330e1a00" name="com.mbeddr.mpsutil.blutil" version="1" />
    <use id="6d11763d-483d-4b2b-8efc-09336c1b0001" name="com.mbeddr.core.modules" version="4" />
    <use id="61c69711-ed61-4850-81d9-7714ff227fb0" name="com.mbeddr.core.expressions" version="3" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="4" />
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="3" />
    <use id="ed6d7656-532c-4bc2-81d1-af945aeb8280" name="jetbrains.mps.baseLanguage.blTypes" version="0" />
    <use id="d7706f63-9be2-479c-a3da-ae92af1e64d5" name="jetbrains.mps.lang.generator.generationContext" version="0" />
    <use id="b401a680-8325-4110-8fd3-84331ff25bef" name="jetbrains.mps.lang.generator" version="0" />
    <use id="92d2ea16-5a42-4fdf-a676-c7604efe3504" name="de.slisson.mps.richtext" version="0" />
    <use id="2d7fadf5-33f6-4e80-a78f-0f739add2bde" name="com.mbeddr.core.buildconfig" version="1" />
    <use id="7a30de00-cb30-45dd-ab11-776f84eb73fe" name="de.whz.osek" version="0" />
    <use id="d4280a54-f6df-4383-aa41-d1b2bffa7eb1" name="com.mbeddr.core.base" version="3" />
    <use id="b5816e12-8c8a-48cb-b63a-257253332775" name="de.whz.osek.mindstorms" version="0" />
    <use id="f93d1dbe-bfd1-42dd-932a-f375fa6f5373" name="com.mbeddr.core.make" version="1" />
    <use id="9ded098b-ad6a-4657-bfd9-48636cfe8bc3" name="jetbrains.mps.lang.traceable" version="0" />
    <use id="760a0a8c-eabb-4521-8bfd-65db761a9ba3" name="jetbrains.mps.baseLanguage.logging" version="0" />
    <use id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections" version="0" />
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="0" />
    <use id="63650c59-16c8-498a-99c8-005c7ee9515d" name="jetbrains.mps.lang.access" version="0" />
    <use id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures" version="0" />
    <use id="28871551-2bfb-41c8-a699-a32be460b8d1" name="de.whz.make" version="0" />
    <use id="13744753-c81f-424a-9c1b-cf8943bf4e86" name="jetbrains.mps.lang.sharedConcepts" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="51wr" ref="r:b31f1c3c-99aa-4f1e-a329-cba27efb1a6b(com.mbeddr.core.buildconfig.structure)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="i2y7" ref="r:098cbe90-1cfd-414a-b5e8-aca28752df17(com.mbeddr.core.make.structure)" />
    <import index="f1b2" ref="r:d71c8116-04a3-4636-a4a4-ecaa1d59d2d4(de.whz.osek.mindstorms.structure)" implicit="true" />
    <import index="bwbq" ref="r:aa04fc7a-6e20-48c4-b6ac-7c1ce8638ec4(de.whz.osek.structure)" implicit="true" />
    <import index="ahli" ref="r:44ccebce-f3a6-4238-afbf-c4a18f6348c1(com.mbeddr.core.buildconfig.behavior)" implicit="true" />
    <import index="7loq" ref="r:6080ec09-c756-4f2a-9d90-7695b076e53c(de.whz.osek.behavior)" implicit="true" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" implicit="true" />
    <import index="c4fa" ref="r:9f0e84b6-2ec7-4f9e-83e0-feedc77b63a3(com.mbeddr.core.statements.structure)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1215695189714" name="jetbrains.mps.baseLanguage.structure.PlusAssignmentExpression" flags="nn" index="d57v9" />
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1154032098014" name="jetbrains.mps.baseLanguage.structure.AbstractLoopStatement" flags="nn" index="2LF5Ji">
        <child id="1154032183016" name="body" index="2LFqv$" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1225271177708" name="jetbrains.mps.baseLanguage.structure.StringType" flags="in" index="17QB3L" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068581242875" name="jetbrains.mps.baseLanguage.structure.PlusExpression" flags="nn" index="3cpWs3" />
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ng" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1080120340718" name="jetbrains.mps.baseLanguage.structure.AndExpression" flags="nn" index="1Wc70l" />
    </language>
    <language id="a9d69647-0840-491e-bf39-2eb0805d2011" name="com.mbeddr.core.statements">
      <concept id="4185783222026475861" name="com.mbeddr.core.statements.structure.StatementList" flags="ng" index="3XIRFW">
        <child id="4185783222026475862" name="statements" index="3XIRFZ" />
      </concept>
      <concept id="4185783222026464515" name="com.mbeddr.core.statements.structure.Statement" flags="ng" index="3XISUE" />
    </language>
    <language id="b401a680-8325-4110-8fd3-84331ff25bef" name="jetbrains.mps.lang.generator">
      <concept id="1114729360583" name="jetbrains.mps.lang.generator.structure.CopySrcListMacro" flags="ln" index="2b32R4">
        <child id="1168278589236" name="sourceNodesQuery" index="2P8S$" />
      </concept>
      <concept id="1095416546421" name="jetbrains.mps.lang.generator.structure.MappingConfiguration" flags="ig" index="bUwia">
        <child id="1167328349397" name="reductionMappingRule" index="3acgRq" />
        <child id="1167514678247" name="rootMappingRule" index="3lj3bC" />
      </concept>
      <concept id="1177093525992" name="jetbrains.mps.lang.generator.structure.InlineTemplate_RuleConsequence" flags="lg" index="gft3U">
        <child id="1177093586806" name="templateNode" index="gfFT$" />
      </concept>
      <concept id="1168619357332" name="jetbrains.mps.lang.generator.structure.RootTemplateAnnotation" flags="lg" index="n94m4">
        <reference id="1168619429071" name="applicableConcept" index="n9lRv" />
      </concept>
      <concept id="1167168920554" name="jetbrains.mps.lang.generator.structure.BaseMappingRule_Condition" flags="in" index="30G5F_" />
      <concept id="1167169188348" name="jetbrains.mps.lang.generator.structure.TemplateFunctionParameter_sourceNode" flags="nn" index="30H73N" />
      <concept id="1167169308231" name="jetbrains.mps.lang.generator.structure.BaseMappingRule" flags="ng" index="30H$t8">
        <reference id="1167169349424" name="applicableConcept" index="30HIoZ" />
        <child id="1167169362365" name="conditionFunction" index="30HLyM" />
      </concept>
      <concept id="1087833241328" name="jetbrains.mps.lang.generator.structure.PropertyMacro" flags="ln" index="17Uvod">
        <child id="1167756362303" name="propertyValueFunction" index="3zH0cK" />
      </concept>
      <concept id="1167327847730" name="jetbrains.mps.lang.generator.structure.Reduction_MappingRule" flags="lg" index="3aamgX">
        <child id="1169672767469" name="ruleConsequence" index="1lVwrX" />
      </concept>
      <concept id="1167514355419" name="jetbrains.mps.lang.generator.structure.Root_MappingRule" flags="lg" index="3lhOvk">
        <reference id="1167514355421" name="template" index="3lhOvi" />
      </concept>
      <concept id="1167756080639" name="jetbrains.mps.lang.generator.structure.PropertyMacro_GetPropertyValue" flags="in" index="3zFVjK" />
      <concept id="1167951910403" name="jetbrains.mps.lang.generator.structure.SourceSubstituteMacro_SourceNodesQuery" flags="in" index="3JmXsc" />
    </language>
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
      </concept>
    </language>
    <language id="f93d1dbe-bfd1-42dd-932a-f375fa6f5373" name="com.mbeddr.core.make">
      <concept id="8794027157967672694" name="com.mbeddr.core.make.structure.MacroLess" flags="ng" index="5LVLH" />
      <concept id="8794027157967672672" name="com.mbeddr.core.make.structure.MacroAt" flags="ng" index="5LVLV" />
      <concept id="7595578942776868431" name="com.mbeddr.core.make.structure.EmptyLine" flags="ng" index="12Nxi1" />
      <concept id="7595578942776864815" name="com.mbeddr.core.make.structure.Comment" flags="ng" index="12NxFx">
        <property id="7595578942776864816" name="comment" index="12NxFY" />
      </concept>
      <concept id="3373914745211365206" name="com.mbeddr.core.make.structure.Variable" flags="ng" index="3G52F3">
        <property id="7595578942777303019" name="assignmentType" index="12Lnk_" />
        <property id="3373914745211446888" name="value" index="3G5mJX" />
      </concept>
      <concept id="3373914745211590969" name="com.mbeddr.core.make.structure.VariableRefCommandItem" flags="ng" index="3G69iG">
        <reference id="3373914745211590970" name="var" index="3G69iJ" />
      </concept>
      <concept id="3373914745211590947" name="com.mbeddr.core.make.structure.TextCommandItem" flags="ng" index="3G69iQ">
        <property id="3373914745211590948" name="text" index="3G69iL" />
      </concept>
      <concept id="5950410542643589987" name="com.mbeddr.core.make.structure.TextDependency" flags="ng" index="3O_EAZ">
        <property id="5950410542643589988" name="text" index="3O_EAS" />
      </concept>
      <concept id="5950410542643587165" name="com.mbeddr.core.make.structure.Target" flags="ng" index="3O_Fa1">
        <property id="5950410542643587166" name="label" index="3O_Fa2" />
        <child id="5950410542643587172" name="commands" index="3O_FaS" />
        <child id="5950410542643587171" name="dependencies" index="3O_FaZ" />
      </concept>
      <concept id="5950410542643587169" name="com.mbeddr.core.make.structure.Command" flags="ng" index="3O_FaX">
        <child id="3373914745211590943" name="items" index="3G69ia" />
      </concept>
      <concept id="5950410542643585247" name="com.mbeddr.core.make.structure.Makefile" flags="ng" index="3O_FC3">
        <property id="8883346479719598695" name="include" index="3n8brD" />
        <child id="7595578942777957190" name="content" index="12RR68" />
      </concept>
    </language>
    <language id="d7706f63-9be2-479c-a3da-ae92af1e64d5" name="jetbrains.mps.lang.generator.generationContext">
      <concept id="1216860049635" name="jetbrains.mps.lang.generator.generationContext.structure.TemplateFunctionParameter_generationContext" flags="nn" index="1iwH7S" />
      <concept id="1217026863835" name="jetbrains.mps.lang.generator.generationContext.structure.GenerationContextOp_GetOriginalInputModel" flags="nn" index="1st3f0" />
    </language>
    <language id="28871551-2bfb-41c8-a699-a32be460b8d1" name="de.whz.make">
      <concept id="1982396683637904566" name="de.whz.make.structure.ChangeDirectoryCommandItem" flags="ng" index="3fDbvL" />
      <concept id="1739339442371593633" name="de.whz.make.structure.ParameterCommandItem" flags="ng" index="3Ygumw" />
      <concept id="1739339442371937747" name="de.whz.make.structure.MakeAllCommandItem" flags="ng" index="3Yhani" />
      <concept id="1739339442371978206" name="de.whz.make.structure.EchoCommandItem" flags="ng" index="3YiKfv" />
      <concept id="1739339442371981328" name="de.whz.make.structure.AtEchoCommandItem" flags="ng" index="3YiL0h" />
      <concept id="1739339442371995830" name="de.whz.make.structure.RemoveCommandItem" flags="ng" index="3YiWyR" />
      <concept id="1739339442371997243" name="de.whz.make.structure.CopyCommandItem" flags="ng" index="3YiWSU" />
      <concept id="1739339442371988736" name="de.whz.make.structure.CommandItem" flags="ng" index="3YiYO1">
        <child id="1739339442371993028" name="arguments" index="3YiZR5" />
      </concept>
    </language>
    <language id="6d11763d-483d-4b2b-8efc-09336c1b0001" name="com.mbeddr.core.modules">
      <concept id="6437088627575722831" name="com.mbeddr.core.modules.structure.IModuleContent" flags="ng" index="N3F5f">
        <property id="6708182213627106114" name="preventNameMangling" index="3mNxdG" />
      </concept>
      <concept id="6437088627575724001" name="com.mbeddr.core.modules.structure.Function" flags="ng" index="N3Fnx">
        <child id="4185783222026475860" name="body" index="3XIRFX" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="4693937538533521280" name="jetbrains.mps.lang.smodel.structure.OfConceptOperation" flags="ng" index="v3k3i">
        <child id="4693937538533538124" name="requestedConcept" index="v3oSu" />
      </concept>
      <concept id="7453996997717780434" name="jetbrains.mps.lang.smodel.structure.Node_GetSConceptOperation" flags="nn" index="2yIwOk" />
      <concept id="2396822768958367367" name="jetbrains.mps.lang.smodel.structure.AbstractTypeCastExpression" flags="nn" index="$5XWr">
        <reference id="6733348108486823428" name="concept" index="1m5ApE" />
        <child id="6733348108486823193" name="leftExpression" index="1m5AlR" />
      </concept>
      <concept id="1171315804604" name="jetbrains.mps.lang.smodel.structure.Model_RootsOperation" flags="nn" index="2RRcyG">
        <reference id="1171315804605" name="concept" index="2RRcyH" />
      </concept>
      <concept id="3562215692195599741" name="jetbrains.mps.lang.smodel.structure.SLinkImplicitSelect" flags="nn" index="13MTOL">
        <reference id="3562215692195600259" name="link" index="13MTZf" />
      </concept>
      <concept id="1139621453865" name="jetbrains.mps.lang.smodel.structure.Node_IsInstanceOfOperation" flags="nn" index="1mIQ4w">
        <child id="1177027386292" name="conceptArgument" index="cj9EA" />
      </concept>
      <concept id="1172008320231" name="jetbrains.mps.lang.smodel.structure.Node_IsNotNullOperation" flags="nn" index="3x8VRR" />
      <concept id="1172326502327" name="jetbrains.mps.lang.smodel.structure.Concept_IsExactlyOperation" flags="nn" index="3O6GUB">
        <child id="1206733650006" name="conceptArgument" index="3QVz_e" />
      </concept>
      <concept id="1140137987495" name="jetbrains.mps.lang.smodel.structure.SNodeTypeCastExpression" flags="nn" index="1PxgMI" />
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
      </concept>
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
      </concept>
      <concept id="1138056282393" name="jetbrains.mps.lang.smodel.structure.SLinkListAccess" flags="nn" index="3Tsc0h">
        <reference id="1138056546658" name="link" index="3TtcxE" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
        <child id="5169995583184591170" name="smodelAttribute" index="lGtFl" />
      </concept>
      <concept id="3364660638048049750" name="jetbrains.mps.lang.core.structure.PropertyAttribute" flags="ng" index="A9Btg">
        <property id="1757699476691236117" name="propertyName" index="2qtEX9" />
        <property id="1341860900487648621" name="propertyId" index="P4ACc" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="61c69711-ed61-4850-81d9-7714ff227fb0" name="com.mbeddr.core.expressions">
      <concept id="318113533128716675" name="com.mbeddr.core.expressions.structure.ITyped" flags="ng" index="2C2TGh">
        <child id="318113533128716676" name="type" index="2C2TGm" />
      </concept>
      <concept id="7892328519581699353" name="com.mbeddr.core.expressions.structure.VoidType" flags="ng" index="19Rifw" />
      <concept id="8860443239512128054" name="com.mbeddr.core.expressions.structure.Type" flags="ng" index="3TlMgo">
        <property id="2941277002445651368" name="const" index="2c7vTL" />
        <property id="2941277002448691247" name="volatile" index="2caQfQ" />
      </concept>
    </language>
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1204796164442" name="jetbrains.mps.baseLanguage.collections.structure.InternalSequenceOperation" flags="nn" index="23sCx2">
        <child id="1204796294226" name="closure" index="23t8la" />
      </concept>
      <concept id="1153943597977" name="jetbrains.mps.baseLanguage.collections.structure.ForEachStatement" flags="nn" index="2Gpval">
        <child id="1153944400369" name="variable" index="2Gsz3X" />
        <child id="1153944424730" name="inputSequence" index="2GsD0m" />
      </concept>
      <concept id="1153944193378" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariable" flags="nr" index="2GrKxI" />
      <concept id="1153944233411" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariableReference" flags="nn" index="2GrUjf">
        <reference id="1153944258490" name="variable" index="2Gs0qQ" />
      </concept>
      <concept id="1235566554328" name="jetbrains.mps.baseLanguage.collections.structure.AnyOperation" flags="nn" index="2HwmR7" />
      <concept id="1203518072036" name="jetbrains.mps.baseLanguage.collections.structure.SmartClosureParameterDeclaration" flags="ig" index="Rh6nW" />
      <concept id="1165525191778" name="jetbrains.mps.baseLanguage.collections.structure.GetFirstOperation" flags="nn" index="1uHKPH" />
      <concept id="1225727723840" name="jetbrains.mps.baseLanguage.collections.structure.FindFirstOperation" flags="nn" index="1z4cxt" />
    </language>
  </registry>
  <node concept="bUwia" id="6bDoeHuFrM2">
    <property role="TrG5h" value="main" />
    <node concept="3lhOvk" id="6bDoeHuFrM3" role="3lj3bC">
      <ref role="3lhOvi" node="2UjW4IkGi9D" resolve="Makefile" />
      <ref role="30HIoZ" to="51wr:6GqYvBOf2X8" resolve="BuildConfiguration" />
      <node concept="30G5F_" id="1I2SOvkamwh" role="30HLyM">
        <node concept="3clFbS" id="1I2SOvkamwi" role="2VODD2">
          <node concept="3clFbF" id="1I2SOvkamxn" role="3cqZAp">
            <node concept="1Wc70l" id="1I2SOvkansz" role="3clFbG">
              <node concept="2OqwBi" id="1I2SOvkanWd" role="3uHU7w">
                <node concept="2OqwBi" id="1I2SOvkan$S" role="2Oq$k0">
                  <node concept="30H73N" id="1I2SOvkanwb" role="2Oq$k0" />
                  <node concept="3TrEf2" id="3biQP485sDZ" role="2OqNvi">
                    <ref role="3Tt5mk" to="51wr:4BxItZJ4BoM" resolve="target" />
                  </node>
                </node>
                <node concept="1mIQ4w" id="1I2SOvkao4W" role="2OqNvi">
                  <node concept="chp4Y" id="1I2SOvkao8_" role="cj9EA">
                    <ref role="cht4Q" to="f1b2:4NwoSLUfe0h" resolve="EV3Platform" />
                  </node>
                </node>
              </node>
              <node concept="2OqwBi" id="1I2SOvkanb3" role="3uHU7B">
                <node concept="2OqwBi" id="1I2SOvkam_O" role="2Oq$k0">
                  <node concept="30H73N" id="1I2SOvkamxm" role="2Oq$k0" />
                  <node concept="3TrEf2" id="3biQP485stL" role="2OqNvi">
                    <ref role="3Tt5mk" to="51wr:4BxItZJ4BoM" resolve="target" />
                  </node>
                </node>
                <node concept="3x8VRR" id="1I2SOvkannB" role="2OqNvi" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="3O_FC3" id="6bDoeHuFrN$">
    <property role="TrG5h" value="OSEK_EV3" />
    <property role="3GE5qa" value="EV3" />
    <node concept="3G52F3" id="1wzo07Ao_ED" role="12RR68">
      <property role="TrG5h" value="NAME" />
      <property role="3G5mJX" value="Linefollower" />
      <node concept="17Uvod" id="1I2SOvka0gZ" role="lGtFl">
        <property role="P4ACc" value="f93d1dbe-bfd1-42dd-932a-f375fa6f5373/3373914745211365206/3373914745211446888" />
        <property role="2qtEX9" value="value" />
        <node concept="3zFVjK" id="1I2SOvka0h0" role="3zH0cK">
          <node concept="3clFbS" id="1I2SOvka0h1" role="2VODD2">
            <node concept="3clFbF" id="1I2SOvka0ie" role="3cqZAp">
              <node concept="2OqwBi" id="1I2SOvka5Xh" role="3clFbG">
                <node concept="2OqwBi" id="1I2SOvka1t_" role="2Oq$k0">
                  <node concept="2OqwBi" id="1I2SOvka0mH" role="2Oq$k0">
                    <node concept="30H73N" id="1I2SOvka0id" role="2Oq$k0" />
                    <node concept="3Tsc0h" id="1I2SOvka0wm" role="2OqNvi">
                      <ref role="3TtcxE" to="51wr:4o9sgv8R$fb" resolve="binaries" />
                    </node>
                  </node>
                  <node concept="1uHKPH" id="1I2SOvka4pz" role="2OqNvi" />
                </node>
                <node concept="3TrcHB" id="1I2SOvka694" role="2OqNvi">
                  <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3G52F3" id="1wzo07Ao_Hs" role="12RR68">
      <property role="TrG5h" value="PROGNAME" />
      <property role="3G5mJX" value="OSEK-$(NAME)" />
    </node>
    <node concept="12Nxi1" id="1wzo07Ao_Hx" role="12RR68" />
    <node concept="3G52F3" id="1wzo07Ao_HG" role="12RR68">
      <property role="TrG5h" value="PREFIX" />
      <property role="3G5mJX" value="arm-none-eabi-" />
    </node>
    <node concept="3G52F3" id="1wzo07Ao_HU" role="12RR68">
      <property role="TrG5h" value="CC" />
      <property role="3G5mJX" value="$(PREFIX)gcc" />
    </node>
    <node concept="3G52F3" id="1wzo07Ao_Ia" role="12RR68">
      <property role="TrG5h" value="AS" />
      <property role="3G5mJX" value="$(PREFIX)as" />
    </node>
    <node concept="3G52F3" id="1wzo07Ao_Is" role="12RR68">
      <property role="TrG5h" value="LD" />
      <property role="3G5mJX" value="$(PREFIX)ld" />
    </node>
    <node concept="3G52F3" id="1wzo07Ao_IK" role="12RR68">
      <property role="TrG5h" value="OBJCOPY" />
      <property role="3G5mJX" value="$(PREFIX)objcopy" />
    </node>
    <node concept="3G52F3" id="1wzo07Ao_J6" role="12RR68">
      <property role="TrG5h" value="OBJDUMP" />
      <property role="3G5mJX" value="$(PREFIX)objdump" />
    </node>
    <node concept="12Nxi1" id="1wzo07Ao_Ji" role="12RR68" />
    <node concept="3G52F3" id="1wzo07Ao_JF" role="12RR68">
      <property role="TrG5h" value="LOADADDR" />
      <property role="3G5mJX" value="0xC1000000" />
    </node>
    <node concept="12Nxi1" id="1wzo07Ao_JT" role="12RR68" />
    <node concept="3G52F3" id="1wzo07Ao_Km" role="12RR68">
      <property role="TrG5h" value="INCLUDEDIR" />
      <property role="3G5mJX" value="-I../leJOS_EV3/src/ev3 -Ikernel -I../leJOS_EV3/src/ev3/include/hw -I../leJOS_EV3/src/ev3/include -I../leJOS_EV3/src/ev3/include/armv5 -I../leJOS_EV3/src/ev3/include/armv5/am1808 -Iinclude -Iconfig/ARM926EJ-S -Iconfig/ARM926EJ-S/lego_ev3 -Isg/$(NAME) -I../ECRobot -I../leJOS_EV3/src/ev3/ninja -I./" />
    </node>
    <node concept="12Nxi1" id="1wzo07Ao_Lh" role="12RR68" />
    <node concept="3G52F3" id="1wzo07Ao_MU" role="12RR68">
      <property role="TrG5h" value="LDFLAGS" />
      <property role="3G5mJX" value="-nostdlib -T OSEK.ld" />
    </node>
    <node concept="3G52F3" id="1wzo07Ao_Nw" role="12RR68">
      <property role="TrG5h" value="CPUFLAG" />
      <property role="3G5mJX" value="-mcpu=arm926ej-s" />
    </node>
    <node concept="3G52F3" id="1wzo07Ao_O8" role="12RR68">
      <property role="TrG5h" value="STATIC_LIBS" />
      <property role="3G5mJX" value="../ECRobot/ECRobot.a ../newlib/libc.a ../leJOS_EV3/src/ev3/leJOS_EV3.a" />
    </node>
    <node concept="12Nxi1" id="1wzo07Ao_LK" role="12RR68" />
    <node concept="3G52F3" id="1wzo07Ao_OM" role="12RR68">
      <property role="TrG5h" value="ELF" />
      <property role="3G5mJX" value="$(PROGNAME).elf" />
    </node>
    <node concept="3G52F3" id="1wzo07Ao_Pu" role="12RR68">
      <property role="TrG5h" value="BIN" />
      <property role="3G5mJX" value="$(PROGNAME).bin" />
    </node>
    <node concept="3G52F3" id="1wzo07Ao_Qc" role="12RR68">
      <property role="TrG5h" value="ASM" />
      <property role="3G5mJX" value="$(PROGNAME).asm" />
    </node>
    <node concept="3G52F3" id="1wzo07Ao_QW" role="12RR68">
      <property role="TrG5h" value="BOOT_CMD" />
      <property role="3G5mJX" value="boot.cmd" />
    </node>
    <node concept="3G52F3" id="1wzo07Ao_RI" role="12RR68">
      <property role="TrG5h" value="BOOT_SCR" />
      <property role="3G5mJX" value="boot.scr" />
    </node>
    <node concept="12Nxi1" id="1wzo07Ao_S8" role="12RR68" />
    <node concept="3G52F3" id="1wzo07Ao_SX" role="12RR68">
      <property role="TrG5h" value="TOPPERS_OSEK_OIL_SOURCE" />
      <property role="3G5mJX" value="$(NAME).oil" />
    </node>
    <node concept="3G52F3" id="1wzo07Ao_TP" role="12RR68">
      <property role="TrG5h" value="TOPPERS_CFG_SOURCE" />
      <property role="3G5mJX" value="kernel_cfg.c" />
    </node>
    <node concept="3G52F3" id="1wzo07Ao_UJ" role="12RR68">
      <property role="TrG5h" value="TOPPERS_CFG_HEADER" />
      <property role="3G5mJX" value="kernel_id.h" />
    </node>
    <node concept="3G52F3" id="1wzo07Ao_VF" role="12RR68">
      <property role="TrG5h" value="TOPPERS_OSEK_ROOT" />
      <property role="3G5mJX" value="sg/" />
    </node>
    <node concept="12Nxi1" id="1wzo07Ao_M1" role="12RR68" />
    <node concept="3O_Fa1" id="1wzo07AoA4u" role="12RR68">
      <property role="3O_Fa2" value="$(NAME).oil" />
      <node concept="3O_FaX" id="1wzo07AoAJT" role="3O_FaS">
        <node concept="3YiWSU" id="1I2SOvka71_" role="3G69ia">
          <property role="3G69iL" value="cp" />
          <node concept="3G69iG" id="1wzo07AoAVD" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_VF" resolve="TOPPERS_OSEK_ROOT" />
          </node>
          <node concept="3G69iG" id="1wzo07AoAVN" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_ED" resolve="NAME" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoAWU" role="3YiZR5">
            <property role="3G69iL" value="/" />
          </node>
          <node concept="3G69iG" id="1wzo07AoAXb" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_ED" resolve="NAME" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoAXv" role="3YiZR5">
            <property role="3G69iL" value=".oil" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoAY8" role="3YiZR5">
            <property role="3G69iL" value=" ./" />
          </node>
          <node concept="3G69iG" id="1wzo07AoAYv" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_ED" resolve="NAME" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoAYT" role="3YiZR5">
            <property role="3G69iL" value=".oil" />
          </node>
        </node>
        <node concept="3G69iQ" id="1wzo07AoAJX" role="3G69ia">
          <property role="3G69iL" value="#TODO oil file in root makefile folder" />
        </node>
      </node>
    </node>
    <node concept="3O_Fa1" id="1wzo07AoAK$" role="12RR68">
      <property role="3O_Fa2" value="$(TOPPERS_CFG_SOURCE) $(TOPPERS_CFG_HEADER) implementation.oil" />
      <node concept="3O_EAZ" id="1wzo07AoAM8" role="3O_FaZ">
        <property role="3O_EAS" value="$(TOPPERS_OSEK_OIL_SOURCE)" />
      </node>
      <node concept="3O_FaX" id="1wzo07AoAMa" role="3O_FaS">
        <node concept="3YiL0h" id="1wzo07Aq8xO" role="3G69ia">
          <property role="3G69iL" value="@echo" />
          <node concept="3G69iQ" id="1wzo07AoAMp" role="3YiZR5">
            <property role="3G69iL" value="&quot;Generating OSEK kernel config files from " />
          </node>
          <node concept="3G69iG" id="1I2SOvk9Hw9" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_SX" resolve="TOPPERS_OSEK_OIL_SOURCE" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoAML" role="3YiZR5">
            <property role="3G69iL" value="&quot;" />
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07AoANn" role="3O_FaS">
        <node concept="3YiYO1" id="1I2SOvka71V" role="3G69ia">
          <property role="3G69iL" value="wine" />
          <node concept="3G69iG" id="1wzo07AoAUW" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_VF" resolve="TOPPERS_OSEK_ROOT" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoAV4" role="3YiZR5">
            <property role="3G69iL" value="sg.exe " />
          </node>
          <node concept="3G69iG" id="1wzo07AoAVd" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_SX" resolve="TOPPERS_OSEK_OIL_SOURCE" />
          </node>
          <node concept="3G69iQ" id="1I2SOvka72y" role="3YiZR5">
            <property role="3G69iL" value=" " />
          </node>
          <node concept="3Ygumw" id="1wzo07Aq8y8" role="3YiZR5">
            <property role="3G69iL" value="os=ECC2" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoB0D" role="3YiZR5">
            <property role="3G69iL" value="-I" />
          </node>
          <node concept="3G69iG" id="1wzo07AoB0S" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_VF" resolve="TOPPERS_OSEK_ROOT" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoB1a" role="3YiZR5">
            <property role="3G69iL" value="impl_oil " />
          </node>
          <node concept="3G69iQ" id="1wzo07AoB1M" role="3YiZR5">
            <property role="3G69iL" value="-template=" />
          </node>
          <node concept="3G69iG" id="1wzo07AoB29" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_VF" resolve="TOPPERS_OSEK_ROOT" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoB2z" role="3YiZR5">
            <property role="3G69iL" value="lego_nxt.sgt" />
          </node>
        </node>
      </node>
    </node>
    <node concept="3G52F3" id="1wzo07AoB6a" role="12RR68">
      <property role="TrG5h" value="C_SRC_FILES" />
      <property role="3G5mJX" value="OSEK.c ../newlib/syscalls.c $(wildcard kernel/*.c) $(wildcard config/ARM926EJ-S/*.c) $(wildcard config/ARM926EJ-S/lego_ev3/*.c) $(wildcard sg/$(NAME)/*.c) ./kernel_cfg.c" />
    </node>
    <node concept="3G52F3" id="1wzo07AoBdb" role="12RR68">
      <property role="TrG5h" value="S_SRC_FILES" />
      <property role="3G5mJX" value="$(wildcard *.S) $(wildcard config/ARM926EJ-S/*.S)" />
    </node>
    <node concept="12NxFx" id="1wzo07AoBjj" role="12RR68">
      <property role="12NxFY" value="TODO: '=' durch ':=' ersetzen" />
    </node>
    <node concept="3G52F3" id="1wzo07AoBln" role="12RR68">
      <property role="TrG5h" value="OBJECTS" />
      <property role="3G5mJX" value="$(C_SRC_FILES:.c=.o) $(S_SRC_FILES:.S=.o)" />
    </node>
    <node concept="n94m4" id="6bDoeHuFrN_" role="lGtFl">
      <ref role="n9lRv" to="51wr:6GqYvBOf2X8" resolve="BuildConfiguration" />
    </node>
    <node concept="12Nxi1" id="1wzo07AoBmq" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBnt" role="12RR68" />
    <node concept="3O_Fa1" id="1wzo07AoC4i" role="12RR68">
      <property role="3O_Fa2" value="all" />
      <node concept="3O_FaX" id="1wzo07AoC67" role="3O_FaS">
        <node concept="3YiL0h" id="1wzo07Aq8p5" role="3G69ia">
          <property role="3G69iL" value="@echo" />
          <node concept="3G69iQ" id="1wzo07AqcG9" role="3YiZR5">
            <property role="3G69iL" value="&quot;Linking " />
          </node>
          <node concept="3G69iG" id="1wzo07AqcGe" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_OM" resolve="ELF" />
          </node>
          <node concept="3G69iQ" id="1wzo07AqcGm" role="3YiZR5">
            <property role="3G69iL" value="...&quot;" />
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07AoC6K" role="3O_FaS">
        <node concept="3G69iG" id="1wzo07AoC6T" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_Is" resolve="LD" />
        </node>
        <node concept="3G69iG" id="1wzo07AoC6Z" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_MU" resolve="LDFLAGS" />
        </node>
        <node concept="3G69iG" id="1wzo07AoC77" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07AoBln" resolve="OBJECTS" />
        </node>
        <node concept="3G69iG" id="1wzo07AoC7h" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_O8" resolve="STATIC_LIBS" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq5of" role="3G69ia">
          <property role="3G69iL" value="o" />
        </node>
        <node concept="3G69iG" id="1wzo07AoC7E" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_OM" resolve="ELF" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq5oD" role="3G69ia">
          <property role="3G69iL" value="lgcc" />
        </node>
        <node concept="3G69iQ" id="1wzo07AoC8b" role="3G69ia">
          <property role="3G69iL" value="--library-path=../newlib" />
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07AoC8A" role="3O_FaS">
        <node concept="3YiL0h" id="1wzo07Aq8xe" role="3G69ia">
          <property role="3G69iL" value="@echo" />
          <node concept="3G69iQ" id="1wzo07AqcGD" role="3YiZR5">
            <property role="3G69iL" value="&quot;Creating " />
          </node>
          <node concept="3G69iG" id="1wzo07AqcGI" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_Pu" resolve="BIN" />
          </node>
          <node concept="3G69iQ" id="1wzo07AqcGQ" role="3YiZR5">
            <property role="3G69iL" value="...&quot;" />
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07AoC9t" role="3O_FaS">
        <node concept="3G69iG" id="1wzo07AoC9O" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_IK" resolve="OBJCOPY" />
        </node>
        <node concept="3G69iQ" id="1I2SOvka7yl" role="3G69ia">
          <property role="3G69iL" value="-O" />
        </node>
        <node concept="3G69iQ" id="1wzo07AoCa1" role="3G69ia">
          <property role="3G69iL" value="binary" />
        </node>
        <node concept="3G69iG" id="1wzo07AoCaa" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_OM" resolve="ELF" />
        </node>
        <node concept="3G69iG" id="1wzo07AoCam" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_Pu" resolve="BIN" />
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07AoCaD" role="3O_FaS">
        <node concept="3YiL0h" id="1wzo07Aq8xk" role="3G69ia">
          <property role="3G69iL" value="@echo" />
          <node concept="3G69iQ" id="1wzo07AqcHa" role="3YiZR5">
            <property role="3G69iL" value="&quot;Looking for entry point adress...&quot;" />
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07AoCbq" role="3O_FaS">
        <node concept="3G69iG" id="1wzo07AoCbU" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_J6" resolve="OBJDUMP" />
        </node>
        <node concept="3G69iQ" id="1I2SOvka7y_" role="3G69ia">
          <property role="3G69iL" value="-d" />
        </node>
        <node concept="3G69iG" id="1wzo07AoCc7" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_OM" resolve="ELF" />
        </node>
        <node concept="3G69iQ" id="1wzo07AoCcC" role="3G69ia">
          <property role="3G69iL" value="&gt;" />
        </node>
        <node concept="3G69iG" id="1wzo07AoCcN" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_Qc" resolve="ASM" />
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07AoCd6" role="3O_FaS">
        <node concept="3YiL0h" id="1wzo07Aq8xo" role="3G69ia">
          <property role="3G69iL" value="@echo" />
          <node concept="3G69iQ" id="1wzo07AqcHe" role="3YiZR5">
            <property role="3G69iL" value="&quot;Creating " />
          </node>
          <node concept="3G69iG" id="1wzo07AqcHj" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_QW" resolve="BOOT_CMD" />
          </node>
          <node concept="3G69iQ" id="1wzo07AqcHr" role="3YiZR5">
            <property role="3G69iL" value="...&quot;" />
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07AoCe7" role="3O_FaS">
        <node concept="3YiKfv" id="1wzo07Aq8xu" role="3G69ia">
          <property role="3G69iL" value="echo" />
          <node concept="3G69iQ" id="1wzo07AoCeX" role="3YiZR5">
            <property role="3G69iL" value="&quot;fatload" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoCf4" role="3YiZR5">
            <property role="3G69iL" value="mmc" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoCfn" role="3YiZR5">
            <property role="3G69iL" value="0" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoCfy" role="3YiZR5">
            <property role="3G69iL" value="0xC1000000 " />
          </node>
          <node concept="3G69iG" id="1wzo07AoCfJ" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_Pu" resolve="BIN" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoCfZ" role="3YiZR5">
            <property role="3G69iL" value=" &gt; " />
          </node>
          <node concept="3G69iG" id="1wzo07AoCgg" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_QW" resolve="BOOT_CMD" />
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07AoCgG" role="3O_FaS">
        <node concept="3YiKfv" id="1wzo07Aq8xC" role="3G69ia">
          <property role="3G69iL" value="echo" />
          <node concept="3G69iQ" id="1wzo07AoCh_" role="3YiZR5">
            <property role="3G69iL" value="&quot;go 0xC1000000&quot; &gt;&gt; " />
          </node>
          <node concept="3G69iG" id="1wzo07AoChP" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_QW" resolve="BOOT_CMD" />
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07AoChV" role="3O_FaS">
        <node concept="3YiL0h" id="1wzo07Aq8xI" role="3G69ia">
          <property role="3G69iL" value="@echo" />
          <node concept="3G69iQ" id="1wzo07AoCiT" role="3YiZR5">
            <property role="3G69iL" value="&quot;Creating " />
          </node>
          <node concept="3G69iG" id="1wzo07AoCj0" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_RI" resolve="BOOT_SCR" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoCja" role="3YiZR5">
            <property role="3G69iL" value="...&quot;" />
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07AoCjp" role="3O_FaS">
        <node concept="3YiYO1" id="1wzo07AqcIC" role="3G69ia">
          <property role="3G69iL" value="mkimage" />
          <node concept="3Ygumw" id="1wzo07Aq5pr" role="3YiZR5">
            <property role="3G69iL" value="A" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoCld" role="3YiZR5">
            <property role="3G69iL" value="arm " />
          </node>
          <node concept="3Ygumw" id="1wzo07Aq5qp" role="3YiZR5">
            <property role="3G69iL" value="O" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoClx" role="3YiZR5">
            <property role="3G69iL" value="linux " />
          </node>
          <node concept="3Ygumw" id="1wzo07Aq5rY" role="3YiZR5">
            <property role="3G69iL" value="T" />
          </node>
          <node concept="3G69iQ" id="1wzo07AoClX" role="3YiZR5">
            <property role="3G69iL" value="script " />
          </node>
          <node concept="3Ygumw" id="1wzo07Aq5sW" role="3YiZR5">
            <property role="3G69iL" value="C" />
          </node>
          <node concept="3G69iQ" id="1wzo07ApUC$" role="3YiZR5">
            <property role="3G69iL" value="none " />
          </node>
          <node concept="3Ygumw" id="1wzo07Aq5tU" role="3YiZR5">
            <property role="3G69iL" value="a" />
          </node>
          <node concept="3G69iQ" id="1wzo07ApUDD" role="3YiZR5">
            <property role="3G69iL" value="0 " />
          </node>
          <node concept="3Ygumw" id="1wzo07Aq5uS" role="3YiZR5">
            <property role="3G69iL" value="e" />
          </node>
          <node concept="3G69iQ" id="1wzo07ApUEu" role="3YiZR5">
            <property role="3G69iL" value="0 " />
          </node>
          <node concept="3Ygumw" id="1wzo07Aq5vQ" role="3YiZR5">
            <property role="3G69iL" value="n" />
          </node>
          <node concept="3G69iQ" id="1wzo07ApUFr" role="3YiZR5">
            <property role="3G69iL" value="'Execute " />
          </node>
          <node concept="3G69iG" id="1wzo07ApUFW" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_Pu" resolve="BIN" />
          </node>
          <node concept="3G69iQ" id="1wzo07ApUGw" role="3YiZR5">
            <property role="3G69iL" value="'" />
          </node>
          <node concept="3Ygumw" id="1wzo07Aq5wO" role="3YiZR5">
            <property role="3G69iL" value="d" />
          </node>
          <node concept="3G69iG" id="1wzo07ApUHH" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_QW" resolve="BOOT_CMD" />
          </node>
          <node concept="3G69iG" id="1wzo07ApUIn" role="3YiZR5">
            <ref role="3G69iJ" node="1wzo07Ao_RI" resolve="BOOT_SCR" />
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07ApUJn" role="3O_FaS">
        <node concept="3YiL0h" id="1wzo07Aq8yU" role="3G69ia">
          <property role="3G69iL" value="@echo" />
          <node concept="3G69iQ" id="1wzo07AqcJr" role="3YiZR5">
            <property role="3G69iL" value="&quot;Moving application to SD-Card&quot;" />
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07ApUKS" role="3O_FaS">
        <node concept="3YiYO1" id="1wzo07Aq9Hh" role="3G69ia">
          <property role="3G69iL" value="sudo" />
          <node concept="3YiYO1" id="1wzo07Aq9Qd" role="3YiZR5">
            <property role="3G69iL" value="mount" />
            <node concept="3G69iQ" id="1wzo07AqcJv" role="3YiZR5">
              <property role="3G69iL" value="/dev/mmcblk0p1 " />
            </node>
            <node concept="3G69iQ" id="1I2SOvk9_iK" role="3YiZR5">
              <property role="3G69iL" value="/mnt/sd" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07ApUMo" role="3O_FaS">
        <node concept="3YiYO1" id="1wzo07Aq9Qi" role="3G69ia">
          <property role="3G69iL" value="sudo" />
          <node concept="3YiYO1" id="1wzo07AqdwE" role="3YiZR5">
            <property role="3G69iL" value="rm" />
            <node concept="3Ygumw" id="1wzo07AqdwG" role="3YiZR5">
              <property role="3G69iL" value="f" />
            </node>
            <node concept="3G69iQ" id="1wzo07AqdwL" role="3YiZR5">
              <property role="3G69iL" value="/mnt/sd/" />
            </node>
            <node concept="3G69iG" id="1wzo07AqdwS" role="3YiZR5">
              <ref role="3G69iJ" node="1wzo07Ao_Pu" resolve="BIN" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07ApUNZ" role="3O_FaS">
        <node concept="3YiYO1" id="1wzo07Aq9Qz" role="3G69ia">
          <property role="3G69iL" value="sudo" />
          <node concept="3YiWyR" id="1I2SOvk9_hH" role="3YiZR5">
            <property role="3G69iL" value="rm" />
            <node concept="3Ygumw" id="1I2SOvk9_hL" role="3YiZR5">
              <property role="3G69iL" value="f" />
            </node>
            <node concept="3G69iQ" id="1I2SOvk9_hR" role="3YiZR5">
              <property role="3G69iL" value="/mnt/sd" />
            </node>
            <node concept="3G69iG" id="1I2SOvk9_hY" role="3YiZR5">
              <ref role="3G69iJ" node="1wzo07Ao_RI" resolve="BOOT_SCR" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07ApUQH" role="3O_FaS">
        <node concept="3YiYO1" id="1wzo07Aq9QE" role="3G69ia">
          <property role="3G69iL" value="sudo" />
          <node concept="3YiWSU" id="1I2SOvk9_hk" role="3YiZR5">
            <property role="3G69iL" value="cp" />
            <node concept="3G69iG" id="1I2SOvk9_hm" role="3YiZR5">
              <ref role="3G69iJ" node="1wzo07Ao_Pu" resolve="BIN" />
            </node>
            <node concept="3G69iQ" id="1I2SOvk9_hr" role="3YiZR5">
              <property role="3G69iL" value="/mnt/sd" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07ApUSQ" role="3O_FaS">
        <node concept="3YiYO1" id="1wzo07Aq9QK" role="3G69ia">
          <property role="3G69iL" value="sudo" />
          <node concept="3YiWSU" id="1wzo07AqdLX" role="3YiZR5">
            <property role="3G69iL" value="cp" />
            <node concept="3G69iG" id="1wzo07AqdLZ" role="3YiZR5">
              <ref role="3G69iJ" node="1wzo07Ao_RI" resolve="BOOT_SCR" />
            </node>
            <node concept="3G69iQ" id="1wzo07AqdM4" role="3YiZR5">
              <property role="3G69iL" value="/mnt/sd" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07ApUVe" role="3O_FaS">
        <node concept="3YiYO1" id="1wzo07Aq9R0" role="3G69ia">
          <property role="3G69iL" value="sudo" />
          <node concept="3YiYO1" id="1DDdy9C8m2t" role="3YiZR5">
            <property role="3G69iL" value="umount" />
            <node concept="3G69iQ" id="1DDdy9C8m2v" role="3YiZR5">
              <property role="3G69iL" value="/mnt/sd" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3O_EAZ" id="1wzo07AoC5P" role="3O_FaZ">
        <property role="3O_EAS" value="implementation.oil" />
      </node>
      <node concept="3O_EAZ" id="1wzo07AoC5U" role="3O_FaZ">
        <property role="3O_EAS" value="$(OBJECTS)" />
      </node>
      <node concept="3O_EAZ" id="1wzo07AoC62" role="3O_FaZ">
        <property role="3O_EAS" value="ECRobot" />
      </node>
    </node>
    <node concept="12Nxi1" id="1wzo07ApV7c" role="12RR68" />
    <node concept="3O_Fa1" id="1wzo07Aq5LI" role="12RR68">
      <property role="3O_Fa2" value="ECRobot" />
      <node concept="3O_FaX" id="1wzo07Aq5OV" role="3O_FaS">
        <node concept="3fDbvL" id="1I2SOvk9Hol" role="3G69ia">
          <property role="3G69iL" value="cd" />
          <node concept="3G69iQ" id="1I2SOvk9Hou" role="3YiZR5">
            <property role="3G69iL" value="../ECRobot" />
          </node>
          <node concept="3G69iQ" id="1I2SOvk9Hoz" role="3YiZR5">
            <property role="3G69iL" value=" &amp;&amp; " />
          </node>
          <node concept="3Yhani" id="1I2SOvk9HoE" role="3YiZR5">
            <property role="3G69iL" value="make all" />
          </node>
        </node>
      </node>
    </node>
    <node concept="3O_Fa1" id="1wzo07Aq5SG" role="12RR68">
      <property role="3O_Fa2" value="leJOS" />
      <node concept="3O_FaX" id="1wzo07Aq5VZ" role="3O_FaS">
        <node concept="3fDbvL" id="1I2SOvk9Hp5" role="3G69ia">
          <property role="3G69iL" value="cd" />
          <node concept="3G69iQ" id="1I2SOvk9Hpb" role="3YiZR5">
            <property role="3G69iL" value="../leJOS_EV3/src/ev3" />
          </node>
          <node concept="3G69iQ" id="1I2SOvk9Hpg" role="3YiZR5">
            <property role="3G69iL" value=" &amp;&amp; " />
          </node>
          <node concept="3Yhani" id="1I2SOvk9Hpr" role="3YiZR5">
            <property role="3G69iL" value="make all" />
          </node>
        </node>
      </node>
    </node>
    <node concept="3O_Fa1" id="1wzo07Aq5Xk" role="12RR68">
      <property role="3O_Fa2" value="%.o" />
      <node concept="3O_FaX" id="1wzo07Aq60I" role="3O_FaS">
        <node concept="3YiL0h" id="1wzo07Aq8yY" role="3G69ia">
          <property role="3G69iL" value="@echo" />
          <node concept="3G69iQ" id="1I2SOvk9HpT" role="3YiZR5">
            <property role="3G69iL" value="&quot;Compiling " />
          </node>
          <node concept="5LVLH" id="1I2SOvk9HpY" role="3YiZR5" />
          <node concept="3G69iQ" id="1I2SOvk9Hq6" role="3YiZR5">
            <property role="3G69iL" value="...&quot;" />
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07Aq61x" role="3O_FaS">
        <node concept="3G69iG" id="1wzo07Aq61E" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_HU" resolve="CC" />
        </node>
        <node concept="3G69iG" id="1wzo07Aq61R" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_Nw" resolve="CPUFLAG" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq61Z" role="3G69ia">
          <property role="3G69iL" value="c" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq629" role="3G69ia">
          <property role="3G69iL" value="g" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq62l" role="3G69ia">
          <property role="3G69iL" value="std=gnu99" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq62z" role="3G69ia">
          <property role="3G69iL" value="mthumb-interwork" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq62N" role="3G69ia">
          <property role="3G69iL" value="ffreestanding" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq635" role="3G69ia">
          <property role="3G69iL" value="fdata-sections" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq63p" role="3G69ia">
          <property role="3G69iL" value="ffunction-sections" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq63J" role="3G69ia">
          <property role="3G69iL" value="Wall" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq647" role="3G69ia">
          <property role="3G69iL" value="Dgcc" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq64x" role="3G69ia">
          <property role="3G69iL" value="Dam1808" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq64X" role="3G69ia">
          <property role="3G69iL" value="O0" />
        </node>
        <node concept="3G69iG" id="1wzo07Aq65r" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_Km" resolve="INCLUDEDIR" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq65V" role="3G69ia">
          <property role="3G69iL" value="o" />
        </node>
        <node concept="5LVLV" id="1wzo07Aq66t" role="3G69ia" />
        <node concept="5LVLH" id="1wzo07Aq671" role="3G69ia" />
      </node>
      <node concept="3O_EAZ" id="1wzo07Aq60G" role="3O_FaZ">
        <property role="3O_EAS" value="%.S" />
      </node>
    </node>
    <node concept="3O_Fa1" id="1wzo07Aq6bC" role="12RR68">
      <property role="3O_Fa2" value="%.o" />
      <node concept="3O_FaX" id="1wzo07Aq8z4" role="3O_FaS">
        <node concept="3YiL0h" id="1wzo07Aq8z8" role="3G69ia">
          <property role="3G69iL" value="@echo" />
          <node concept="3G69iQ" id="1wzo07Aq8ze" role="3YiZR5">
            <property role="3G69iL" value="&quot;Compiling " />
          </node>
          <node concept="5LVLH" id="1wzo07Aq8zl" role="3YiZR5" />
          <node concept="3G69iQ" id="1wzo07Aq8zv" role="3YiZR5">
            <property role="3G69iL" value="...&quot;" />
          </node>
        </node>
      </node>
      <node concept="3O_FaX" id="1wzo07Aq8zI" role="3O_FaS">
        <node concept="3G69iG" id="1wzo07Aq8zR" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_HU" resolve="CC" />
        </node>
        <node concept="3G69iG" id="1wzo07Aq8zX" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_Nw" resolve="CPUFLAG" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq8$5" role="3G69ia">
          <property role="3G69iL" value="c" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq8$f" role="3G69ia">
          <property role="3G69iL" value="g" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq8$r" role="3G69ia">
          <property role="3G69iL" value="fomit-frame-pointer" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq8$D" role="3G69ia">
          <property role="3G69iL" value="std=gnu99" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq8$T" role="3G69ia">
          <property role="3G69iL" value="mthumb-interwork" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq8_b" role="3G69ia">
          <property role="3G69iL" value="ffreestanding" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq8_v" role="3G69ia">
          <property role="3G69iL" value="fdata-sections" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq8_P" role="3G69ia">
          <property role="3G69iL" value="ffunction-sections" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq8Ad" role="3G69ia">
          <property role="3G69iL" value="Wall" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq8AB" role="3G69ia">
          <property role="3G69iL" value="Dgcc" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq8B3" role="3G69ia">
          <property role="3G69iL" value="Dam1808" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq8Bx" role="3G69ia">
          <property role="3G69iL" value="O0" />
        </node>
        <node concept="3G69iG" id="1wzo07Aq8C1" role="3G69ia">
          <ref role="3G69iJ" node="1wzo07Ao_Km" resolve="INCLUDEDIR" />
        </node>
        <node concept="3Ygumw" id="1wzo07Aq8Cz" role="3G69ia">
          <property role="3G69iL" value="o" />
        </node>
        <node concept="5LVLV" id="1wzo07Aq8D7" role="3G69ia" />
        <node concept="5LVLH" id="1wzo07Aq8DH" role="3G69ia" />
      </node>
      <node concept="3O_EAZ" id="1wzo07Aq6fr" role="3O_FaZ">
        <property role="3O_EAS" value="%.c" />
      </node>
    </node>
    <node concept="3O_Fa1" id="1wzo07Aq8IL" role="12RR68">
      <property role="3O_Fa2" value="clean" />
      <node concept="3O_FaX" id="1wzo07Aq8MW" role="3O_FaS">
        <node concept="3YiWyR" id="1I2SOvk9HqB" role="3G69ia">
          <property role="3G69iL" value="rm" />
          <node concept="3G69iQ" id="1I2SOvk9HqT" role="3YiZR5">
            <property role="3G69iL" value="$(wildcard .o) " />
          </node>
          <node concept="3G69iQ" id="1I2SOvk9Hra" role="3YiZR5">
            <property role="3G69iL" value="$(wildcard */*.o) " />
          </node>
          <node concept="3G69iQ" id="1I2SOvk9HrS" role="3YiZR5">
            <property role="3G69iL" value="$(wildcard */*/*.o) " />
          </node>
          <node concept="3G69iQ" id="1I2SOvk9Hsp" role="3YiZR5">
            <property role="3G69iL" value="$(wildcard */*/*/*.o)" />
          </node>
          <node concept="3G69iQ" id="1I2SOvk9HsG" role="3YiZR5">
            <property role="3G69iL" value="*.asm " />
          </node>
          <node concept="3G69iQ" id="1I2SOvk9Ht1" role="3YiZR5">
            <property role="3G69iL" value="boot.cmd " />
          </node>
          <node concept="3G69iQ" id="1I2SOvk9Hto" role="3YiZR5">
            <property role="3G69iL" value="boot.scr " />
          </node>
          <node concept="3G69iQ" id="1I2SOvk9HtL" role="3YiZR5">
            <property role="3G69iL" value="*.bin " />
          </node>
          <node concept="3G69iQ" id="1I2SOvk9Huc" role="3YiZR5">
            <property role="3G69iL" value="*.elf " />
          </node>
          <node concept="3G69iQ" id="1I2SOvk9HuD" role="3YiZR5">
            <property role="3G69iL" value="*.oil " />
          </node>
          <node concept="3G69iQ" id="1I2SOvk9Hv8" role="3YiZR5">
            <property role="3G69iL" value="kernel_cfg.c " />
          </node>
          <node concept="3G69iQ" id="1I2SOvk9HvD" role="3YiZR5">
            <property role="3G69iL" value="kernel_id.h" />
          </node>
        </node>
      </node>
    </node>
    <node concept="12Nxi1" id="1wzo07AoB$0" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoB_f" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBAv" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBBK" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBD2" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBEl" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBFD" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBGY" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBIk" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBJF" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBL3" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBMs" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBNQ" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBPh" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBQH" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBSa" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBTC" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBV7" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBWB" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBY8" role="12RR68" />
    <node concept="12Nxi1" id="1wzo07AoBZE" role="12RR68" />
  </node>
  <node concept="3O_FC3" id="2UjW4IkGi9D">
    <property role="TrG5h" value="Makefile" />
    <property role="3GE5qa" value="EV3" />
    <property role="3n8brD" value="$(EV3OSEK_ROOT)/OSEK_EV3/OSEK_EV3.mak" />
    <node concept="n94m4" id="2UjW4IkGi9E" role="lGtFl">
      <ref role="n9lRv" to="51wr:6GqYvBOf2X8" resolve="BuildConfiguration" />
    </node>
    <node concept="12NxFx" id="2UjW4IkGi9G" role="12RR68">
      <property role="12NxFY" value="Target specific Macros" />
    </node>
    <node concept="3G52F3" id="2UjW4IkGi9R" role="12RR68">
      <property role="TrG5h" value="TARGET" />
      <property role="3G5mJX" value="Linefollower" />
      <node concept="17Uvod" id="2UjW4IkGwDp" role="lGtFl">
        <property role="P4ACc" value="f93d1dbe-bfd1-42dd-932a-f375fa6f5373/3373914745211365206/3373914745211446888" />
        <property role="2qtEX9" value="value" />
        <node concept="3zFVjK" id="2UjW4IkGwDq" role="3zH0cK">
          <node concept="3clFbS" id="2UjW4IkGwDr" role="2VODD2">
            <node concept="3clFbF" id="2UjW4IkGwEB" role="3cqZAp">
              <node concept="2OqwBi" id="2UjW4IkGwED" role="3clFbG">
                <node concept="2OqwBi" id="2UjW4IkGwEE" role="2Oq$k0">
                  <node concept="2OqwBi" id="2UjW4IkGwEF" role="2Oq$k0">
                    <node concept="30H73N" id="2UjW4IkGwEG" role="2Oq$k0" />
                    <node concept="3Tsc0h" id="2UjW4IkGwEH" role="2OqNvi">
                      <ref role="3TtcxE" to="51wr:4o9sgv8R$fb" resolve="binaries" />
                    </node>
                  </node>
                  <node concept="1uHKPH" id="2UjW4IkGwEI" role="2OqNvi" />
                </node>
                <node concept="3TrcHB" id="2UjW4IkGwEJ" role="2OqNvi">
                  <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3G52F3" id="2UjW4IkGia7" role="12RR68">
      <property role="TrG5h" value="TARGET_SOURCES" />
      <property role="3G5mJX" value="Linefollower.c" />
      <node concept="17Uvod" id="v5qeus8pYU" role="lGtFl">
        <property role="P4ACc" value="f93d1dbe-bfd1-42dd-932a-f375fa6f5373/3373914745211365206/3373914745211446888" />
        <property role="2qtEX9" value="value" />
        <node concept="3zFVjK" id="v5qeus8pYV" role="3zH0cK">
          <node concept="3clFbS" id="v5qeus8pYW" role="2VODD2">
            <node concept="3cpWs8" id="v5qeus8q09" role="3cqZAp">
              <node concept="3cpWsn" id="v5qeus8q0c" role="3cpWs9">
                <property role="TrG5h" value="sources" />
                <node concept="17QB3L" id="v5qeus8q08" role="1tU5fm" />
                <node concept="Xl_RD" id="v5qeus8q6w" role="33vP2m" />
              </node>
            </node>
            <node concept="2Gpval" id="v5qeus8qa2" role="3cqZAp">
              <node concept="2GrKxI" id="v5qeus8qa4" role="2Gsz3X">
                <property role="TrG5h" value="implModule" />
              </node>
              <node concept="3clFbS" id="v5qeus8qa6" role="2LFqv$">
                <node concept="3clFbF" id="v5qeus8uQQ" role="3cqZAp">
                  <node concept="d57v9" id="v5qeus8uYv" role="3clFbG">
                    <node concept="3cpWs3" id="v5qeus8_Bp" role="37vLTx">
                      <node concept="Xl_RD" id="v5qeus8_Bv" role="3uHU7w">
                        <property role="Xl_RC" value=".c" />
                      </node>
                      <node concept="3cpWs3" id="v5qeus8vA0" role="3uHU7B">
                        <node concept="Xl_RD" id="v5qeus8v4i" role="3uHU7B">
                          <property role="Xl_RC" value=" \\\n\t" />
                        </node>
                        <node concept="2OqwBi" id="v5qeus8vRP" role="3uHU7w">
                          <node concept="2GrUjf" id="v5qeus8vBW" role="2Oq$k0">
                            <ref role="2Gs0qQ" node="v5qeus8qa4" resolve="implModule" />
                          </node>
                          <node concept="3TrcHB" id="v5qeus8wMM" role="2OqNvi">
                            <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="37vLTw" id="v5qeus8uQP" role="37vLTJ">
                      <ref role="3cqZAo" node="v5qeus8q0c" resolve="sources" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="2OqwBi" id="v5qeus8upQ" role="2GsD0m">
                <node concept="2OqwBi" id="v5qeus8rmR" role="2Oq$k0">
                  <node concept="2OqwBi" id="v5qeus8qnr" role="2Oq$k0">
                    <node concept="30H73N" id="v5qeus8qio" role="2Oq$k0" />
                    <node concept="3Tsc0h" id="v5qeus8qy5" role="2OqNvi">
                      <ref role="3TtcxE" to="51wr:4o9sgv8R$fb" resolve="binaries" />
                    </node>
                  </node>
                  <node concept="1z4cxt" id="GqrtFI6GMk" role="2OqNvi">
                    <node concept="1bVj0M" id="GqrtFI6GMm" role="23t8la">
                      <node concept="3clFbS" id="GqrtFI6GMn" role="1bW5cS">
                        <node concept="3clFbF" id="GqrtFI6GSZ" role="3cqZAp">
                          <node concept="2OqwBi" id="GqrtFI6GZE" role="3clFbG">
                            <node concept="37vLTw" id="GqrtFI6GSY" role="2Oq$k0">
                              <ref role="3cqZAo" node="GqrtFI6GMo" resolve="it" />
                            </node>
                            <node concept="1mIQ4w" id="GqrtFI6HdS" role="2OqNvi">
                              <node concept="chp4Y" id="GqrtFI6HkE" role="cj9EA">
                                <ref role="cht4Q" to="bwbq:4EZxVF6o_1Q" resolve="OsekExecutable" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="Rh6nW" id="GqrtFI6GMo" role="1bW2Oz">
                        <property role="TrG5h" value="it" />
                        <node concept="2jxLKc" id="GqrtFI6GMp" role="1tU5fm" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="2qgKlT" id="GqrtFI9n_T" role="2OqNvi">
                  <ref role="37wK5l" to="ahli:7RiewQ_lHPf" resolve="referencedImplModules" />
                </node>
              </node>
            </node>
            <node concept="3cpWs6" id="v5qeus8x5M" role="3cqZAp">
              <node concept="37vLTw" id="v5qeus8xoR" role="3cqZAk">
                <ref role="3cqZAo" node="v5qeus8q0c" resolve="sources" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="12Nxi1" id="v5qeus8nF1" role="12RR68" />
    <node concept="3G52F3" id="2UjW4IkGiaD" role="12RR68">
      <property role="TrG5h" value="TOPPERS_OSEK_OIL_SOURCE" />
      <property role="3G5mJX" value="Linefollower.oil" />
      <node concept="17Uvod" id="v5qeus7PES" role="lGtFl">
        <property role="P4ACc" value="f93d1dbe-bfd1-42dd-932a-f375fa6f5373/3373914745211365206/3373914745211446888" />
        <property role="2qtEX9" value="value" />
        <node concept="3zFVjK" id="v5qeus7PET" role="3zH0cK">
          <node concept="3clFbS" id="v5qeus7PEU" role="2VODD2">
            <node concept="3clFbF" id="v5qeus7PGd" role="3cqZAp">
              <node concept="3cpWs3" id="v5qeus84YQ" role="3clFbG">
                <node concept="Xl_RD" id="v5qeus84YW" role="3uHU7w">
                  <property role="Xl_RC" value=".oil" />
                </node>
                <node concept="3cpWs3" id="GqrtFI6MfN" role="3uHU7B">
                  <node concept="Xl_RD" id="GqrtFI6Mx0" role="3uHU7B">
                    <property role="Xl_RC" value="./" />
                  </node>
                  <node concept="2OqwBi" id="v5qeus8kIT" role="3uHU7w">
                    <node concept="1PxgMI" id="3biQP485x39" role="2Oq$k0">
                      <ref role="1m5ApE" to="bwbq:1x4fgD93Cjb" resolve="OilFile" />
                      <node concept="2OqwBi" id="GqrtFI6CE7" role="1m5AlR">
                        <node concept="2OqwBi" id="3biQP485tx3" role="2Oq$k0">
                          <node concept="2OqwBi" id="GqrtFI6_U1" role="2Oq$k0">
                            <node concept="2OqwBi" id="GqrtFI6x0U" role="2Oq$k0">
                              <node concept="2OqwBi" id="v5qeus7PKG" role="2Oq$k0">
                                <node concept="30H73N" id="v5qeus7PGc" role="2Oq$k0" />
                                <node concept="3Tsc0h" id="GqrtFI6w60" role="2OqNvi">
                                  <ref role="3TtcxE" to="51wr:4o9sgv8R$fb" resolve="binaries" />
                                </node>
                              </node>
                              <node concept="1z4cxt" id="GqrtFI6$2$" role="2OqNvi">
                                <node concept="1bVj0M" id="GqrtFI6$2A" role="23t8la">
                                  <node concept="3clFbS" id="GqrtFI6$2B" role="1bW5cS">
                                    <node concept="3clFbF" id="GqrtFI6$QU" role="3cqZAp">
                                      <node concept="2OqwBi" id="GqrtFI6$ZV" role="3clFbG">
                                        <node concept="37vLTw" id="GqrtFI6$QT" role="2Oq$k0">
                                          <ref role="3cqZAo" node="GqrtFI6$2C" resolve="it" />
                                        </node>
                                        <node concept="1mIQ4w" id="GqrtFI6_xk" role="2OqNvi">
                                          <node concept="chp4Y" id="GqrtFI6_FA" role="cj9EA">
                                            <ref role="cht4Q" to="bwbq:4EZxVF6o_1Q" resolve="OsekExecutable" />
                                          </node>
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                  <node concept="Rh6nW" id="GqrtFI6$2C" role="1bW2Oz">
                                    <property role="TrG5h" value="it" />
                                    <node concept="2jxLKc" id="GqrtFI6$2D" role="1tU5fm" />
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="3Tsc0h" id="GqrtFI6Ade" role="2OqNvi">
                              <ref role="3TtcxE" to="51wr:4o9sgv8QoKn" resolve="referencedModules" />
                            </node>
                          </node>
                          <node concept="1z4cxt" id="3biQP485vlN" role="2OqNvi">
                            <node concept="1bVj0M" id="3biQP485vlP" role="23t8la">
                              <node concept="3clFbS" id="3biQP485vlQ" role="1bW5cS">
                                <node concept="3clFbF" id="3biQP485w6b" role="3cqZAp">
                                  <node concept="2OqwBi" id="3biQP485wdR" role="3clFbG">
                                    <node concept="2OqwBi" id="GqrtFI6Asz" role="2Oq$k0">
                                      <node concept="37vLTw" id="3biQP485w6a" role="2Oq$k0">
                                        <ref role="3cqZAo" node="3biQP485vlR" resolve="it" />
                                      </node>
                                      <node concept="3TrEf2" id="GqrtFI6BiM" role="2OqNvi">
                                        <ref role="3Tt5mk" to="51wr:6GqYvBOf2Xc" resolve="module" />
                                      </node>
                                    </node>
                                    <node concept="1mIQ4w" id="3biQP485wnk" role="2OqNvi">
                                      <node concept="chp4Y" id="GqrtFI6BzI" role="cj9EA">
                                        <ref role="cht4Q" to="bwbq:1x4fgD93Cjb" resolve="OilFile" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                              <node concept="Rh6nW" id="3biQP485vlR" role="1bW2Oz">
                                <property role="TrG5h" value="it" />
                                <node concept="2jxLKc" id="3biQP485vlS" role="1tU5fm" />
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3TrEf2" id="GqrtFI6CYy" role="2OqNvi">
                          <ref role="3Tt5mk" to="51wr:6GqYvBOf2Xc" resolve="module" />
                        </node>
                      </node>
                    </node>
                    <node concept="3TrcHB" id="v5qeus8kTl" role="2OqNvi">
                      <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="12Nxi1" id="2UjW4IkGiaz" role="12RR68" />
    <node concept="12NxFx" id="4IIl9K1hbNh" role="12RR68">
      <property role="12NxFY" value="here you could define to use OSEK-hooks with preceeding -D, for example" />
    </node>
    <node concept="12NxFx" id="4IIl9K1hcht" role="12RR68">
      <property role="12NxFY" value="-DPRETASKHOOK -DPOSTTASKHOOK -DERRORHOOK -DSTARTUPHOOK -DSHUTDOWNHOOK" />
    </node>
    <node concept="3G52F3" id="4IIl9K1hdTH" role="12RR68">
      <property role="TrG5h" value="DEFINES" />
      <property role="3G5mJX" value="-D" />
      <node concept="17Uvod" id="4IIl9K1hekn" role="lGtFl">
        <property role="P4ACc" value="f93d1dbe-bfd1-42dd-932a-f375fa6f5373/3373914745211365206/3373914745211446888" />
        <property role="2qtEX9" value="value" />
        <node concept="3zFVjK" id="4IIl9K1heko" role="3zH0cK">
          <node concept="3clFbS" id="4IIl9K1hekp" role="2VODD2">
            <node concept="3cpWs8" id="4IIl9K1hf0y" role="3cqZAp">
              <node concept="3cpWsn" id="4IIl9K1hf0_" role="3cpWs9">
                <property role="TrG5h" value="osNode" />
                <node concept="3Tqbb2" id="4IIl9K1hf0x" role="1tU5fm">
                  <ref role="ehGHo" to="bwbq:1x4fgD94T$g" resolve="OS" />
                </node>
                <node concept="2OqwBi" id="4IIl9K1hpEy" role="33vP2m">
                  <node concept="2OqwBi" id="4IIl9K1hpeF" role="2Oq$k0">
                    <node concept="2OqwBi" id="4IIl9K1hobH" role="2Oq$k0">
                      <node concept="2OqwBi" id="4IIl9K1hnH6" role="2Oq$k0">
                        <node concept="1PxgMI" id="4IIl9K1hnoJ" role="2Oq$k0">
                          <ref role="1m5ApE" to="bwbq:4EZxVF6o_1Q" resolve="OsekExecutable" />
                          <node concept="2OqwBi" id="4IIl9K1hjfJ" role="1m5AlR">
                            <node concept="2OqwBi" id="4IIl9K1hfbT" role="2Oq$k0">
                              <node concept="30H73N" id="4IIl9K1hf7t" role="2Oq$k0" />
                              <node concept="3Tsc0h" id="4IIl9K1hfv3" role="2OqNvi">
                                <ref role="3TtcxE" to="51wr:4o9sgv8R$fb" resolve="binaries" />
                              </node>
                            </node>
                            <node concept="1z4cxt" id="4IIl9K1hmd_" role="2OqNvi">
                              <node concept="1bVj0M" id="4IIl9K1hmdB" role="23t8la">
                                <node concept="3clFbS" id="4IIl9K1hmdC" role="1bW5cS">
                                  <node concept="3clFbF" id="4IIl9K1hmiC" role="3cqZAp">
                                    <node concept="2OqwBi" id="4IIl9K1hmp9" role="3clFbG">
                                      <node concept="37vLTw" id="4IIl9K1hmiB" role="2Oq$k0">
                                        <ref role="3cqZAo" node="4IIl9K1hmdD" resolve="it" />
                                      </node>
                                      <node concept="1mIQ4w" id="4IIl9K1hmFW" role="2OqNvi">
                                        <node concept="chp4Y" id="4IIl9K1hmLX" role="cj9EA">
                                          <ref role="cht4Q" to="bwbq:4EZxVF6o_1Q" resolve="OsekExecutable" />
                                        </node>
                                      </node>
                                    </node>
                                  </node>
                                </node>
                                <node concept="Rh6nW" id="4IIl9K1hmdD" role="1bW2Oz">
                                  <property role="TrG5h" value="it" />
                                  <node concept="2jxLKc" id="4IIl9K1hmdE" role="1tU5fm" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="2qgKlT" id="4IIl9K1ho0z" role="2OqNvi">
                          <ref role="37wK5l" to="7loq:7JdyDzjneDe" resolve="referencedOilFiles" />
                        </node>
                      </node>
                      <node concept="13MTOL" id="4IIl9K1hoZR" role="2OqNvi">
                        <ref role="13MTZf" to="bwbq:7FCpXS_VYUZ" resolve="applicationDefinition" />
                      </node>
                    </node>
                    <node concept="13MTOL" id="4IIl9K1hpwv" role="2OqNvi">
                      <ref role="13MTZf" to="bwbq:1x4fgD956aq" resolve="os" />
                    </node>
                  </node>
                  <node concept="1uHKPH" id="4IIl9K1hpWE" role="2OqNvi" />
                </node>
              </node>
            </node>
            <node concept="3cpWs8" id="4IIl9K1hqiB" role="3cqZAp">
              <node concept="3cpWsn" id="4IIl9K1hqiE" role="3cpWs9">
                <property role="TrG5h" value="defines" />
                <node concept="17QB3L" id="4IIl9K1hqi_" role="1tU5fm" />
                <node concept="Xl_RD" id="4IIl9K1hrxh" role="33vP2m">
                  <property role="Xl_RC" value="" />
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="4IIl9K1hrPh" role="3cqZAp">
              <node concept="3clFbS" id="4IIl9K1hrPj" role="3clFbx">
                <node concept="3clFbF" id="4IIl9K1hssa" role="3cqZAp">
                  <node concept="d57v9" id="4IIl9K1hsCr" role="3clFbG">
                    <node concept="Xl_RD" id="4IIl9K1hsMP" role="37vLTx">
                      <property role="Xl_RC" value="-DSTARTUPHOOK " />
                    </node>
                    <node concept="37vLTw" id="4IIl9K1hss8" role="37vLTJ">
                      <ref role="3cqZAo" node="4IIl9K1hqiE" resolve="defines" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="2OqwBi" id="4IIl9K1hs6u" role="3clFbw">
                <node concept="37vLTw" id="4IIl9K1hrZD" role="2Oq$k0">
                  <ref role="3cqZAo" node="4IIl9K1hf0_" resolve="osNode" />
                </node>
                <node concept="3TrcHB" id="4IIl9K1hshN" role="2OqNvi">
                  <ref role="3TsBF5" to="bwbq:1x4fgD94T$w" resolve="startupHook" />
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="4IIl9K1htuE" role="3cqZAp">
              <node concept="3clFbS" id="4IIl9K1htuG" role="3clFbx">
                <node concept="3clFbF" id="4IIl9K1hude" role="3cqZAp">
                  <node concept="d57v9" id="4IIl9K1hupC" role="3clFbG">
                    <node concept="Xl_RD" id="4IIl9K1hu$b" role="37vLTx">
                      <property role="Xl_RC" value="-DSHUTDOWNHOOK " />
                    </node>
                    <node concept="37vLTw" id="4IIl9K1hudc" role="37vLTJ">
                      <ref role="3cqZAo" node="4IIl9K1hqiE" resolve="defines" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="2OqwBi" id="4IIl9K1htKF" role="3clFbw">
                <node concept="37vLTw" id="4IIl9K1htDJ" role="2Oq$k0">
                  <ref role="3cqZAo" node="4IIl9K1hf0_" resolve="osNode" />
                </node>
                <node concept="3TrcHB" id="4IIl9K1hu2I" role="2OqNvi">
                  <ref role="3TsBF5" to="bwbq:1x4fgD94T$O" resolve="shutdownHook" />
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="4IIl9K1hvSC" role="3cqZAp">
              <node concept="3clFbS" id="4IIl9K1hvSE" role="3clFbx">
                <node concept="3clFbF" id="4IIl9K1hwz2" role="3cqZAp">
                  <node concept="d57v9" id="4IIl9K1hwJ$" role="3clFbG">
                    <node concept="Xl_RD" id="4IIl9K1hwUg" role="37vLTx">
                      <property role="Xl_RC" value="-DPRETASKHOOK " />
                    </node>
                    <node concept="37vLTw" id="4IIl9K1hwz0" role="37vLTJ">
                      <ref role="3cqZAo" node="4IIl9K1hqiE" resolve="defines" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="2OqwBi" id="4IIl9K1hw6d" role="3clFbw">
                <node concept="37vLTw" id="4IIl9K1hvZa" role="2Oq$k0">
                  <ref role="3cqZAo" node="4IIl9K1hf0_" resolve="osNode" />
                </node>
                <node concept="3TrcHB" id="4IIl9K1hwop" role="2OqNvi">
                  <ref role="3TsBF5" to="bwbq:1x4fgD94T$T" resolve="preTaskHook" />
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="4IIl9K1hylt" role="3cqZAp">
              <node concept="3clFbS" id="4IIl9K1hylv" role="3clFbx">
                <node concept="3clFbF" id="4IIl9K1hz6d" role="3cqZAp">
                  <node concept="d57v9" id="4IIl9K1hziT" role="3clFbG">
                    <node concept="Xl_RD" id="4IIl9K1hztI" role="37vLTx">
                      <property role="Xl_RC" value="-DPOSTTASKHOOK " />
                    </node>
                    <node concept="37vLTw" id="4IIl9K1hz6b" role="37vLTJ">
                      <ref role="3cqZAo" node="4IIl9K1hqiE" resolve="defines" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="2OqwBi" id="4IIl9K1hyD6" role="3clFbw">
                <node concept="37vLTw" id="4IIl9K1hyx6" role="2Oq$k0">
                  <ref role="3cqZAo" node="4IIl9K1hf0_" resolve="osNode" />
                </node>
                <node concept="3TrcHB" id="4IIl9K1hyVr" role="2OqNvi">
                  <ref role="3TsBF5" to="bwbq:1x4fgD94T$Z" resolve="postTaskHook" />
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="4IIl9K1h_Kd" role="3cqZAp">
              <node concept="3clFbS" id="4IIl9K1h_Kf" role="3clFbx">
                <node concept="3clFbF" id="4IIl9K1hArp" role="3cqZAp">
                  <node concept="d57v9" id="4IIl9K1hACe" role="3clFbG">
                    <node concept="Xl_RD" id="4IIl9K1hANc" role="37vLTx">
                      <property role="Xl_RC" value="-DERRORHOOK " />
                    </node>
                    <node concept="37vLTw" id="4IIl9K1hArn" role="37vLTJ">
                      <ref role="3cqZAo" node="4IIl9K1hqiE" resolve="defines" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="2OqwBi" id="4IIl9K1h_Y0" role="3clFbw">
                <node concept="37vLTw" id="4IIl9K1h_QJ" role="2Oq$k0">
                  <ref role="3cqZAo" node="4IIl9K1hf0_" resolve="osNode" />
                </node>
                <node concept="3TrcHB" id="4IIl9K1hAgu" role="2OqNvi">
                  <ref role="3TsBF5" to="bwbq:1x4fgD94T$K" resolve="errorHook" />
                </node>
              </node>
            </node>
            <node concept="3clFbF" id="4IIl9K1hCnm" role="3cqZAp">
              <node concept="37vLTw" id="4IIl9K1hCnk" role="3clFbG">
                <ref role="3cqZAo" node="4IIl9K1hqiE" resolve="defines" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="12Nxi1" id="4IIl9K1hcGG" role="12RR68" />
    <node concept="12NxFx" id="2UjW4IkGiaR" role="12RR68">
      <property role="12NxFY" value="Don't modify below part" />
    </node>
    <node concept="3G52F3" id="75ETgceepKD" role="12RR68">
      <property role="TrG5h" value="EV3OSEK_ROOT" />
      <property role="12Lnk_" value="=" />
      <property role="3G5mJX" value="../.." />
      <node concept="17Uvod" id="75ETgceeqbH" role="lGtFl">
        <property role="P4ACc" value="f93d1dbe-bfd1-42dd-932a-f375fa6f5373/3373914745211365206/3373914745211446888" />
        <property role="2qtEX9" value="value" />
        <node concept="3zFVjK" id="75ETgceeqbI" role="3zH0cK">
          <node concept="3clFbS" id="75ETgceeqbJ" role="2VODD2">
            <node concept="3clFbF" id="75ETgceeqs1" role="3cqZAp">
              <node concept="2OqwBi" id="75ETgceeqs2" role="3clFbG">
                <node concept="1PxgMI" id="75ETgceeqs3" role="2Oq$k0">
                  <ref role="1m5ApE" to="f1b2:4NwoSLUfe0h" resolve="EV3Platform" />
                  <node concept="2OqwBi" id="75ETgceeqs4" role="1m5AlR">
                    <node concept="30H73N" id="75ETgceeqs5" role="2Oq$k0" />
                    <node concept="3TrEf2" id="75ETgceeqs6" role="2OqNvi">
                      <ref role="3Tt5mk" to="51wr:4BxItZJ4BoM" resolve="target" />
                    </node>
                  </node>
                </node>
                <node concept="3TrcHB" id="75ETgceeqFz" role="2OqNvi">
                  <ref role="3TsBF5" to="f1b2:75ETgceep0U" resolve="ev3osek_Root" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="bUwia" id="4IIl9K1mn2k">
    <property role="3GE5qa" value="EV3" />
    <property role="TrG5h" value="OsekHooks" />
    <node concept="3aamgX" id="5sDZ674awYc" role="3acgRq">
      <ref role="30HIoZ" to="x27k:5_l8w1EmTvx" resolve="Function" />
      <node concept="gft3U" id="5sDZ674a_mW" role="1lVwrX">
        <node concept="N3Fnx" id="5sDZ674aAtP" role="gfFT$">
          <property role="TrG5h" value="UserStartupHook" />
          <property role="3mNxdG" value="true" />
          <node concept="19Rifw" id="5sDZ674aAtQ" role="2C2TGm">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
          <node concept="3XIRFW" id="5sDZ674aAtR" role="3XIRFX">
            <node concept="3XISUE" id="5sDZ674aAtS" role="3XIRFZ">
              <node concept="2b32R4" id="5sDZ674aSsg" role="lGtFl">
                <node concept="3JmXsc" id="5sDZ674aSsj" role="2P8S$">
                  <node concept="3clFbS" id="5sDZ674aSsk" role="2VODD2">
                    <node concept="3clFbF" id="5sDZ674aSsq" role="3cqZAp">
                      <node concept="2OqwBi" id="5sDZ674aVqI" role="3clFbG">
                        <node concept="2OqwBi" id="5sDZ674aSsl" role="2Oq$k0">
                          <node concept="30H73N" id="5sDZ674aSsp" role="2Oq$k0" />
                          <node concept="3TrEf2" id="5sDZ674aUFU" role="2OqNvi">
                            <ref role="3Tt5mk" to="x27k:3CmSUB7Fp_k" resolve="body" />
                          </node>
                        </node>
                        <node concept="3Tsc0h" id="5sDZ674aVX0" role="2OqNvi">
                          <ref role="3TtcxE" to="c4fa:3CmSUB7Fp_m" resolve="statements" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="30G5F_" id="5sDZ674awYg" role="30HLyM">
        <node concept="3clFbS" id="5sDZ674awYh" role="2VODD2">
          <node concept="3clFbF" id="5sDZ674aA_3" role="3cqZAp">
            <node concept="1Wc70l" id="5sDZ674c58H" role="3clFbG">
              <node concept="1Wc70l" id="5sDZ674dc9X" role="3uHU7B">
                <node concept="2OqwBi" id="5sDZ674dkU0" role="3uHU7B">
                  <node concept="2OqwBi" id="5sDZ674dkhQ" role="2Oq$k0">
                    <node concept="2OqwBi" id="5sDZ674dj3_" role="2Oq$k0">
                      <node concept="2OqwBi" id="5sDZ674ddXj" role="2Oq$k0">
                        <node concept="2OqwBi" id="5sDZ674dcMx" role="2Oq$k0">
                          <node concept="2OqwBi" id="5sDZ674dcxk" role="2Oq$k0">
                            <node concept="1iwH7S" id="5sDZ674dcl$" role="2Oq$k0" />
                            <node concept="1st3f0" id="5sDZ674dcHg" role="2OqNvi" />
                          </node>
                          <node concept="2RRcyG" id="5sDZ674dcZh" role="2OqNvi">
                            <ref role="2RRcyH" to="51wr:6GqYvBOf2X8" resolve="BuildConfiguration" />
                          </node>
                        </node>
                        <node concept="1uHKPH" id="5sDZ674dhll" role="2OqNvi" />
                      </node>
                      <node concept="3TrEf2" id="5sDZ674djTV" role="2OqNvi">
                        <ref role="3Tt5mk" to="51wr:4BxItZJ4BoM" resolve="target" />
                      </node>
                    </node>
                    <node concept="2yIwOk" id="5sDZ674dk_2" role="2OqNvi" />
                  </node>
                  <node concept="3O6GUB" id="5sDZ674dp2o" role="2OqNvi">
                    <node concept="chp4Y" id="5sDZ674dpgR" role="3QVz_e">
                      <ref role="cht4Q" to="f1b2:4NwoSLUfe0h" resolve="EV3Platform" />
                    </node>
                  </node>
                </node>
                <node concept="2OqwBi" id="5sDZ674c6pR" role="3uHU7w">
                  <node concept="2OqwBi" id="5sDZ674c5C$" role="2Oq$k0">
                    <node concept="30H73N" id="5sDZ674c5kh" role="2Oq$k0" />
                    <node concept="3TrcHB" id="5sDZ674c6jR" role="2OqNvi">
                      <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                    </node>
                  </node>
                  <node concept="liA8E" id="5sDZ674c6K3" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object):boolean" resolve="equals" />
                    <node concept="Xl_RD" id="5sDZ674c6NZ" role="37wK5m">
                      <property role="Xl_RC" value="StartupHook" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="2OqwBi" id="5sDZ674aMFg" role="3uHU7w">
                <node concept="2OqwBi" id="5sDZ674aHBf" role="2Oq$k0">
                  <node concept="2OqwBi" id="5sDZ674aAQH" role="2Oq$k0">
                    <node concept="30H73N" id="5sDZ674aA_1" role="2Oq$k0" />
                    <node concept="3Tsc0h" id="5sDZ674aCaA" role="2OqNvi">
                      <ref role="3TtcxE" to="tpck:4uZwTti3__2" resolve="smodelAttribute" />
                    </node>
                  </node>
                  <node concept="v3k3i" id="5sDZ674aMut" role="2OqNvi">
                    <node concept="chp4Y" id="5sDZ674aMzD" role="v3oSu">
                      <ref role="cht4Q" to="x27k:7x9scHw5pU_" resolve="ImplementsExternalFunction" />
                    </node>
                  </node>
                </node>
                <node concept="2HwmR7" id="5sDZ674aNig" role="2OqNvi">
                  <node concept="1bVj0M" id="5sDZ674aNii" role="23t8la">
                    <node concept="3clFbS" id="5sDZ674aNij" role="1bW5cS">
                      <node concept="3clFbF" id="5sDZ674aNpv" role="3cqZAp">
                        <node concept="2OqwBi" id="5sDZ674aR$D" role="3clFbG">
                          <node concept="2OqwBi" id="5sDZ674aO7S" role="2Oq$k0">
                            <node concept="2OqwBi" id="5sDZ674aNuH" role="2Oq$k0">
                              <node concept="37vLTw" id="5sDZ674aNpu" role="2Oq$k0">
                                <ref role="3cqZAo" node="5sDZ674aNik" resolve="it" />
                              </node>
                              <node concept="3TrEf2" id="5sDZ674aNIU" role="2OqNvi">
                                <ref role="3Tt5mk" to="x27k:7x9scHw5vsd" resolve="implements" />
                              </node>
                            </node>
                            <node concept="3TrcHB" id="5sDZ674aPaN" role="2OqNvi">
                              <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                            </node>
                          </node>
                          <node concept="liA8E" id="5sDZ674aRT$" role="2OqNvi">
                            <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object):boolean" resolve="equals" />
                            <node concept="Xl_RD" id="5sDZ674aS3O" role="37wK5m">
                              <property role="Xl_RC" value="StartupHook" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="Rh6nW" id="5sDZ674aNik" role="1bW2Oz">
                      <property role="TrG5h" value="it" />
                      <node concept="2jxLKc" id="5sDZ674aNil" role="1tU5fm" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

