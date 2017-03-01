<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:a56922e1-9667-45ed-907c-acbc611f2952(de.whz.osek.mindstorms.typesystem)">
  <persistence version="9" />
  <languages>
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="0" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="4" />
    <use id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections" version="0" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="4" />
    <use id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="f1b2" ref="r:d71c8116-04a3-4636-a4a4-ecaa1d59d2d4(de.whz.osek.mindstorms.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1225271369338" name="jetbrains.mps.baseLanguage.structure.IsEmptyOperation" flags="nn" index="17RlXB" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123157" name="jetbrains.mps.baseLanguage.structure.Statement" flags="nn" index="3clFbH" />
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580320020" name="jetbrains.mps.baseLanguage.structure.IntegerConstant" flags="nn" index="3cmrfG">
        <property id="1068580320021" name="value" index="3cmrfH" />
      </concept>
      <concept id="1081506762703" name="jetbrains.mps.baseLanguage.structure.GreaterThanExpression" flags="nn" index="3eOSWO" />
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
    </language>
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
      </concept>
    </language>
    <language id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem">
      <concept id="1175517767210" name="jetbrains.mps.lang.typesystem.structure.ReportErrorStatement" flags="nn" index="2MkqsV">
        <child id="1175517851849" name="errorString" index="2MkJ7o" />
      </concept>
      <concept id="1227096774658" name="jetbrains.mps.lang.typesystem.structure.MessageStatement" flags="ng" index="2OEH$v">
        <child id="1227096802790" name="nodeToReport" index="2OEOjV" />
      </concept>
      <concept id="1195213580585" name="jetbrains.mps.lang.typesystem.structure.AbstractCheckingRule" flags="ig" index="18hYwZ">
        <child id="1195213635060" name="body" index="18ibNy" />
      </concept>
      <concept id="1195214364922" name="jetbrains.mps.lang.typesystem.structure.NonTypesystemRule" flags="ig" index="18kY7G" />
      <concept id="1174642788531" name="jetbrains.mps.lang.typesystem.structure.ConceptReference" flags="ig" index="1YaCAy">
        <reference id="1174642800329" name="concept" index="1YaFvo" />
      </concept>
      <concept id="1174648085619" name="jetbrains.mps.lang.typesystem.structure.AbstractRule" flags="ng" index="1YuPPy">
        <child id="1174648101952" name="applicableNode" index="1YuTPh" />
      </concept>
      <concept id="1174650418652" name="jetbrains.mps.lang.typesystem.structure.ApplicableNodeReference" flags="nn" index="1YBJjd">
        <reference id="1174650432090" name="applicableNode" index="1YBMHb" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="1138411891628" name="jetbrains.mps.lang.smodel.structure.SNodeOperation" flags="nn" index="eCIE_">
        <child id="1144104376918" name="parameter" index="1xVPHs" />
      </concept>
      <concept id="1171407110247" name="jetbrains.mps.lang.smodel.structure.Node_GetAncestorOperation" flags="nn" index="2Xjw5R" />
      <concept id="1139621453865" name="jetbrains.mps.lang.smodel.structure.Node_IsInstanceOfOperation" flags="nn" index="1mIQ4w">
        <child id="1177027386292" name="conceptArgument" index="cj9EA" />
      </concept>
      <concept id="1144101972840" name="jetbrains.mps.lang.smodel.structure.OperationParm_Concept" flags="ng" index="1xMEDy">
        <child id="1207343664468" name="conceptArgument" index="ri$Ld" />
      </concept>
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
      <concept id="1138056282393" name="jetbrains.mps.lang.smodel.structure.SLinkListAccess" flags="nn" index="3Tsc0h">
        <reference id="1138056546658" name="link" index="3TtcxE" />
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
      <concept id="1204796164442" name="jetbrains.mps.baseLanguage.collections.structure.InternalSequenceOperation" flags="nn" index="23sCx2">
        <child id="1204796294226" name="closure" index="23t8la" />
      </concept>
      <concept id="1203518072036" name="jetbrains.mps.baseLanguage.collections.structure.SmartClosureParameterDeclaration" flags="ig" index="Rh6nW" />
      <concept id="1162935959151" name="jetbrains.mps.baseLanguage.collections.structure.GetSizeOperation" flags="nn" index="34oBXx" />
      <concept id="1202120902084" name="jetbrains.mps.baseLanguage.collections.structure.WhereOperation" flags="nn" index="3zZkjj" />
    </language>
  </registry>
  <node concept="18kY7G" id="3DyPeXjX0yO">
    <property role="TrG5h" value="onlyOneDeInitialization" />
    <node concept="3clFbS" id="3DyPeXjX0yP" role="18ibNy">
      <node concept="3clFbJ" id="3DyPeXjX0$r" role="3cqZAp">
        <node concept="3clFbS" id="3DyPeXjX0$t" role="3clFbx">
          <node concept="2MkqsV" id="3DyPeXjX2YO" role="3cqZAp">
            <node concept="1YBJjd" id="3DyPeXjX303" role="2OEOjV">
              <ref role="1YBMHb" node="3DyPeXjX0yR" resolve="deviceTermination" />
            </node>
            <node concept="Xl_RD" id="3DyPeXjX2Z0" role="2MkJ7o">
              <property role="Xl_RC" value="you can only have one device de-init block" />
            </node>
          </node>
        </node>
        <node concept="3eOSWO" id="3DyPeXjX2SG" role="3clFbw">
          <node concept="3cmrfG" id="3DyPeXjX2SJ" role="3uHU7w">
            <property role="3cmrfH" value="1" />
          </node>
          <node concept="2OqwBi" id="3DyPeXjX2yR" role="3uHU7B">
            <node concept="2OqwBi" id="3DyPeXjX1wH" role="2Oq$k0">
              <node concept="2OqwBi" id="3DyPeXjX0P6" role="2Oq$k0">
                <node concept="2OqwBi" id="3DyPeXjX0B3" role="2Oq$k0">
                  <node concept="1YBJjd" id="3DyPeXjX0$E" role="2Oq$k0">
                    <ref role="1YBMHb" node="3DyPeXjX0yR" resolve="deviceTermination" />
                  </node>
                  <node concept="2Xjw5R" id="3DyPeXjX0K6" role="2OqNvi">
                    <node concept="1xMEDy" id="3DyPeXjX0K8" role="1xVPHs">
                      <node concept="chp4Y" id="40KGJHfNDdj" role="ri$Ld">
                        <ref role="cht4Q" to="x27k:5_l8w1EmTde" resolve="ImplementationModule" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3Tsc0h" id="40KGJHfNIqY" role="2OqNvi">
                  <ref role="3TtcxE" to="x27k:5_l8w1EmTdh" resolve="contents" />
                </node>
              </node>
              <node concept="3zZkjj" id="3DyPeXjX26Q" role="2OqNvi">
                <node concept="1bVj0M" id="3DyPeXjX26S" role="23t8la">
                  <node concept="3clFbS" id="3DyPeXjX26T" role="1bW5cS">
                    <node concept="3clFbF" id="3DyPeXjX29l" role="3cqZAp">
                      <node concept="2OqwBi" id="3DyPeXjX2cJ" role="3clFbG">
                        <node concept="37vLTw" id="3DyPeXjX29k" role="2Oq$k0">
                          <ref role="3cqZAo" node="3DyPeXjX26U" resolve="it" />
                        </node>
                        <node concept="1mIQ4w" id="3DyPeXjX2jW" role="2OqNvi">
                          <node concept="chp4Y" id="4NwoSLUfo5J" role="cj9EA">
                            <ref role="cht4Q" to="f1b2:3DyPeXjX0wR" resolve="DeviceTermination" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="Rh6nW" id="3DyPeXjX26U" role="1bW2Oz">
                    <property role="TrG5h" value="it" />
                    <node concept="2jxLKc" id="3DyPeXjX26V" role="1tU5fm" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="34oBXx" id="3DyPeXjX2IQ" role="2OqNvi" />
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="3DyPeXjX0yR" role="1YuTPh">
      <property role="TrG5h" value="deviceTermination" />
      <ref role="1YaFvo" to="f1b2:3DyPeXjX0wR" resolve="DeviceTermination" />
    </node>
  </node>
  <node concept="18kY7G" id="3DyPeXjWRcM">
    <property role="TrG5h" value="onlyOneInitialization" />
    <node concept="3clFbS" id="3DyPeXjWRcN" role="18ibNy">
      <node concept="3clFbJ" id="3DyPeXjWT5C" role="3cqZAp">
        <node concept="3clFbS" id="3DyPeXjWT5D" role="3clFbx">
          <node concept="2MkqsV" id="3DyPeXjX0v6" role="3cqZAp">
            <node concept="1YBJjd" id="3DyPeXjX0ws" role="2OEOjV">
              <ref role="1YBMHb" node="3DyPeXjWRcP" resolve="deviceInitialization" />
            </node>
            <node concept="Xl_RD" id="3DyPeXjX0vi" role="2MkJ7o">
              <property role="Xl_RC" value="you can only have one device init block" />
            </node>
          </node>
        </node>
        <node concept="3eOSWO" id="3DyPeXjX0p5" role="3clFbw">
          <node concept="3cmrfG" id="3DyPeXjX0p8" role="3uHU7w">
            <property role="3cmrfH" value="1" />
          </node>
          <node concept="2OqwBi" id="3DyPeXjX06B" role="3uHU7B">
            <node concept="2OqwBi" id="3DyPeXjWXbC" role="2Oq$k0">
              <node concept="2OqwBi" id="3DyPeXjWTMX" role="2Oq$k0">
                <node concept="2OqwBi" id="3DyPeXjWTt0" role="2Oq$k0">
                  <node concept="1YBJjd" id="3DyPeXjWT5O" role="2Oq$k0">
                    <ref role="1YBMHb" node="3DyPeXjWRcP" resolve="deviceInitialization" />
                  </node>
                  <node concept="2Xjw5R" id="3DyPeXjWT$7" role="2OqNvi">
                    <node concept="1xMEDy" id="3DyPeXjWT$9" role="1xVPHs">
                      <node concept="chp4Y" id="40KGJHfNDA4" role="ri$Ld">
                        <ref role="cht4Q" to="x27k:5_l8w1EmTde" resolve="ImplementationModule" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3Tsc0h" id="40KGJHfNEGO" role="2OqNvi">
                  <ref role="3TtcxE" to="x27k:5_l8w1EmTdh" resolve="contents" />
                </node>
              </node>
              <node concept="3zZkjj" id="3DyPeXjWYn4" role="2OqNvi">
                <node concept="1bVj0M" id="3DyPeXjWYn6" role="23t8la">
                  <node concept="3clFbS" id="3DyPeXjWYn7" role="1bW5cS">
                    <node concept="3clFbF" id="3DyPeXjWYpz" role="3cqZAp">
                      <node concept="2OqwBi" id="3DyPeXjWYsX" role="3clFbG">
                        <node concept="37vLTw" id="3DyPeXjWYpy" role="2Oq$k0">
                          <ref role="3cqZAo" node="3DyPeXjWYn8" resolve="it" />
                        </node>
                        <node concept="1mIQ4w" id="3DyPeXjWY$b" role="2OqNvi">
                          <node concept="chp4Y" id="4NwoSLUfoy2" role="cj9EA">
                            <ref role="cht4Q" to="f1b2:46z1WQnkGHW" resolve="DeviceInitialization" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="Rh6nW" id="3DyPeXjWYn8" role="1bW2Oz">
                    <property role="TrG5h" value="it" />
                    <node concept="2jxLKc" id="3DyPeXjWYn9" role="1tU5fm" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="34oBXx" id="3DyPeXjX0iv" role="2OqNvi" />
          </node>
        </node>
      </node>
      <node concept="3clFbH" id="3DyPeXjWXMz" role="3cqZAp" />
    </node>
    <node concept="1YaCAy" id="3DyPeXjWRcP" role="1YuTPh">
      <property role="TrG5h" value="deviceInitialization" />
      <ref role="1YaFvo" to="f1b2:46z1WQnkGHW" resolve="DeviceInitialization" />
    </node>
  </node>
  <node concept="18kY7G" id="6uyTK8G8t_P">
    <property role="TrG5h" value="check_EV3Platform" />
    <property role="3GE5qa" value="platform" />
    <node concept="3clFbS" id="6uyTK8G8t_Q" role="18ibNy">
      <node concept="3clFbJ" id="3s1LyzGuwm6" role="3cqZAp">
        <node concept="3clFbS" id="3s1LyzGuwm7" role="3clFbx">
          <node concept="2MkqsV" id="6uyTK8G8tLE" role="3cqZAp">
            <node concept="1YBJjd" id="6uyTK8G8tMV" role="2OEOjV">
              <ref role="1YBMHb" node="6uyTK8G8t_S" resolve="platform" />
            </node>
            <node concept="Xl_RD" id="6uyTK8G8tLZ" role="2MkJ7o">
              <property role="Xl_RC" value="no path to make specified" />
            </node>
          </node>
        </node>
        <node concept="2OqwBi" id="3s1LyzGEQwk" role="3clFbw">
          <node concept="2OqwBi" id="3s1LyzGuwqU" role="2Oq$k0">
            <node concept="1YBJjd" id="6uyTK8G8tCP" role="2Oq$k0">
              <ref role="1YBMHb" node="6uyTK8G8t_S" resolve="platform" />
            </node>
            <node concept="3TrcHB" id="6uyTK8G8tKD" role="2OqNvi">
              <ref role="3TsBF5" to="f1b2:6uyTK8G8sWC" resolve="make" />
            </node>
          </node>
          <node concept="17RlXB" id="3s1LyzGERo1" role="2OqNvi" />
        </node>
      </node>
      <node concept="3clFbJ" id="3s1LyzGuz0i" role="3cqZAp">
        <node concept="3clFbS" id="3s1LyzGuz0l" role="3clFbx">
          <node concept="2MkqsV" id="6uyTK8G8tXk" role="3cqZAp">
            <node concept="1YBJjd" id="6uyTK8G8tYn" role="2OEOjV">
              <ref role="1YBMHb" node="6uyTK8G8t_S" resolve="platform" />
            </node>
            <node concept="Xl_RD" id="6uyTK8G8tXD" role="2MkJ7o">
              <property role="Xl_RC" value="no path to compiler specified" />
            </node>
          </node>
        </node>
        <node concept="2OqwBi" id="3s1LyzGu$xH" role="3clFbw">
          <node concept="2OqwBi" id="3s1LyzGuz7n" role="2Oq$k0">
            <node concept="1YBJjd" id="6uyTK8G8tPv" role="2Oq$k0">
              <ref role="1YBMHb" node="6uyTK8G8t_S" resolve="platform" />
            </node>
            <node concept="3TrcHB" id="6uyTK8G8tWj" role="2OqNvi">
              <ref role="3TsBF5" to="f1b2:6uyTK8G8sWA" resolve="compiler" />
            </node>
          </node>
          <node concept="17RlXB" id="3s1LyzGu_nE" role="2OqNvi" />
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="6uyTK8G8t_S" role="1YuTPh">
      <property role="TrG5h" value="platform" />
      <ref role="1YaFvo" to="f1b2:4NwoSLUfe0h" resolve="EV3Platform" />
    </node>
  </node>
  <node concept="18kY7G" id="1I2SOvkaeBP">
    <property role="TrG5h" value="check_NxtPlatform" />
    <property role="3GE5qa" value="platform" />
    <node concept="3clFbS" id="1I2SOvkaeBQ" role="18ibNy">
      <node concept="3clFbJ" id="1I2SOvkaeDN" role="3cqZAp">
        <node concept="3clFbS" id="1I2SOvkaeDO" role="3clFbx">
          <node concept="2MkqsV" id="1I2SOvkaeDP" role="3cqZAp">
            <node concept="1YBJjd" id="1I2SOvkaeXj" role="2OEOjV">
              <ref role="1YBMHb" node="1I2SOvkaeBS" resolve="platform" />
            </node>
            <node concept="Xl_RD" id="1I2SOvkaeDR" role="2MkJ7o">
              <property role="Xl_RC" value="no path to make specified" />
            </node>
          </node>
        </node>
        <node concept="2OqwBi" id="1I2SOvkaeDS" role="3clFbw">
          <node concept="2OqwBi" id="1I2SOvkaeDT" role="2Oq$k0">
            <node concept="1YBJjd" id="1I2SOvkaeGF" role="2Oq$k0">
              <ref role="1YBMHb" node="1I2SOvkaeBS" resolve="platform" />
            </node>
            <node concept="3TrcHB" id="1I2SOvkaeOm" role="2OqNvi">
              <ref role="3TsBF5" to="f1b2:1I2SOvka8e5" resolve="make" />
            </node>
          </node>
          <node concept="17RlXB" id="1I2SOvkaeDW" role="2OqNvi" />
        </node>
      </node>
      <node concept="3clFbJ" id="1I2SOvkaeDX" role="3cqZAp">
        <node concept="3clFbS" id="1I2SOvkaeDY" role="3clFbx">
          <node concept="2MkqsV" id="1I2SOvkaeDZ" role="3cqZAp">
            <node concept="1YBJjd" id="1I2SOvkaeZc" role="2OEOjV">
              <ref role="1YBMHb" node="1I2SOvkaeBS" resolve="platform" />
            </node>
            <node concept="Xl_RD" id="1I2SOvkaeE1" role="2MkJ7o">
              <property role="Xl_RC" value="no path to compiler specified" />
            </node>
          </node>
        </node>
        <node concept="2OqwBi" id="1I2SOvkaeE2" role="3clFbw">
          <node concept="2OqwBi" id="1I2SOvkaeE3" role="2Oq$k0">
            <node concept="1YBJjd" id="1I2SOvkaePl" role="2Oq$k0">
              <ref role="1YBMHb" node="1I2SOvkaeBS" resolve="platform" />
            </node>
            <node concept="3TrcHB" id="1I2SOvkaeWk" role="2OqNvi">
              <ref role="3TsBF5" to="f1b2:1I2SOvka8e3" resolve="compiler" />
            </node>
          </node>
          <node concept="17RlXB" id="1I2SOvkaeE6" role="2OqNvi" />
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="1I2SOvkaeBS" role="1YuTPh">
      <property role="TrG5h" value="platform" />
      <ref role="1YaFvo" to="f1b2:1I2SOvka8e2" resolve="NxtPlatform" />
    </node>
  </node>
</model>

