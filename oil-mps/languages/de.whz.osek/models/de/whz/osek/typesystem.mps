<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:4c3f0556-2304-431e-8716-2335d8e49087(de.whz.osek.typesystem)">
  <persistence version="9" />
  <languages>
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="bwbq" ref="r:aa04fc7a-6e20-48c4-b6ac-7c1ce8638ec4(de.whz.osek.structure)" implicit="true" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" implicit="true" />
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
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
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
      <concept id="1195213580585" name="jetbrains.mps.lang.typesystem.structure.AbstractCheckingRule" flags="ig" index="18hYwZ">
        <property id="1195213689297" name="overrides" index="18ip37" />
        <child id="1195213635060" name="body" index="18ibNy" />
      </concept>
      <concept id="1195214364922" name="jetbrains.mps.lang.typesystem.structure.NonTypesystemRule" flags="ig" index="18kY7G" />
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
              <node concept="3TrEf2" id="6g77ZYUpTKy" role="2OqNvi">
                <ref role="3Tt5mk" to="x27k:2VsHNE72zUU" />
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
</model>

