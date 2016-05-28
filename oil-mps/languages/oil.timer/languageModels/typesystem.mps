<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:cb28c78b-880d-44f8-b7c2-1a4cba3ed9a9(oil.timer.typesystem)">
  <persistence version="9" />
  <languages>
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="mj1l" ref="r:c371cf98-dcc8-4a43-8eb8-8a8096de18b2(com.mbeddr.core.expressions.structure)" implicit="true" />
    <import index="oo9t" ref="r:418b8b47-9721-4050-9bc9-93530e3b68a5(oil.timer.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
    </language>
    <language id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem">
      <concept id="1185788614172" name="jetbrains.mps.lang.typesystem.structure.NormalTypeClause" flags="ng" index="mw_s8">
        <child id="1185788644032" name="normalType" index="mwGJk" />
      </concept>
      <concept id="1195213580585" name="jetbrains.mps.lang.typesystem.structure.AbstractCheckingRule" flags="ig" index="18hYwZ">
        <child id="1195213635060" name="body" index="18ibNy" />
      </concept>
      <concept id="1174642788531" name="jetbrains.mps.lang.typesystem.structure.ConceptReference" flags="ig" index="1YaCAy">
        <reference id="1174642800329" name="concept" index="1YaFvo" />
      </concept>
      <concept id="1174643105530" name="jetbrains.mps.lang.typesystem.structure.InferenceRule" flags="ig" index="1YbPZF" />
      <concept id="1174648085619" name="jetbrains.mps.lang.typesystem.structure.AbstractRule" flags="ng" index="1YuPPy">
        <child id="1174648101952" name="applicableNode" index="1YuTPh" />
      </concept>
      <concept id="1174650418652" name="jetbrains.mps.lang.typesystem.structure.ApplicableNodeReference" flags="nn" index="1YBJjd">
        <reference id="1174650432090" name="applicableNode" index="1YBMHb" />
      </concept>
      <concept id="1174657487114" name="jetbrains.mps.lang.typesystem.structure.TypeOfExpression" flags="nn" index="1Z2H0r">
        <child id="1174657509053" name="term" index="1Z2MuG" />
      </concept>
      <concept id="1174660718586" name="jetbrains.mps.lang.typesystem.structure.AbstractEquationStatement" flags="nn" index="1Zf1VF">
        <child id="1174660783413" name="leftExpression" index="1ZfhK$" />
        <child id="1174660783414" name="rightExpression" index="1ZfhKB" />
      </concept>
      <concept id="1174663118805" name="jetbrains.mps.lang.typesystem.structure.CreateLessThanInequationStatement" flags="nn" index="1ZobV4" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1180636770613" name="jetbrains.mps.lang.smodel.structure.SNodeCreator" flags="nn" index="3zrR0B">
        <child id="1180636770616" name="createdType" index="3zrR0E" />
      </concept>
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
      </concept>
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="1YbPZF" id="4ENJhDtcXsb">
    <property role="TrG5h" value="typeof_Counter" />
    <node concept="3clFbS" id="4ENJhDtcXsc" role="18ibNy">
      <node concept="1ZobV4" id="4ENJhDtcY3g" role="3cqZAp">
        <node concept="mw_s8" id="4ENJhDtcY3C" role="1ZfhKB">
          <node concept="2ShNRf" id="4ENJhDtcY3$" role="mwGJk">
            <node concept="3zrR0B" id="4ENJhDtcZ2O" role="2ShVmc">
              <node concept="3Tqbb2" id="4ENJhDtcZ2Q" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4ENJhDtcY3j" role="1ZfhK$">
          <node concept="1Z2H0r" id="4ENJhDtcXsl" role="mwGJk">
            <node concept="2OqwBi" id="4ENJhDtcXNJ" role="1Z2MuG">
              <node concept="1YBJjd" id="4ENJhDtcXLZ" role="2Oq$k0">
                <ref role="1YBMHb" node="4ENJhDtcXse" resolve="counter" />
              </node>
              <node concept="3TrEf2" id="4ENJhDtcXUT" role="2OqNvi">
                <ref role="3Tt5mk" to="oo9t:78S7ngm5xPc" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1ZobV4" id="4ENJhDtd_MW" role="3cqZAp">
        <node concept="mw_s8" id="4ENJhDtd_VM" role="1ZfhKB">
          <node concept="2ShNRf" id="4ENJhDtd_VI" role="mwGJk">
            <node concept="3zrR0B" id="4ENJhDtdA1x" role="2ShVmc">
              <node concept="3Tqbb2" id="4ENJhDtdA1z" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4ENJhDtd_Nq" role="1ZfhK$">
          <node concept="1Z2H0r" id="4ENJhDtd_Nm" role="mwGJk">
            <node concept="2OqwBi" id="4ENJhDtd_Pu" role="1Z2MuG">
              <node concept="1YBJjd" id="4ENJhDtd_NF" role="2Oq$k0">
                <ref role="1YBMHb" node="4ENJhDtcXse" resolve="counter" />
              </node>
              <node concept="3TrEf2" id="4ENJhDtd_Ul" role="2OqNvi">
                <ref role="3Tt5mk" to="oo9t:78S7ngm5xPv" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1ZobV4" id="4ENJhDtd_yG" role="3cqZAp">
        <node concept="mw_s8" id="4ENJhDtd_EU" role="1ZfhKB">
          <node concept="2ShNRf" id="4ENJhDtd_EQ" role="mwGJk">
            <node concept="3zrR0B" id="4ENJhDtd_KD" role="2ShVmc">
              <node concept="3Tqbb2" id="4ENJhDtd_KF" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4ENJhDtd_z0" role="1ZfhK$">
          <node concept="1Z2H0r" id="4ENJhDtd_yW" role="mwGJk">
            <node concept="2OqwBi" id="4ENJhDtd__4" role="1Z2MuG">
              <node concept="1YBJjd" id="4ENJhDtd_zh" role="2Oq$k0">
                <ref role="1YBMHb" node="4ENJhDtcXse" resolve="counter" />
              </node>
              <node concept="3TrEf2" id="4ENJhDtd_DG" role="2OqNvi">
                <ref role="3Tt5mk" to="oo9t:78S7ngm5xPy" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4ENJhDtcXse" role="1YuTPh">
      <property role="TrG5h" value="counter" />
      <ref role="1YaFvo" to="oo9t:5KtH1a6jX_3" resolve="Counter" />
    </node>
  </node>
  <node concept="1YbPZF" id="4ENJhDtdA24">
    <property role="TrG5h" value="typeof_AlarmAutostart" />
    <node concept="3clFbS" id="4ENJhDtdA25" role="18ibNy">
      <node concept="1ZobV4" id="4ENJhDtdAg0" role="3cqZAp">
        <node concept="mw_s8" id="4ENJhDtdAhJ" role="1ZfhKB">
          <node concept="2ShNRf" id="4ENJhDtdAhF" role="mwGJk">
            <node concept="3zrR0B" id="4ENJhDtdAnu" role="2ShVmc">
              <node concept="3Tqbb2" id="4ENJhDtdAnw" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4ENJhDtdAg3" role="1ZfhK$">
          <node concept="1Z2H0r" id="3tDp_yW621W" role="mwGJk">
            <node concept="2OqwBi" id="3tDp_yW624G" role="1Z2MuG">
              <node concept="1YBJjd" id="3tDp_yW621X" role="2Oq$k0">
                <ref role="1YBMHb" node="4ENJhDtdA27" resolve="alarmAutostart" />
              </node>
              <node concept="3TrEf2" id="3tDp_yW62b7" role="2OqNvi">
                <ref role="3Tt5mk" to="oo9t:78S7ngm5xPA" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1ZobV4" id="4ENJhDtdAo6" role="3cqZAp">
        <node concept="mw_s8" id="4ENJhDtdAwc" role="1ZfhKB">
          <node concept="2ShNRf" id="4ENJhDtdAw8" role="mwGJk">
            <node concept="3zrR0B" id="4ENJhDtdA_V" role="2ShVmc">
              <node concept="3Tqbb2" id="4ENJhDtdA_X" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4ENJhDtdAon" role="1ZfhK$">
          <node concept="1Z2H0r" id="3tDp_yW62mJ" role="mwGJk">
            <node concept="2OqwBi" id="3tDp_yW62p_" role="1Z2MuG">
              <node concept="1YBJjd" id="3tDp_yW62mK" role="2Oq$k0">
                <ref role="1YBMHb" node="4ENJhDtdA27" resolve="alarmAutostart" />
              </node>
              <node concept="3TrEf2" id="3tDp_yW62w6" role="2OqNvi">
                <ref role="3Tt5mk" to="oo9t:78S7ngm5xPC" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4ENJhDtdA27" role="1YuTPh">
      <property role="TrG5h" value="alarmAutostart" />
      <ref role="1YaFvo" to="oo9t:7FCpXS_WSTn" resolve="AlarmAutostart" />
    </node>
  </node>
</model>

