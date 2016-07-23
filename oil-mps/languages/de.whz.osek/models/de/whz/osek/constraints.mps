<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:d523ef73-5f2d-4ce5-90be-1b098a330875(de.whz.osek.constraints)">
  <persistence version="9" />
  <languages>
    <use id="3f4bc5f5-c6c1-4a28-8b10-c83066ffa4a1" name="jetbrains.mps.lang.constraints" version="0" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="4" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="2" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="bwbq" ref="r:aa04fc7a-6e20-48c4-b6ac-7c1ce8638ec4(de.whz.osek.structure)" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
    </language>
    <language id="3f4bc5f5-c6c1-4a28-8b10-c83066ffa4a1" name="jetbrains.mps.lang.constraints">
      <concept id="1147467115080" name="jetbrains.mps.lang.constraints.structure.NodePropertyConstraint" flags="ng" index="EnEH3">
        <reference id="1147467295099" name="applicableProperty" index="EomxK" />
        <child id="1147468630220" name="propertyGetter" index="EtsB7" />
        <child id="1152963095733" name="propertySetter" index="1LXaQT" />
      </concept>
      <concept id="1147467790433" name="jetbrains.mps.lang.constraints.structure.ConstraintFunction_PropertyGetter" flags="in" index="Eqf_E" />
      <concept id="1147468365020" name="jetbrains.mps.lang.constraints.structure.ConstraintsFunctionParameter_node" flags="nn" index="EsrRn" />
      <concept id="1152959968041" name="jetbrains.mps.lang.constraints.structure.ConstraintFunction_PropertySetter" flags="in" index="1LLf8_" />
      <concept id="1213093968558" name="jetbrains.mps.lang.constraints.structure.ConceptConstraints" flags="ng" index="1M2fIO">
        <reference id="1213093996982" name="concept" index="1M2myG" />
        <child id="1213098023997" name="property" index="1MhHOB" />
      </concept>
      <concept id="1153138554286" name="jetbrains.mps.lang.constraints.structure.ConstraintsFunctionParameter_propertyValue" flags="nn" index="1Wqviy" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1138661924179" name="jetbrains.mps.lang.smodel.structure.Property_SetOperation" flags="nn" index="tyxLq">
        <child id="1138662048170" name="value" index="tz02z" />
      </concept>
      <concept id="1140137987495" name="jetbrains.mps.lang.smodel.structure.SNodeTypeCastExpression" flags="nn" index="1PxgMI">
        <reference id="1140138128738" name="concept" index="1PxNhF" />
        <child id="1140138123956" name="leftExpression" index="1PxMeX" />
      </concept>
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
      </concept>
    </language>
  </registry>
  <node concept="1M2fIO" id="4B0n6H25U2O">
    <ref role="1M2myG" to="bwbq:4B0n6H25803" resolve="OilObjectRef" />
  </node>
  <node concept="1M2fIO" id="6g77ZYUpC9i">
    <property role="3GE5qa" value="Resource" />
    <ref role="1M2myG" to="bwbq:6g77ZYUpC8T" resolve="ResourceDeclaration" />
    <node concept="EnEH3" id="6g77ZYUpC9p" role="1MhHOB">
      <ref role="EomxK" to="tpck:h0TrG11" resolve="name" />
      <node concept="Eqf_E" id="6g77ZYUpC9r" role="EtsB7">
        <node concept="3clFbS" id="6g77ZYUpC9s" role="2VODD2">
          <node concept="3clFbF" id="6g77ZYUpCa_" role="3cqZAp">
            <node concept="2OqwBi" id="6g77ZYUpDlD" role="3clFbG">
              <node concept="1PxgMI" id="6g77ZYUpD49" role="2Oq$k0">
                <ref role="1PxNhF" to="bwbq:6g77ZYUpzdT" resolve="IResource" />
                <node concept="2OqwBi" id="6g77ZYUpCkw" role="1PxMeX">
                  <node concept="EsrRn" id="6g77ZYUpCa$" role="2Oq$k0" />
                  <node concept="3TrEf2" id="6g77ZYUpCDz" role="2OqNvi">
                    <ref role="3Tt5mk" to="x27k:2VsHNE717Q8" />
                  </node>
                </node>
              </node>
              <node concept="3TrcHB" id="6g77ZYUpDWz" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1LLf8_" id="6g77ZYUpE3B" role="1LXaQT">
        <node concept="3clFbS" id="6g77ZYUpE3C" role="2VODD2">
          <node concept="3clFbF" id="6g77ZYUpE6b" role="3cqZAp">
            <node concept="2OqwBi" id="6g77ZYUpFwV" role="3clFbG">
              <node concept="2OqwBi" id="6g77ZYUpFaa" role="2Oq$k0">
                <node concept="1PxgMI" id="6g77ZYUpEWs" role="2Oq$k0">
                  <ref role="1PxNhF" to="bwbq:6g77ZYUpzdT" resolve="IResource" />
                  <node concept="2OqwBi" id="6g77ZYUpEdO" role="1PxMeX">
                    <node concept="EsrRn" id="6g77ZYUpE6a" role="2Oq$k0" />
                    <node concept="3TrEf2" id="6g77ZYUpExM" role="2OqNvi">
                      <ref role="3Tt5mk" to="x27k:2VsHNE717Q8" />
                    </node>
                  </node>
                </node>
                <node concept="3TrcHB" id="6g77ZYUpFtf" role="2OqNvi">
                  <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                </node>
              </node>
              <node concept="tyxLq" id="6g77ZYUpFCZ" role="2OqNvi">
                <node concept="1Wqviy" id="6g77ZYUpFFc" role="tz02z" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="4B0n6H25E3h">
    <property role="3GE5qa" value="Event" />
    <ref role="1M2myG" to="bwbq:4B0n6H25BL_" resolve="EventDeclaration" />
    <node concept="EnEH3" id="4B0n6H25E3i" role="1MhHOB">
      <ref role="EomxK" to="tpck:h0TrG11" resolve="name" />
      <node concept="Eqf_E" id="4B0n6H25E3k" role="EtsB7">
        <node concept="3clFbS" id="4B0n6H25E3l" role="2VODD2">
          <node concept="3clFbF" id="4B0n6H25E4u" role="3cqZAp">
            <node concept="2OqwBi" id="4B0n6H25FT6" role="3clFbG">
              <node concept="1PxgMI" id="4B0n6H25FBz" role="2Oq$k0">
                <ref role="1PxNhF" to="bwbq:1x4fgD956iF" resolve="EventLiteral" />
                <node concept="2OqwBi" id="4B0n6H25Eep" role="1PxMeX">
                  <node concept="EsrRn" id="4B0n6H25E4t" role="2Oq$k0" />
                  <node concept="3TrEf2" id="4B0n6H25Ezs" role="2OqNvi">
                    <ref role="3Tt5mk" to="x27k:2VsHNE717Q8" />
                  </node>
                </node>
              </node>
              <node concept="3TrcHB" id="4B0n6H25Gfi" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1LLf8_" id="4B0n6H25Gmk" role="1LXaQT">
        <node concept="3clFbS" id="4B0n6H25Gml" role="2VODD2">
          <node concept="3clFbF" id="4B0n6H25Gt2" role="3cqZAp">
            <node concept="2OqwBi" id="4B0n6H25HYC" role="3clFbG">
              <node concept="1PxgMI" id="4B0n6H25HKS" role="2Oq$k0">
                <ref role="1PxNhF" to="bwbq:1x4fgD956iF" resolve="EventLiteral" />
                <node concept="2OqwBi" id="4B0n6H25G$F" role="1PxMeX">
                  <node concept="EsrRn" id="4B0n6H25Gt1" role="2Oq$k0" />
                  <node concept="3TrEf2" id="4B0n6H25GSD" role="2OqNvi">
                    <ref role="3Tt5mk" to="x27k:2VsHNE717Q8" />
                  </node>
                </node>
              </node>
              <node concept="3TrcHB" id="4B0n6H25I$Z" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1M2fIO" id="2ZNMQTB12KK">
    <property role="3GE5qa" value="Task" />
    <ref role="1M2myG" to="bwbq:2ZNMQTB12lN" resolve="TaskMacro" />
    <node concept="EnEH3" id="2ZNMQTB12KL" role="1MhHOB">
      <ref role="EomxK" to="tpck:h0TrG11" resolve="name" />
      <node concept="1LLf8_" id="2ZNMQTB12KN" role="1LXaQT">
        <node concept="3clFbS" id="2ZNMQTB12KO" role="2VODD2">
          <node concept="3clFbF" id="2ZNMQTB15er" role="3cqZAp">
            <node concept="2OqwBi" id="2ZNMQTB17Uk" role="3clFbG">
              <node concept="2OqwBi" id="2ZNMQTB17o9" role="2Oq$k0">
                <node concept="2OqwBi" id="2ZNMQTB15sT" role="2Oq$k0">
                  <node concept="EsrRn" id="2ZNMQTB15ep" role="2Oq$k0" />
                  <node concept="3TrEf2" id="1Y5JHpRz0_U" role="2OqNvi">
                    <ref role="3Tt5mk" to="bwbq:2ZNMQTB12lR" />
                  </node>
                </node>
                <node concept="3TrcHB" id="2ZNMQTB17IK" role="2OqNvi">
                  <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                </node>
              </node>
              <node concept="tyxLq" id="2ZNMQTB189r" role="2OqNvi">
                <node concept="1Wqviy" id="2ZNMQTB18eb" role="tz02z" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="Eqf_E" id="2UjW4IkK1s5" role="EtsB7">
        <node concept="3clFbS" id="2UjW4IkK1s6" role="2VODD2">
          <node concept="3clFbF" id="2UjW4IkK1yg" role="3cqZAp">
            <node concept="2OqwBi" id="2UjW4IkK36R" role="3clFbG">
              <node concept="2OqwBi" id="2UjW4IkK1Ob" role="2Oq$k0">
                <node concept="EsrRn" id="2UjW4IkK1yf" role="2Oq$k0" />
                <node concept="3TrEf2" id="1Y5JHpRyZUl" role="2OqNvi">
                  <ref role="3Tt5mk" to="bwbq:2ZNMQTB12lR" />
                </node>
              </node>
              <node concept="3TrcHB" id="2UjW4IkK3yU" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

