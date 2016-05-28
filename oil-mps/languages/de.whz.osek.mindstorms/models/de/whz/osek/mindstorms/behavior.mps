<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:55614735-08eb-4b7b-8668-b4fdb087e28c(de.whz.osek.mindstorms.behavior)">
  <persistence version="9" />
  <languages>
    <use id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior" version="0" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="4" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="2" />
    <use id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="51wr" ref="r:b31f1c3c-99aa-4f1e-a329-cba27efb1a6b(com.mbeddr.core.buildconfig.structure)" />
    <import index="tpce" ref="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" />
    <import index="ahli" ref="r:44ccebce-f3a6-4238-afbf-c4a18f6348c1(com.mbeddr.core.buildconfig.behavior)" />
    <import index="mhfm" ref="3f233e7f-b8a6-46d2-a57f-795d56775243/java:org.jetbrains.annotations(Annotations/)" />
    <import index="vog7" ref="r:eaa106c6-4c8f-4807-a686-9c6a09ced82c(com.mbeddr.core.make.behavior)" />
    <import index="18ew" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.util()" />
    <import index="bwbq" ref="r:aa04fc7a-6e20-48c4-b6ac-7c1ce8638ec4(de.whz.osek.structure)" />
    <import index="f1b2" ref="r:d71c8116-04a3-4636-a4a4-ecaa1d59d2d4(de.whz.osek.mindstorms.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior">
      <concept id="1225194240794" name="jetbrains.mps.lang.behavior.structure.ConceptBehavior" flags="ng" index="13h7C7">
        <reference id="1225194240799" name="concept" index="13h7C2" />
        <child id="1225194240805" name="method" index="13h7CS" />
        <child id="1225194240801" name="constructor" index="13h7CW" />
      </concept>
      <concept id="1225194413805" name="jetbrains.mps.lang.behavior.structure.ConceptConstructorDeclaration" flags="in" index="13hLZK" />
      <concept id="1225194472830" name="jetbrains.mps.lang.behavior.structure.ConceptMethodDeclaration" flags="ng" index="13i0hz">
        <property id="5864038008284099149" name="isStatic" index="2Ki8OM" />
        <property id="1225194472833" name="isPrivate" index="13i0is" />
        <property id="1225194472832" name="isVirtual" index="13i0it" />
        <property id="1225194472834" name="isAbstract" index="13i0iv" />
        <reference id="1225194472831" name="overriddenMethod" index="13i0hy" />
      </concept>
      <concept id="1225194628440" name="jetbrains.mps.lang.behavior.structure.SuperNodeExpression" flags="nn" index="13iAh5" />
      <concept id="1225194691553" name="jetbrains.mps.lang.behavior.structure.ThisNodeExpression" flags="nn" index="13iPFW" />
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1188207840427" name="jetbrains.mps.baseLanguage.structure.AnnotationInstance" flags="nn" index="2AHcQZ">
        <reference id="1188208074048" name="annotation" index="2AI5Lk" />
      </concept>
      <concept id="1188208481402" name="jetbrains.mps.baseLanguage.structure.HasAnnotation" flags="ng" index="2AJDlI">
        <child id="1188208488637" name="annotation" index="2AJF6D" />
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
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1070534644030" name="jetbrains.mps.baseLanguage.structure.BooleanType" flags="in" index="10P_77" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="1225271177708" name="jetbrains.mps.baseLanguage.structure.StringType" flags="in" index="17QB3L" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123132" name="jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration" flags="ng" index="3clF44">
        <child id="1068580123133" name="returnType" index="3clF45" />
        <child id="1068580123135" name="body" index="3clF47" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580123137" name="jetbrains.mps.baseLanguage.structure.BooleanConstant" flags="nn" index="3clFbT">
        <property id="1068580123138" name="value" index="3clFbU" />
      </concept>
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
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ng" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="1138661924179" name="jetbrains.mps.lang.smodel.structure.Property_SetOperation" flags="nn" index="tyxLq">
        <child id="1138662048170" name="value" index="tz02z" />
      </concept>
      <concept id="1219352745532" name="jetbrains.mps.lang.smodel.structure.NodeRefExpression" flags="nn" index="3B5_sB">
        <reference id="1219352800908" name="referentNode" index="3B5MYn" />
      </concept>
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
      </concept>
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
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
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="540871147943773365" name="jetbrains.mps.baseLanguage.collections.structure.SingleArgumentSequenceOperation" flags="nn" index="25WWJ4">
        <child id="540871147943773366" name="argument" index="25WWJ7" />
      </concept>
      <concept id="1151688443754" name="jetbrains.mps.baseLanguage.collections.structure.ListType" flags="in" index="_YKpA">
        <child id="1151688676805" name="elementType" index="_ZDj9" />
      </concept>
      <concept id="1160612413312" name="jetbrains.mps.baseLanguage.collections.structure.AddElementOperation" flags="nn" index="TSZUe" />
    </language>
  </registry>
  <node concept="13h7C7" id="4NwoSLUfNQL">
    <ref role="13h7C2" to="f1b2:46z1WQnkGHW" resolve="DeviceInitialization" />
    <node concept="13hLZK" id="4NwoSLUfNQM" role="13h7CW">
      <node concept="3clFbS" id="4NwoSLUfNQN" role="2VODD2">
        <node concept="3clFbF" id="4NwoSLUfNQP" role="3cqZAp">
          <node concept="2OqwBi" id="4NwoSLUfPik" role="3clFbG">
            <node concept="2OqwBi" id="4NwoSLUfO51" role="2Oq$k0">
              <node concept="13iPFW" id="4NwoSLUfNQO" role="2Oq$k0" />
              <node concept="3TrcHB" id="4NwoSLUfOEP" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
            <node concept="tyxLq" id="4NwoSLUfPGS" role="2OqNvi">
              <node concept="Xl_RD" id="4NwoSLUfPKI" role="tz02z">
                <property role="Xl_RC" value="ecrobot_device_initialize" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="4NwoSLUfQn3">
    <ref role="13h7C2" to="f1b2:3DyPeXjX0wR" resolve="DeviceTermination" />
    <node concept="13hLZK" id="4NwoSLUfQn4" role="13h7CW">
      <node concept="3clFbS" id="4NwoSLUfQn5" role="2VODD2">
        <node concept="3clFbF" id="4NwoSLUfQn7" role="3cqZAp">
          <node concept="2OqwBi" id="4NwoSLUfSrr" role="3clFbG">
            <node concept="2OqwBi" id="4NwoSLUfQ_j" role="2Oq$k0">
              <node concept="13iPFW" id="4NwoSLUfQn6" role="2Oq$k0" />
              <node concept="3TrcHB" id="4NwoSLUfRKz" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
            <node concept="tyxLq" id="4NwoSLUfSD_" role="2OqNvi">
              <node concept="Xl_RD" id="4NwoSLUfSHr" role="tz02z">
                <property role="Xl_RC" value="ecrobot_device_terminate" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="5mFAe9pgm1g">
    <property role="3GE5qa" value="platform" />
    <ref role="13h7C2" to="f1b2:4NwoSLUfe0h" resolve="EV3Platform" />
    <node concept="13i0hz" id="5Hxjapwgule" role="13h7CS">
      <property role="TrG5h" value="getBinaryKind" />
      <property role="2Ki8OM" value="false" />
      <property role="13i0it" value="false" />
      <property role="13i0is" value="false" />
      <ref role="13i0hy" to="ahli:5HxjapwgqKP" resolve="getBinaryKind" />
      <node concept="3Tm1VV" id="5Hxjapwgulf" role="1B3o_S" />
      <node concept="_YKpA" id="5Hxjapwgulc" role="3clF45">
        <node concept="3Tqbb2" id="5Hxjapwguld" role="_ZDj9">
          <ref role="ehGHo" to="tpce:f_TIwhg" resolve="ConceptDeclaration" />
        </node>
      </node>
      <node concept="3clFbS" id="5Hxjapwguli" role="3clF47">
        <node concept="3cpWs8" id="5Hxjapwgulm" role="3cqZAp">
          <node concept="3cpWsn" id="5Hxjapwguln" role="3cpWs9">
            <property role="TrG5h" value="result" />
            <node concept="_YKpA" id="5Hxjapwgulo" role="1tU5fm">
              <node concept="3Tqbb2" id="5Hxjapwgulp" role="_ZDj9">
                <ref role="ehGHo" to="tpce:f_TIwhg" resolve="ConceptDeclaration" />
              </node>
            </node>
            <node concept="2OqwBi" id="5Hxjapwgulq" role="33vP2m">
              <node concept="13iAh5" id="4zqPC3aveFH" role="2Oq$k0" />
              <node concept="2qgKlT" id="5Hxjapwgulk" role="2OqNvi">
                <ref role="37wK5l" to="ahli:5HxjapwgqKP" resolve="getBinaryKind" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="5Hxjapwguls" role="3cqZAp">
          <node concept="2OqwBi" id="5Hxjapwgult" role="3clFbG">
            <node concept="37vLTw" id="5Hxjapwgulj" role="2Oq$k0">
              <ref role="3cqZAo" node="5Hxjapwguln" resolve="result" />
            </node>
            <node concept="TSZUe" id="5Hxjapwgulu" role="2OqNvi">
              <node concept="3B5_sB" id="5Hxjapwgulr" role="25WWJ7">
                <ref role="3B5MYn" to="51wr:4o9sgv8QoKi" resolve="Executable" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="5Hxjapwgulw" role="3cqZAp">
          <node concept="2OqwBi" id="5Hxjapwgulx" role="3clFbG">
            <node concept="37vLTw" id="5Hxjapwguly" role="2Oq$k0">
              <ref role="3cqZAo" node="5Hxjapwguln" resolve="result" />
            </node>
            <node concept="TSZUe" id="5Hxjapwgulz" role="2OqNvi">
              <node concept="3B5_sB" id="5Hxjapwgulv" role="25WWJ7">
                <ref role="3B5MYn" to="51wr:2kkumeGQcAy" resolve="StaticLibrary" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="4EZxVF6oQNs" role="3cqZAp">
          <node concept="2OqwBi" id="4EZxVF6oRvn" role="3clFbG">
            <node concept="37vLTw" id="4EZxVF6oQNq" role="2Oq$k0">
              <ref role="3cqZAo" node="5Hxjapwguln" resolve="result" />
            </node>
            <node concept="TSZUe" id="4EZxVF6oSXb" role="2OqNvi">
              <node concept="3B5_sB" id="4EZxVF6oSZi" role="25WWJ7">
                <ref role="3B5MYn" to="bwbq:4EZxVF6o_1Q" resolve="OsekExecutable" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="5Hxjapwgul$" role="3cqZAp">
          <node concept="37vLTw" id="5Hxjapwgul_" role="3cqZAk">
            <ref role="3cqZAo" node="5Hxjapwguln" resolve="result" />
          </node>
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="3s1LyzG8Hep" role="13h7CS">
      <property role="TrG5h" value="canMake" />
      <property role="13i0it" value="false" />
      <property role="13i0iv" value="false" />
      <ref role="13i0hy" to="vog7:3s1LyzG6KRG" resolve="canMake" />
      <node concept="3Tm1VV" id="3s1LyzG8Heq" role="1B3o_S" />
      <node concept="3clFbS" id="3s1LyzG8Het" role="3clF47">
        <node concept="3clFbF" id="3s1LyzG8Hew" role="3cqZAp">
          <node concept="3clFbT" id="3s1LyzG8Hev" role="3clFbG">
            <property role="3clFbU" value="true" />
          </node>
        </node>
      </node>
      <node concept="10P_77" id="3s1LyzG8Heu" role="3clF45" />
    </node>
    <node concept="13i0hz" id="3s1LyzG8Hex" role="13h7CS">
      <property role="TrG5h" value="getPathToMake" />
      <property role="13i0it" value="false" />
      <property role="13i0iv" value="false" />
      <ref role="13i0hy" to="vog7:3s1LyzG7eMZ" resolve="getPathToMake" />
      <node concept="3Tm1VV" id="3s1LyzG8Hey" role="1B3o_S" />
      <node concept="2AHcQZ" id="3s1LyzG8He_" role="2AJF6D">
        <ref role="2AI5Lk" to="mhfm:~Nullable" resolve="Nullable" />
      </node>
      <node concept="3clFbS" id="3s1LyzG8HeA" role="3clF47">
        <node concept="3clFbF" id="7c6uq_OsMXF" role="3cqZAp">
          <node concept="2OqwBi" id="7c6uq_OsMXG" role="3clFbG">
            <node concept="2YIFZM" id="7c6uq_OsMXH" role="2Oq$k0">
              <ref role="37wK5l" to="18ew:~MacrosFactory.getGlobal():jetbrains.mps.util.MacroHelper" resolve="getGlobal" />
              <ref role="1Pybhc" to="18ew:~MacrosFactory" resolve="MacrosFactory" />
            </node>
            <node concept="liA8E" id="7c6uq_OsMXI" role="2OqNvi">
              <ref role="37wK5l" to="18ew:~MacroHelper.expandPath(java.lang.String):java.lang.String" resolve="expandPath" />
              <node concept="2OqwBi" id="7c6uq_OsMXJ" role="37wK5m">
                <node concept="13iPFW" id="7c6uq_OsMXK" role="2Oq$k0" />
                <node concept="3TrcHB" id="6uyTK8G8toO" role="2OqNvi">
                  <ref role="3TsBF5" to="f1b2:6uyTK8G8sWC" resolve="make" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="17QB3L" id="3s1LyzG8HeB" role="3clF45" />
    </node>
    <node concept="13i0hz" id="7c6uq_OhAn9" role="13h7CS">
      <property role="TrG5h" value="getResolvedPathToCompiler" />
      <property role="13i0it" value="false" />
      <property role="13i0iv" value="false" />
      <node concept="3Tm1VV" id="7c6uq_OhAna" role="1B3o_S" />
      <node concept="3clFbS" id="7c6uq_OhAnc" role="3clF47">
        <node concept="3clFbF" id="7c6uq_OsMLn" role="3cqZAp">
          <node concept="2OqwBi" id="7c6uq_OsMLp" role="3clFbG">
            <node concept="2YIFZM" id="7c6uq_OsMLq" role="2Oq$k0">
              <ref role="37wK5l" to="18ew:~MacrosFactory.getGlobal():jetbrains.mps.util.MacroHelper" resolve="getGlobal" />
              <ref role="1Pybhc" to="18ew:~MacrosFactory" resolve="MacrosFactory" />
            </node>
            <node concept="liA8E" id="7c6uq_OsMLr" role="2OqNvi">
              <ref role="37wK5l" to="18ew:~MacroHelper.expandPath(java.lang.String):java.lang.String" resolve="expandPath" />
              <node concept="2OqwBi" id="7c6uq_OhAnh" role="37wK5m">
                <node concept="13iPFW" id="7c6uq_OhAni" role="2Oq$k0" />
                <node concept="3TrcHB" id="6uyTK8G8twc" role="2OqNvi">
                  <ref role="3TsBF5" to="f1b2:6uyTK8G8sWA" resolve="compiler" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="17QB3L" id="7c6uq_OhAnk" role="3clF45" />
    </node>
    <node concept="13hLZK" id="5mFAe9pgm1h" role="13h7CW">
      <node concept="3clFbS" id="5mFAe9pgm1i" role="2VODD2">
        <node concept="3clFbF" id="34x64NyRAM5" role="3cqZAp">
          <node concept="37vLTI" id="34x64NyRAM6" role="3clFbG">
            <node concept="Xl_RD" id="34x64NyRAM7" role="37vLTx">
              <property role="Xl_RC" value="gcc" />
            </node>
            <node concept="2OqwBi" id="34x64NyRAM8" role="37vLTJ">
              <node concept="13iPFW" id="34x64NyRAM9" role="2Oq$k0" />
              <node concept="3TrcHB" id="34x64NyRAMa" role="2OqNvi">
                <ref role="3TsBF5" to="f1b2:6uyTK8G8sWA" resolve="compiler" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="3s1LyzGbSh9" role="3cqZAp">
          <node concept="37vLTI" id="3s1LyzGbSha" role="3clFbG">
            <node concept="Xl_RD" id="3s1LyzGbShb" role="37vLTx">
              <property role="Xl_RC" value="make" />
            </node>
            <node concept="2OqwBi" id="3s1LyzGbShc" role="37vLTJ">
              <node concept="13iPFW" id="3s1LyzGbShd" role="2Oq$k0" />
              <node concept="3TrcHB" id="3s1LyzGbT1l" role="2OqNvi">
                <ref role="3TsBF5" to="f1b2:6uyTK8G8sWC" resolve="make" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="2UjW4IkGjMd" role="3cqZAp">
          <node concept="37vLTI" id="2UjW4IkGk9E" role="3clFbG">
            <node concept="Xl_RD" id="2UjW4IkGk9W" role="37vLTx">
              <property role="Xl_RC" value="../../OSEK_EV3/OSEK_EV3.mak" />
            </node>
            <node concept="2OqwBi" id="2UjW4IkGjPf" role="37vLTJ">
              <node concept="13iPFW" id="2UjW4IkGjMb" role="2Oq$k0" />
              <node concept="3TrcHB" id="2UjW4IkGk0N" role="2OqNvi">
                <ref role="3TsBF5" to="f1b2:2UjW4IkGiwW" resolve="ev3_osekDotMakPath" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="1I2SOvka8mW">
    <property role="3GE5qa" value="platform" />
    <ref role="13h7C2" to="f1b2:1I2SOvka8e2" resolve="NxtPlatform" />
    <node concept="13i0hz" id="1I2SOvka8qp" role="13h7CS">
      <property role="TrG5h" value="getBinaryKind" />
      <property role="2Ki8OM" value="false" />
      <property role="13i0it" value="false" />
      <property role="13i0is" value="false" />
      <ref role="13i0hy" to="ahli:5HxjapwgqKP" resolve="getBinaryKind" />
      <node concept="3Tm1VV" id="1I2SOvka8qq" role="1B3o_S" />
      <node concept="_YKpA" id="1I2SOvka8qr" role="3clF45">
        <node concept="3Tqbb2" id="1I2SOvka8qs" role="_ZDj9">
          <ref role="ehGHo" to="tpce:f_TIwhg" resolve="ConceptDeclaration" />
        </node>
      </node>
      <node concept="3clFbS" id="1I2SOvka8qt" role="3clF47">
        <node concept="3cpWs8" id="1I2SOvka8qu" role="3cqZAp">
          <node concept="3cpWsn" id="1I2SOvka8qv" role="3cpWs9">
            <property role="TrG5h" value="result" />
            <node concept="_YKpA" id="1I2SOvka8qw" role="1tU5fm">
              <node concept="3Tqbb2" id="1I2SOvka8qx" role="_ZDj9">
                <ref role="ehGHo" to="tpce:f_TIwhg" resolve="ConceptDeclaration" />
              </node>
            </node>
            <node concept="2OqwBi" id="1I2SOvka8qy" role="33vP2m">
              <node concept="13iAh5" id="1I2SOvka8qz" role="2Oq$k0" />
              <node concept="2qgKlT" id="1I2SOvka8q$" role="2OqNvi">
                <ref role="37wK5l" to="ahli:5HxjapwgqKP" resolve="getBinaryKind" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="1I2SOvka8q_" role="3cqZAp">
          <node concept="2OqwBi" id="1I2SOvka8qA" role="3clFbG">
            <node concept="37vLTw" id="1I2SOvka8qB" role="2Oq$k0">
              <ref role="3cqZAo" node="1I2SOvka8qv" resolve="result" />
            </node>
            <node concept="TSZUe" id="1I2SOvka8qC" role="2OqNvi">
              <node concept="3B5_sB" id="1I2SOvka8qD" role="25WWJ7">
                <ref role="3B5MYn" to="51wr:4o9sgv8QoKi" resolve="Executable" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="1I2SOvka8qE" role="3cqZAp">
          <node concept="2OqwBi" id="1I2SOvka8qF" role="3clFbG">
            <node concept="37vLTw" id="1I2SOvka8qG" role="2Oq$k0">
              <ref role="3cqZAo" node="1I2SOvka8qv" resolve="result" />
            </node>
            <node concept="TSZUe" id="1I2SOvka8qH" role="2OqNvi">
              <node concept="3B5_sB" id="1I2SOvka8qI" role="25WWJ7">
                <ref role="3B5MYn" to="51wr:2kkumeGQcAy" resolve="StaticLibrary" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="1I2SOvka8qJ" role="3cqZAp">
          <node concept="37vLTw" id="1I2SOvka8qK" role="3cqZAk">
            <ref role="3cqZAo" node="1I2SOvka8qv" resolve="result" />
          </node>
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="1I2SOvka8qL" role="13h7CS">
      <property role="TrG5h" value="canMake" />
      <property role="13i0it" value="false" />
      <property role="13i0iv" value="false" />
      <ref role="13i0hy" to="vog7:3s1LyzG6KRG" resolve="canMake" />
      <node concept="3Tm1VV" id="1I2SOvka8qM" role="1B3o_S" />
      <node concept="3clFbS" id="1I2SOvka8qN" role="3clF47">
        <node concept="3clFbF" id="1I2SOvka8qO" role="3cqZAp">
          <node concept="3clFbT" id="1I2SOvka8qP" role="3clFbG">
            <property role="3clFbU" value="true" />
          </node>
        </node>
      </node>
      <node concept="10P_77" id="1I2SOvka8qQ" role="3clF45" />
    </node>
    <node concept="13i0hz" id="1I2SOvka8qR" role="13h7CS">
      <property role="TrG5h" value="getPathToMake" />
      <property role="13i0it" value="false" />
      <property role="13i0iv" value="false" />
      <ref role="13i0hy" to="vog7:3s1LyzG7eMZ" resolve="getPathToMake" />
      <node concept="3Tm1VV" id="1I2SOvka8qS" role="1B3o_S" />
      <node concept="2AHcQZ" id="1I2SOvka8qT" role="2AJF6D">
        <ref role="2AI5Lk" to="mhfm:~Nullable" resolve="Nullable" />
      </node>
      <node concept="3clFbS" id="1I2SOvka8qU" role="3clF47">
        <node concept="3clFbF" id="1I2SOvka8qV" role="3cqZAp">
          <node concept="2OqwBi" id="1I2SOvka8qW" role="3clFbG">
            <node concept="2YIFZM" id="1I2SOvka8qX" role="2Oq$k0">
              <ref role="1Pybhc" to="18ew:~MacrosFactory" resolve="MacrosFactory" />
              <ref role="37wK5l" to="18ew:~MacrosFactory.getGlobal():jetbrains.mps.util.MacroHelper" resolve="getGlobal" />
            </node>
            <node concept="liA8E" id="1I2SOvka8qY" role="2OqNvi">
              <ref role="37wK5l" to="18ew:~MacroHelper.expandPath(java.lang.String):java.lang.String" resolve="expandPath" />
              <node concept="2OqwBi" id="1I2SOvka8qZ" role="37wK5m">
                <node concept="13iPFW" id="1I2SOvka8r0" role="2Oq$k0" />
                <node concept="3TrcHB" id="1I2SOvka8r1" role="2OqNvi">
                  <ref role="3TsBF5" to="f1b2:1I2SOvka8e5" resolve="make" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="17QB3L" id="1I2SOvka8r2" role="3clF45" />
    </node>
    <node concept="13i0hz" id="1I2SOvka8r3" role="13h7CS">
      <property role="TrG5h" value="getResolvedPathToCompiler" />
      <property role="13i0it" value="false" />
      <property role="13i0iv" value="false" />
      <node concept="3Tm1VV" id="1I2SOvka8r4" role="1B3o_S" />
      <node concept="3clFbS" id="1I2SOvka8r5" role="3clF47">
        <node concept="3clFbF" id="1I2SOvka8r6" role="3cqZAp">
          <node concept="2OqwBi" id="1I2SOvka8r7" role="3clFbG">
            <node concept="2YIFZM" id="1I2SOvka8r8" role="2Oq$k0">
              <ref role="37wK5l" to="18ew:~MacrosFactory.getGlobal():jetbrains.mps.util.MacroHelper" resolve="getGlobal" />
              <ref role="1Pybhc" to="18ew:~MacrosFactory" resolve="MacrosFactory" />
            </node>
            <node concept="liA8E" id="1I2SOvka8r9" role="2OqNvi">
              <ref role="37wK5l" to="18ew:~MacroHelper.expandPath(java.lang.String):java.lang.String" resolve="expandPath" />
              <node concept="2OqwBi" id="1I2SOvka8ra" role="37wK5m">
                <node concept="13iPFW" id="1I2SOvka8rb" role="2Oq$k0" />
                <node concept="3TrcHB" id="1I2SOvka8rc" role="2OqNvi">
                  <ref role="3TsBF5" to="f1b2:1I2SOvka8e3" resolve="compiler" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="17QB3L" id="1I2SOvka8rd" role="3clF45" />
    </node>
    <node concept="13hLZK" id="1I2SOvka8mX" role="13h7CW">
      <node concept="3clFbS" id="1I2SOvka8mY" role="2VODD2">
        <node concept="3clFbF" id="1I2SOvka8mZ" role="3cqZAp">
          <node concept="37vLTI" id="1I2SOvka8n0" role="3clFbG">
            <node concept="Xl_RD" id="1I2SOvka8n1" role="37vLTx">
              <property role="Xl_RC" value="gcc" />
            </node>
            <node concept="2OqwBi" id="1I2SOvka8n2" role="37vLTJ">
              <node concept="13iPFW" id="1I2SOvka8n3" role="2Oq$k0" />
              <node concept="3TrcHB" id="1I2SOvka8n4" role="2OqNvi">
                <ref role="3TsBF5" to="f1b2:1I2SOvka8e3" resolve="compiler" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="1I2SOvka8n5" role="3cqZAp">
          <node concept="37vLTI" id="1I2SOvka8n6" role="3clFbG">
            <node concept="Xl_RD" id="1I2SOvka8n7" role="37vLTx">
              <property role="Xl_RC" value="make" />
            </node>
            <node concept="2OqwBi" id="1I2SOvka8n8" role="37vLTJ">
              <node concept="13iPFW" id="1I2SOvka8n9" role="2Oq$k0" />
              <node concept="3TrcHB" id="1I2SOvka8na" role="2OqNvi">
                <ref role="3TsBF5" to="f1b2:1I2SOvka8e5" resolve="make" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

