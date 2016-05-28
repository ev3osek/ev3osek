<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:82e3e90d-4786-46a9-87d9-b64ea797578a(de.whz.make.behavior)">
  <persistence version="9" />
  <languages>
    <use id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="4vo2" ref="r:5212abd4-4a43-4236-b735-4bf4165f7444(de.whz.make.structure)" implicit="true" />
    <import index="i2y7" ref="r:098cbe90-1cfd-414a-b5e8-aca28752df17(com.mbeddr.core.make.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior">
      <concept id="1225194240794" name="jetbrains.mps.lang.behavior.structure.ConceptBehavior" flags="ng" index="13h7C7">
        <reference id="1225194240799" name="concept" index="13h7C2" />
        <child id="1225194240801" name="constructor" index="13h7CW" />
      </concept>
      <concept id="1225194413805" name="jetbrains.mps.lang.behavior.structure.ConceptConstructorDeclaration" flags="in" index="13hLZK" />
      <concept id="1225194691553" name="jetbrains.mps.lang.behavior.structure.ThisNodeExpression" flags="nn" index="13iPFW" />
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
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
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1138661924179" name="jetbrains.mps.lang.smodel.structure.Property_SetOperation" flags="nn" index="tyxLq">
        <child id="1138662048170" name="value" index="tz02z" />
      </concept>
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
    </language>
  </registry>
  <node concept="13h7C7" id="1wzo07ApVkB">
    <ref role="13h7C2" to="4vo2:1wzo07ApVfa" resolve="MakeCommandItem" />
    <node concept="13hLZK" id="1wzo07ApVkC" role="13h7CW">
      <node concept="3clFbS" id="1wzo07ApVkD" role="2VODD2">
        <node concept="3clFbF" id="1wzo07ApVkF" role="3cqZAp">
          <node concept="2OqwBi" id="1wzo07ApVCW" role="3clFbG">
            <node concept="2OqwBi" id="1wzo07ApVmC" role="2Oq$k0">
              <node concept="13iPFW" id="1wzo07ApVkE" role="2Oq$k0" />
              <node concept="3TrcHB" id="1wzo07ApVv_" role="2OqNvi">
                <ref role="3TsBF5" to="i2y7:2Vizpn2Mx$$" resolve="text" />
              </node>
            </node>
            <node concept="tyxLq" id="1wzo07ApVO9" role="2OqNvi">
              <node concept="Xl_RD" id="1wzo07ApVP9" role="tz02z">
                <property role="Xl_RC" value="make" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="1wzo07ApWny">
    <ref role="13h7C2" to="4vo2:1wzo07ApWnj" resolve="MakeAllCommandItem" />
    <node concept="13hLZK" id="1wzo07ApWnz" role="13h7CW">
      <node concept="3clFbS" id="1wzo07ApWn$" role="2VODD2">
        <node concept="3clFbF" id="1wzo07ApWou" role="3cqZAp">
          <node concept="37vLTI" id="1wzo07ApWA0" role="3clFbG">
            <node concept="Xl_RD" id="1wzo07ApWAi" role="37vLTx">
              <property role="Xl_RC" value="make all" />
            </node>
            <node concept="2OqwBi" id="1wzo07ApWqr" role="37vLTJ">
              <node concept="13iPFW" id="1wzo07ApWot" role="2Oq$k0" />
              <node concept="3TrcHB" id="1wzo07ApWv3" role="2OqNvi">
                <ref role="3TsBF5" to="i2y7:2Vizpn2Mx$$" resolve="text" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="1wzo07Aq6fD">
    <ref role="13h7C2" to="4vo2:1wzo07Aq6fu" resolve="EchoCommandItem" />
    <node concept="13hLZK" id="1wzo07Aq6fE" role="13h7CW">
      <node concept="3clFbS" id="1wzo07Aq6fF" role="2VODD2">
        <node concept="3clFbF" id="1wzo07Aq6fH" role="3cqZAp">
          <node concept="2OqwBi" id="1wzo07Aq6wY" role="3clFbG">
            <node concept="2OqwBi" id="1wzo07Aq6hE" role="2Oq$k0">
              <node concept="13iPFW" id="1wzo07Aq6fG" role="2Oq$k0" />
              <node concept="3TrcHB" id="1wzo07Aq6qB" role="2OqNvi">
                <ref role="3TsBF5" to="i2y7:2Vizpn2Mx$$" resolve="text" />
              </node>
            </node>
            <node concept="tyxLq" id="1wzo07Aq6FA" role="2OqNvi">
              <node concept="Xl_RD" id="1wzo07Aq6G1" role="tz02z">
                <property role="Xl_RC" value="echo" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="1wzo07Aq70x">
    <ref role="13h7C2" to="4vo2:1wzo07Aq70g" resolve="AtEchoCommandItem" />
    <node concept="13hLZK" id="1wzo07Aq70y" role="13h7CW">
      <node concept="3clFbS" id="1wzo07Aq70z" role="2VODD2">
        <node concept="3clFbF" id="1wzo07Aq70_" role="3cqZAp">
          <node concept="2OqwBi" id="1wzo07Aq7dx" role="3clFbG">
            <node concept="2OqwBi" id="1wzo07Aq72y" role="2Oq$k0">
              <node concept="13iPFW" id="1wzo07Aq70$" role="2Oq$k0" />
              <node concept="3TrcHB" id="1wzo07Aq77a" role="2OqNvi">
                <ref role="3TsBF5" to="i2y7:2Vizpn2Mx$$" resolve="text" />
              </node>
            </node>
            <node concept="tyxLq" id="1wzo07Aq7j5" role="2OqNvi">
              <node concept="Xl_RD" id="1wzo07Aq7jw" role="tz02z">
                <property role="Xl_RC" value="@echo" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="1wzo07AqayR">
    <ref role="13h7C2" to="4vo2:1wzo07AqayQ" resolve="RemoveCommandItem" />
    <node concept="13hLZK" id="1wzo07AqayS" role="13h7CW">
      <node concept="3clFbS" id="1wzo07AqayT" role="2VODD2">
        <node concept="3clFbF" id="1wzo07AqayV" role="3cqZAp">
          <node concept="2OqwBi" id="1wzo07AqaMa" role="3clFbG">
            <node concept="2OqwBi" id="1wzo07Aqa_f" role="2Oq$k0">
              <node concept="13iPFW" id="1wzo07AqayU" role="2Oq$k0" />
              <node concept="3TrcHB" id="1wzo07AqaEP" role="2OqNvi">
                <ref role="3TsBF5" to="i2y7:2Vizpn2Mx$$" resolve="text" />
              </node>
            </node>
            <node concept="tyxLq" id="1wzo07AqaRI" role="2OqNvi">
              <node concept="Xl_RD" id="1wzo07AqaS9" role="tz02z">
                <property role="Xl_RC" value="rm" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="1wzo07AqaSW">
    <ref role="13h7C2" to="4vo2:1wzo07AqaSV" resolve="CopyCommandItem" />
    <node concept="13hLZK" id="1wzo07AqaSX" role="13h7CW">
      <node concept="3clFbS" id="1wzo07AqaSY" role="2VODD2">
        <node concept="3clFbF" id="1wzo07AqaT0" role="3cqZAp">
          <node concept="2OqwBi" id="1wzo07Aqb8f" role="3clFbG">
            <node concept="2OqwBi" id="1wzo07AqaVk" role="2Oq$k0">
              <node concept="13iPFW" id="1wzo07AqaSZ" role="2Oq$k0" />
              <node concept="3TrcHB" id="1wzo07Aqb0U" role="2OqNvi">
                <ref role="3TsBF5" to="i2y7:2Vizpn2Mx$$" resolve="text" />
              </node>
            </node>
            <node concept="tyxLq" id="1wzo07AqbdN" role="2OqNvi">
              <node concept="Xl_RD" id="1wzo07Aqbee" role="tz02z">
                <property role="Xl_RC" value="cp" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="1wzo07AqbeL">
    <ref role="13h7C2" to="4vo2:1wzo07AqbeK" resolve="SudoCommandItem" />
    <node concept="13hLZK" id="1wzo07AqbeM" role="13h7CW">
      <node concept="3clFbS" id="1wzo07AqbeN" role="2VODD2">
        <node concept="3clFbF" id="1wzo07AqbeP" role="3cqZAp">
          <node concept="2OqwBi" id="1wzo07Aqbva" role="3clFbG">
            <node concept="2OqwBi" id="1wzo07Aqbh9" role="2Oq$k0">
              <node concept="13iPFW" id="1wzo07AqbeO" role="2Oq$k0" />
              <node concept="3TrcHB" id="1wzo07AqbmJ" role="2OqNvi">
                <ref role="3TsBF5" to="i2y7:2Vizpn2Mx$$" resolve="text" />
              </node>
            </node>
            <node concept="tyxLq" id="1wzo07Aqb_o" role="2OqNvi">
              <node concept="Xl_RD" id="1wzo07AqbAt" role="tz02z">
                <property role="Xl_RC" value="sudo" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="1I2SOvk9_iR">
    <ref role="13h7C2" to="4vo2:1I2SOvk9_iQ" resolve="ChangeDirectoryCommandItem" />
    <node concept="13hLZK" id="1I2SOvk9_iS" role="13h7CW">
      <node concept="3clFbS" id="1I2SOvk9_iT" role="2VODD2">
        <node concept="3clFbF" id="1I2SOvk9_iV" role="3cqZAp">
          <node concept="2OqwBi" id="1I2SOvk9Bfu" role="3clFbG">
            <node concept="2OqwBi" id="1I2SOvk9_Eu" role="2Oq$k0">
              <node concept="13iPFW" id="1I2SOvk9_iU" role="2Oq$k0" />
              <node concept="3TrcHB" id="1I2SOvk9_K4" role="2OqNvi">
                <ref role="3TsBF5" to="i2y7:2Vizpn2Mx$$" resolve="text" />
              </node>
            </node>
            <node concept="tyxLq" id="1I2SOvk9Bl2" role="2OqNvi">
              <node concept="Xl_RD" id="1I2SOvk9Bm7" role="tz02z">
                <property role="Xl_RC" value="cd" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

