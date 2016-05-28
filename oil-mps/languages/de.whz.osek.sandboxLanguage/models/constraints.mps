<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:b3477cce-eb08-4bc5-aa01-ed64340ecf4e(de.whz.osek.sandboxLanguage.constraints)">
  <persistence version="9" />
  <languages>
    <use id="3f4bc5f5-c6c1-4a28-8b10-c83066ffa4a1" name="jetbrains.mps.lang.constraints" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="bpn0" ref="r:4732c7ac-787e-441b-b7cf-cc879d583fbc(de.whz.osek.sandboxLanguage.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" implicit="true" />
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
  </registry>
  <node concept="1M2fIO" id="6g77ZYUpnOl">
    <ref role="1M2myG" to="bpn0:6g77ZYUpcAM" resolve="SandboxDeclaration" />
    <node concept="EnEH3" id="6g77ZYUpnOm" role="1MhHOB">
      <ref role="EomxK" to="tpck:h0TrG11" resolve="name" />
      <node concept="Eqf_E" id="6g77ZYUpnOo" role="EtsB7">
        <node concept="3clFbS" id="6g77ZYUpnOp" role="2VODD2">
          <node concept="3clFbF" id="6g77ZYUpnPy" role="3cqZAp">
            <node concept="2OqwBi" id="6g77ZYUpqk$" role="3clFbG">
              <node concept="1PxgMI" id="6g77ZYUpq31" role="2Oq$k0">
                <ref role="1PxNhF" to="bpn0:6g77ZYUpcAL" resolve="SandboxLiteral" />
                <node concept="2OqwBi" id="6g77ZYUpoZT" role="1PxMeX">
                  <node concept="EsrRn" id="6g77ZYUpnPx" role="2Oq$k0" />
                  <node concept="3TrEf2" id="6g77ZYUppCr" role="2OqNvi">
                    <ref role="3Tt5mk" to="x27k:2VsHNE717Q8" />
                  </node>
                </node>
              </node>
              <node concept="3TrcHB" id="6g77ZYUpqVT" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1LLf8_" id="6g77ZYUpr2V" role="1LXaQT">
        <node concept="3clFbS" id="6g77ZYUpr2W" role="2VODD2">
          <node concept="3clFbF" id="6g77ZYUpr9D" role="3cqZAp">
            <node concept="2OqwBi" id="6g77ZYUpsyg" role="3clFbG">
              <node concept="2OqwBi" id="6g77ZYUpsbm" role="2Oq$k0">
                <node concept="1PxgMI" id="6g77ZYUprXA" role="2Oq$k0">
                  <ref role="1PxNhF" to="bpn0:6g77ZYUpcAL" resolve="SandboxLiteral" />
                  <node concept="2OqwBi" id="6g77ZYUprhi" role="1PxMeX">
                    <node concept="EsrRn" id="6g77ZYUpr9C" role="2Oq$k0" />
                    <node concept="3TrEf2" id="6g77ZYUpr_g" role="2OqNvi">
                      <ref role="3Tt5mk" to="x27k:2VsHNE717Q8" />
                    </node>
                  </node>
                </node>
                <node concept="3TrcHB" id="6g77ZYUpsuB" role="2OqNvi">
                  <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                </node>
              </node>
              <node concept="tyxLq" id="6g77ZYUpsDD" role="2OqNvi">
                <node concept="1Wqviy" id="6g77ZYUpsUR" role="tz02z" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

