<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:4c3f0556-2304-431e-8716-2335d8e49087(de.whz.osek.typesystem)">
  <persistence version="9" />
  <languages>
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="0" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="4" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="2" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="mj1l" ref="r:c371cf98-dcc8-4a43-8eb8-8a8096de18b2(com.mbeddr.core.expressions.structure)" />
    <import index="bwbq" ref="r:aa04fc7a-6e20-48c4-b6ac-7c1ce8638ec4(de.whz.osek.structure)" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1188206331916" name="jetbrains.mps.baseLanguage.structure.Annotation" flags="ig" index="2ABs$o" />
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <property id="521412098689998745" name="nonStatic" index="2bfB8j" />
      </concept>
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ng" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
    </language>
    <language id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem">
      <concept id="1185788614172" name="jetbrains.mps.lang.typesystem.structure.NormalTypeClause" flags="ng" index="mw_s8">
        <child id="1185788644032" name="normalType" index="mwGJk" />
      </concept>
      <concept id="1175147569072" name="jetbrains.mps.lang.typesystem.structure.AbstractSubtypingRule" flags="ig" index="2sgdUx">
        <child id="1175147624276" name="body" index="2sgrp5" />
      </concept>
      <concept id="1175147670730" name="jetbrains.mps.lang.typesystem.structure.SubtypingRule" flags="ig" index="2sgARr" />
      <concept id="1195213580585" name="jetbrains.mps.lang.typesystem.structure.AbstractCheckingRule" flags="ig" index="18hYwZ">
        <property id="1195213689297" name="overrides" index="18ip37" />
        <child id="1195213635060" name="body" index="18ibNy" />
      </concept>
      <concept id="1195214364922" name="jetbrains.mps.lang.typesystem.structure.NonTypesystemRule" flags="ig" index="18kY7G" />
      <concept id="6405009306797516074" name="jetbrains.mps.lang.typesystem.structure.SubstituteTypeRule" flags="ig" index="3qnSWH">
        <child id="7323318266641100480" name="body" index="3hT0BD" />
      </concept>
      <concept id="1174642788531" name="jetbrains.mps.lang.typesystem.structure.ConceptReference" flags="ig" index="1YaCAy">
        <reference id="1174642800329" name="concept" index="1YaFvo" />
      </concept>
      <concept id="1174643105530" name="jetbrains.mps.lang.typesystem.structure.InferenceRule" flags="ig" index="1YbPZF">
        <child id="1193733919555" name="dependency" index="3K5x9m" />
      </concept>
      <concept id="1174648085619" name="jetbrains.mps.lang.typesystem.structure.AbstractRule" flags="ng" index="1YuPPy">
        <child id="1174648101952" name="applicableNode" index="1YuTPh" />
      </concept>
      <concept id="1174650418652" name="jetbrains.mps.lang.typesystem.structure.ApplicableNodeReference" flags="nn" index="1YBJjd">
        <reference id="1174650432090" name="applicableNode" index="1YBMHb" />
      </concept>
      <concept id="1174657487114" name="jetbrains.mps.lang.typesystem.structure.TypeOfExpression" flags="nn" index="1Z2H0r">
        <child id="1174657509053" name="term" index="1Z2MuG" />
      </concept>
      <concept id="1174658326157" name="jetbrains.mps.lang.typesystem.structure.CreateEquationStatement" flags="nn" index="1Z5TYs" />
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
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="1YbPZF" id="4B0n6H259rh">
    <property role="TrG5h" value="typeof_OilObjectRef" />
    <node concept="3clFbS" id="4B0n6H259ri" role="18ibNy">
      <node concept="1Z5TYs" id="4B0n6H259AN" role="3cqZAp">
        <node concept="mw_s8" id="4B0n6H259Bw" role="1ZfhKB">
          <node concept="1Z2H0r" id="4B0n6H259Bs" role="mwGJk">
            <node concept="2OqwBi" id="4B0n6H259FY" role="1Z2MuG">
              <node concept="1YBJjd" id="4B0n6H259BL" role="2Oq$k0">
                <ref role="1YBMHb" node="4B0n6H259rk" resolve="oilObjectRef" />
              </node>
              <node concept="3TrEf2" id="4B0n6H259Q3" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:4B0n6H258gR" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4B0n6H259AQ" role="1ZfhK$">
          <node concept="1Z2H0r" id="4B0n6H259Sx" role="mwGJk">
            <node concept="1YBJjd" id="4B0n6H259Sy" role="1Z2MuG">
              <ref role="1YBMHb" node="4B0n6H259rk" resolve="oilObjectRef" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4B0n6H259rk" role="1YuTPh">
      <property role="TrG5h" value="oilObjectRef" />
      <ref role="1YaFvo" to="bwbq:4B0n6H25803" resolve="OilObjectRef" />
    </node>
  </node>
  <node concept="18kY7G" id="4EZxVF6oUP4">
    <property role="TrG5h" value="check_OsekExecutable" />
    <property role="18ip37" value="true" />
    <node concept="3clFbS" id="4EZxVF6oUP5" role="18ibNy" />
    <node concept="1YaCAy" id="4EZxVF6oUP7" role="1YuTPh">
      <property role="TrG5h" value="osekExecutable" />
      <ref role="1YaFvo" to="bwbq:4EZxVF6o_1Q" resolve="OsekExecutable" />
    </node>
  </node>
  <node concept="1YbPZF" id="6g77ZYUpPGv">
    <property role="TrG5h" value="typeof_ResourceDeclaration" />
    <property role="3GE5qa" value="Resource" />
    <node concept="3clFbS" id="6g77ZYUpPGw" role="18ibNy">
      <node concept="1ZobV4" id="6g77ZYUpPGA" role="3cqZAp">
        <node concept="mw_s8" id="6g77ZYUpQNq" role="1ZfhKB">
          <node concept="1Z2H0r" id="6g77ZYUpQU5" role="mwGJk">
            <node concept="2ShNRf" id="6g77ZYUpQUl" role="1Z2MuG">
              <node concept="3zrR0B" id="6g77ZYUpR0B" role="2ShVmc">
                <node concept="3Tqbb2" id="6g77ZYUpR0D" role="3zrR0E">
                  <ref role="ehGHo" to="bwbq:6g77ZYUpzdT" resolve="IResource" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="6g77ZYUpPGK" role="1ZfhK$">
          <node concept="1Z2H0r" id="6g77ZYUpPGG" role="mwGJk">
            <node concept="2OqwBi" id="6g77ZYUpPPz" role="1Z2MuG">
              <node concept="1YBJjd" id="6g77ZYUpPHC" role="2Oq$k0">
                <ref role="1YBMHb" node="6g77ZYUpPGy" resolve="resourceDeclaration" />
              </node>
              <node concept="3TrEf2" id="6g77ZYUpQKI" role="2OqNvi">
                <ref role="3Tt5mk" to="x27k:2VsHNE717Q8" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="6g77ZYUpPGy" role="1YuTPh">
      <property role="TrG5h" value="resourceDeclaration" />
      <ref role="1YaFvo" to="bwbq:6g77ZYUpC8T" resolve="ResourceDeclaration" />
    </node>
    <node concept="2ABs$o" id="6g77ZYUpPH1" role="3K5x9m">
      <property role="2bfB8j" value="true" />
      <property role="TrG5h" value="res" />
      <node concept="3Tm1VV" id="6g77ZYUpPH3" role="1B3o_S" />
    </node>
  </node>
  <node concept="1YbPZF" id="6g77ZYUpTaF">
    <property role="TrG5h" value="typeof_ResourceRef" />
    <property role="3GE5qa" value="Resource" />
    <node concept="3clFbS" id="6g77ZYUpTaG" role="18ibNy">
      <node concept="1ZobV4" id="6g77ZYUpTaM" role="3cqZAp">
        <node concept="mw_s8" id="6g77ZYUpTMB" role="1ZfhKB">
          <node concept="1Z2H0r" id="6g77ZYUpTMz" role="mwGJk">
            <node concept="2ShNRf" id="6g77ZYUpTMS" role="1Z2MuG">
              <node concept="3zrR0B" id="6g77ZYUpTTa" role="2ShVmc">
                <node concept="3Tqbb2" id="6g77ZYUpTTc" role="3zrR0E">
                  <ref role="ehGHo" to="bwbq:6g77ZYUpzdT" resolve="IResource" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="6g77ZYUpTaW" role="1ZfhK$">
          <node concept="1Z2H0r" id="6g77ZYUpTaS" role="mwGJk">
            <node concept="2OqwBi" id="6g77ZYUpTfD" role="1Z2MuG">
              <node concept="1YBJjd" id="6g77ZYUpTbd" role="2Oq$k0">
                <ref role="1YBMHb" node="6g77ZYUpTaI" resolve="resourceRef" />
              </node>
              <node concept="3TrEf2" id="58wCuMl1VJz" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:58wCuMl1UJ2" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="6g77ZYUpTaI" role="1YuTPh">
      <property role="TrG5h" value="resourceRef" />
      <ref role="1YaFvo" to="bwbq:1x4fgD956dR" resolve="ResourceRef" />
    </node>
  </node>
  <node concept="1YbPZF" id="4ENJhDtdAXw">
    <property role="TrG5h" value="typeof_Task" />
    <property role="3GE5qa" value="Task" />
    <node concept="3clFbS" id="4ENJhDtdAXx" role="18ibNy">
      <node concept="1ZobV4" id="4ENJhDtdB4R" role="3cqZAp">
        <node concept="mw_s8" id="4ENJhDtdBfq" role="1ZfhKB">
          <node concept="2ShNRf" id="4ENJhDtdBfm" role="mwGJk">
            <node concept="3zrR0B" id="4ENJhDtdBl9" role="2ShVmc">
              <node concept="3Tqbb2" id="4ENJhDtdBlb" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4ENJhDtdB55" role="1ZfhK$">
          <node concept="1Z2H0r" id="3tDp_yW602X" role="mwGJk">
            <node concept="2OqwBi" id="3tDp_yW607I" role="1Z2MuG">
              <node concept="1YBJjd" id="3tDp_yW603d" role="2Oq$k0">
                <ref role="1YBMHb" node="4ENJhDtdAXz" resolve="task" />
              </node>
              <node concept="3TrEf2" id="3tDp_yW60sr" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPF" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1ZobV4" id="4ENJhDtdAXB" role="3cqZAp">
        <node concept="mw_s8" id="4ENJhDtdBlE" role="1ZfhKB">
          <node concept="2ShNRf" id="4ENJhDtdBlA" role="mwGJk">
            <node concept="3zrR0B" id="4ENJhDtdBrp" role="2ShVmc">
              <node concept="3Tqbb2" id="4ENJhDtdBrr" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4ENJhDtdAXJ" role="1ZfhK$">
          <node concept="1Z2H0r" id="3tDp_yW60Gi" role="mwGJk">
            <node concept="2OqwBi" id="3tDp_yW60N2" role="1Z2MuG">
              <node concept="1YBJjd" id="3tDp_yW60Gj" role="2Oq$k0">
                <ref role="1YBMHb" node="4ENJhDtdAXz" resolve="task" />
              </node>
              <node concept="3TrEf2" id="3tDp_yW6182" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPJ" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1ZobV4" id="58wCuMkZK_7" role="3cqZAp">
        <node concept="mw_s8" id="58wCuMkZLic" role="1ZfhKB">
          <node concept="2ShNRf" id="58wCuMkZLi8" role="mwGJk">
            <node concept="3zrR0B" id="58wCuMkZMny" role="2ShVmc">
              <node concept="3Tqbb2" id="58wCuMkZMn$" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="58wCuMkZK__" role="1ZfhK$">
          <node concept="1Z2H0r" id="58wCuMkZK_x" role="mwGJk">
            <node concept="2OqwBi" id="58wCuMkZKGv" role="1Z2MuG">
              <node concept="1YBJjd" id="58wCuMkZK_Q" role="2Oq$k0">
                <ref role="1YBMHb" node="4ENJhDtdAXz" resolve="task" />
              </node>
              <node concept="3TrEf2" id="58wCuMkZLfk" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:58wCuMkZKxs" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4ENJhDtdAXz" role="1YuTPh">
      <property role="TrG5h" value="task" />
      <ref role="1YaFvo" to="bwbq:1x4fgD956cc" resolve="Task" />
    </node>
  </node>
  <node concept="1YbPZF" id="4ENJhDtdA24">
    <property role="TrG5h" value="typeof_AlarmAutostart" />
    <property role="3GE5qa" value="Timer" />
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
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPA" />
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
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPC" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4ENJhDtdA27" role="1YuTPh">
      <property role="TrG5h" value="alarmAutostart" />
      <ref role="1YaFvo" to="bwbq:7FCpXS_WSTn" resolve="AlarmAutostart" />
    </node>
  </node>
  <node concept="1YbPZF" id="4ENJhDtcXsb">
    <property role="TrG5h" value="typeof_Counter" />
    <property role="3GE5qa" value="Timer" />
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
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPc" />
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
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPv" />
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
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPy" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4ENJhDtcXse" role="1YuTPh">
      <property role="TrG5h" value="counter" />
      <ref role="1YaFvo" to="bwbq:5KtH1a6jX_3" resolve="Counter" />
    </node>
  </node>
  <node concept="1YbPZF" id="7ZTJPb1S2CG">
    <property role="TrG5h" value="typeof_COM" />
    <property role="3GE5qa" value="COM" />
    <node concept="3clFbS" id="7ZTJPb1S2CH" role="18ibNy">
      <node concept="1ZobV4" id="7ZTJPb1S2L7" role="3cqZAp">
        <node concept="mw_s8" id="7ZTJPb1S2Vx" role="1ZfhKB">
          <node concept="2ShNRf" id="7ZTJPb1S2Vt" role="mwGJk">
            <node concept="3zrR0B" id="7ZTJPb1S3VP" role="2ShVmc">
              <node concept="3Tqbb2" id="7ZTJPb1S3VR" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:477NaqBEMuv" resolve="FloatType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="7ZTJPb1S2Lh" role="1ZfhK$">
          <node concept="1Z2H0r" id="7ZTJPb1S2Ld" role="mwGJk">
            <node concept="2OqwBi" id="7ZTJPb1S2Nl" role="1Z2MuG">
              <node concept="1YBJjd" id="7ZTJPb1S2Ly" role="2Oq$k0">
                <ref role="1YBMHb" node="7ZTJPb1S2CJ" resolve="com" />
              </node>
              <node concept="3TrEf2" id="7ZTJPb1S2Uy" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:7ZTJPb1S2Cz" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="7ZTJPb1S2CJ" role="1YuTPh">
      <property role="TrG5h" value="com" />
      <ref role="1YaFvo" to="bwbq:1x4fgD956o9" resolve="COM" />
    </node>
  </node>
  <node concept="3qnSWH" id="62ww4MHp_Do">
    <property role="TrG5h" value="substituteType_EventMaskType" />
    <property role="3GE5qa" value="Event" />
    <node concept="3clFbS" id="62ww4MHp_Dq" role="3hT0BD">
      <node concept="3cpWs6" id="62ww4MHp_Dv" role="3cqZAp">
        <node concept="2ShNRf" id="62ww4MHp_DE" role="3cqZAk">
          <node concept="3zrR0B" id="62ww4MHp_Jq" role="2ShVmc">
            <node concept="3Tqbb2" id="62ww4MHp_Js" role="3zrR0E">
              <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="62ww4MHp_Dr" role="1YuTPh">
      <property role="TrG5h" value="eventMaskType" />
      <ref role="1YaFvo" to="bwbq:1JmJJmp3CpZ" resolve="EventMaskType" />
    </node>
  </node>
  <node concept="2sgARr" id="1Y5JHpRy20E">
    <property role="TrG5h" value="subtyping_ResourceType" />
    <property role="3GE5qa" value="Resource" />
    <node concept="3clFbS" id="1Y5JHpRy20F" role="2sgrp5">
      <node concept="3clFbF" id="1Y5JHpRy20N" role="3cqZAp">
        <node concept="2ShNRf" id="1Y5JHpRy20L" role="3clFbG">
          <node concept="3zrR0B" id="1Y5JHpRy26E" role="2ShVmc">
            <node concept="3Tqbb2" id="1Y5JHpRy26G" role="3zrR0E">
              <ref role="ehGHo" to="mj1l:7lNBHBNBzyt" resolve="UnsignedInt8tType" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="1Y5JHpRy20H" role="1YuTPh">
      <property role="TrG5h" value="resourceType" />
      <ref role="1YaFvo" to="bwbq:v5qeus8Gck" resolve="ResourceType" />
    </node>
  </node>
  <node concept="2sgARr" id="1Y5JHpRyzdZ">
    <property role="TrG5h" value="subtyping_TaskType" />
    <property role="3GE5qa" value="Task" />
    <node concept="3clFbS" id="1Y5JHpRyze0" role="2sgrp5">
      <node concept="3clFbF" id="1Y5JHpRyzeo" role="3cqZAp">
        <node concept="2ShNRf" id="1Y5JHpRyzem" role="3clFbG">
          <node concept="3zrR0B" id="1Y5JHpRyzkf" role="2ShVmc">
            <node concept="3Tqbb2" id="1Y5JHpRyzkh" role="3zrR0E">
              <ref role="ehGHo" to="mj1l:7lNBHBNB4PU" resolve="UnsignedIntType" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="1Y5JHpRyze2" role="1YuTPh">
      <property role="TrG5h" value="taskType" />
      <ref role="1YaFvo" to="bwbq:1Y5JHpRyzdS" resolve="TaskType" />
    </node>
  </node>
  <node concept="1YbPZF" id="2CJ7vlDPYg3">
    <property role="TrG5h" value="typeof_EventDeclaration" />
    <property role="3GE5qa" value="Event" />
    <node concept="3clFbS" id="2CJ7vlDPYg4" role="18ibNy">
      <node concept="1ZobV4" id="2CJ7vlDPYk4" role="3cqZAp">
        <node concept="mw_s8" id="2CJ7vlDPZ6j" role="1ZfhKB">
          <node concept="1Z2H0r" id="2CJ7vlDPZ6f" role="mwGJk">
            <node concept="2ShNRf" id="2CJ7vlDQ0ch" role="1Z2MuG">
              <node concept="3zrR0B" id="2CJ7vlDQ0oR" role="2ShVmc">
                <node concept="3Tqbb2" id="2CJ7vlDQ0oT" role="3zrR0E">
                  <ref role="ehGHo" to="bwbq:1x4fgD956iF" resolve="EventLiteral" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="2CJ7vlDPYke" role="1ZfhK$">
          <node concept="1Z2H0r" id="2CJ7vlDPYka" role="mwGJk">
            <node concept="2OqwBi" id="2CJ7vlDPYsk" role="1Z2MuG">
              <node concept="1YBJjd" id="2CJ7vlDPYkv" role="2Oq$k0">
                <ref role="1YBMHb" node="2CJ7vlDPYg6" resolve="eventDeclaration" />
              </node>
              <node concept="3TrEf2" id="2CJ7vlDPZ3V" role="2OqNvi">
                <ref role="3Tt5mk" to="x27k:2VsHNE717Q8" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="2CJ7vlDPYg6" role="1YuTPh">
      <property role="TrG5h" value="eventDeclaration" />
      <ref role="1YaFvo" to="bwbq:4B0n6H25BL_" resolve="EventDeclaration" />
    </node>
  </node>
</model>

